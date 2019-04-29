require('../../../config/database');
const Errors = require('../../../error/errors');
const HttpStatus = require('http-status-codes');
const config = require('../../../config/config');
const winston = require('winston');
require('winston-daily-rotate-file');

const transport = new (winston.transports.DailyRotateFile)({
    filename: './server/log/%DATE%.log',
    datePattern: 'MMDD',
    zippedArchive: true,
    maxFiles: '7d',
});
const logger = winston.createLogger({
    format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.printf(i => `${i.timestamp} | ${i.message}`)
    ),
    transports: [
        transport
    ]
});


/**
 *  Receives an UUID from our RaspberryPi (or other devices
 *  from a student card.
 *  <br>Processes it into our DB to change user state.
 *  <br>No intermediate step like login.js.
 *  <br>Can't be accessed anywhere else than the Raspi
 * @param router {Express.Router} The router param comming from the Express service
 */
function uuid(router) {
    router.post('/', (request, response) => {
        if (request.ip.split(':').pop().localeCompare(config.raspi.HOST_RASPI || "127.0.0.1") !== 0) {
            console.log(request.ip.split(':').pop().localeCompare(config.raspi.HOST_RASPI));
            return response.status(HttpStatus.FORBIDDEN).send({message: "Access not authorized"});
        }

        const uuid_value = request.body.uuid;

        // Promise chain that will wait each step for the previous action before continuing
        getUserId(uuid_value)
            .then((id) => {
                return isPresent(id); // retuns present state and id
            })
            .then((result) => {
                return setPresence(result[0], result[1]) // returns true if success and message in second part
            })
            .then((result) => {
                response.status(HttpStatus.OK).send({message: result[0] ? result[1] ? "User is now Logged off" : "User is now Logged on" : "Failed"})
            })
            .catch((err) => {
                logger.info("UUID : " + uuid_value + ". " + err); // log to our file
                Errors.dbError(err, response)
            });
    })
}

/**
 * Checks if the DB contains user for a given uuid then returns it.
 * @param uuid_value {!number} the user card value
 * @returns Promise<any> {!number} id of the User from the given UUID
 */
function getUserId(uuid_value) {
    return new Promise((resolve, reject) => {
        db.query('SELECT u.id_user FROM `users` u INNER JOIN `users_extend` ue ON ue.id_user = u.id_user ' +
            'WHERE ue.card = ?', [uuid_value],
            (err, results) => {
                try {
                    resolve(results[0].id_user);
                } catch (err) {
                    reject(err);
                }
            }
        );
    })
}


/**
 *  Switching the user (identified by it's id) presence state.
 * @param presence {boolean} Boolean that tells whether to set 'present' or 'absent'
 * @param id {!number} User id comming from initial UUID
 * @returns {Promise<Boolean>} a Boolean whether the query worked or not
 */
function setPresence(presence, id) {
    return new Promise((resolve, reject) => {
        // Case the user is already logged in
        if (presence) {
            db.query('UPDATE badger ' +
                'SET ' +
                'end_point = CURRENT_TIMESTAMP, ' +
                'duration = IF(' +
                'IF(HOUR(start_point) < 12,1,0) = 1 ' +
                'AND IF(HOUR(CURRENT_TIME) > 14,1,0) = 1,' +
                'TIMEDIFF( DATE_ADD(end_point, INTERVAL -1 HOUR), start_point),' +
                'TIMEDIFF( end_point, start_point )) ' +
                '' +
                'WHERE start_point > CURRENT_DATE AND id_user = ? ' +
                'AND end_point is NULL ', [id],
                (err, results) => {
                    try {
                        resolve([results, presence]);
                    } catch (err) {
                        return reject(err);
                    }
                });
            // Case the user is logged off
        } else {
            // we add a new entry into our badger table
            db.query('INSERT INTO badger(id_user) VALUES (?)', [id],
                (err, results) => {
                    try {
                        resolve([results, presence])
                    } catch (err) {
                        return reject(err);
                    }
                });
        }
    })
}


/**
 *  This function will check from the table 'badger' that our user (known from id) isn't currently present.
 *  <br>It'll check for current_date for forgotten 'absent' the previous day
 * @param id {!number} the user id
 * @returns {Promise<Boolean>} a Boolean of the user state (present or not) and the user id (to pass it further)
 */
function isPresent(id) {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM `badger` WHERE id_user = ? AND start_point > CURRENT_DATE AND end_point IS NULL ' +
            'ORDER BY id_point DESC LIMIT 1', [id],
            (err, results) => {
                try {
                    resolve([results.length, id]);
                } catch (err) {
                    return reject(err);
                }
            })
    })
}

module.exports = uuid;
