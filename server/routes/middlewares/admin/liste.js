require ('../../../config/database');
let tokenList = require ('../../../config/tokenList');
const Errors = require('../../../error/errors');
const HttpStatus = require('http-status-codes');


function dbError(err, from, res) {
    if (err instanceof Errors.NotFound) {
        // Returns a 404 with err.message in payload
        return res.status(HttpStatus.NOT_FOUND).send({status: 404, message: err.message, from: from}); // 404
    }
    // else it must be a 500, db error
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).send({status: 500, message: err.message, from: from}); // 500
}


module.exports = function(router) {

    router.post('/', (req, res) => {

        if(tokenList.checkToken(req.body.token)) {

            const action = req.body.action;
            const content = req.body.content;

            switch (action) 
            {
                // Get the user list for see the presence
                case 'getUserList':
                    db.query('SELECT ' +
                        'users.id_user AS userId, ' +
                        'CONCAT(users.nom_user, \' \', users.prenom_user) AS userName, ' +
                        'IF(badger.id_point IS NULL,0,1) AS presence ' +
                        '' +
                        'FROM users ' +
                        '' +
                        'INNER JOIN users_extend ON users.id_user = users_extend.id_user ' +
                        'LEFT JOIN (SELECT * FROM badger WHERE end_point IS NULL AND start_point > CURRENT_DATE) badger ON users.id_user = badger.id_user ' +
                        '' +
                        // 'GROUP BY userId ' +
                        '' +
                        'ORDER BY userName'
                        , content, (err, rows) => {
                            if (err) {
                                res.json({
                                    success: false,
                                    message: 'Une erreur est survenue lors de la requête vers la base de données.'
                                });
                                throw err;
                            }

                            if (rows.length > 0) {
                                res.json({
                                    success: true,
                                    list: rows
                                });
                            } else {
                                res.json({
                                    success: false,
                                    message: "Nous n'avons rien trouver dans la base de données."
                                });
                            }
                        });
                break;
                
                // Add user into the db on the users table
                case 'addUserinList':
                    db.query('INSERT INTO users(prenom_user, nom_user, mail_user, id_role) VALUES(?, ?, ?, ?) ',
                        content, (err, rows) => {
                            if (err) {
                                dbError(err, "addUserinList", rows)
                                }

                            if (rows.length > 0) {
                                res.json({
                                    success: true,
                                    list: rows
                                });
                            } else {
                                res.json({
                                    success: false,
                                    message: "Nous n'avons rien ajouté dans la base de données."
                            });
                            }   
                        });
                break;

                // Edit user into the db on the users table
                case 'updateUserinList':
                    db.query('UPDATE users SET (users.id_user, users.prenom_user, users.nom_user, users.mail_user, users.id_role) VALUES(?)',
                        content, (err, rows) => {
                            if (err) {
                                res.json({
                                    success: false,
                                    message: 'Une erreur est survenue lors de la requête vers la base de données.'
                                });
                                throw err;
                                }
                            if (rows.length > 0) {
                                res.json({
                                    success: true,
                                    list: rows
                                });
                            } else {
                                res.json({
                                    success: false,
                                    message: "Nous n'avons pas pû mettre à jours l'utilisateurs."
                            });
                            }
                        });
                break

                // Delete user into the db on the users table
                case 'deleteUserinList':
                    db.query('DELETE FROM users WHERE ref_user = ?', 
                        content, (err) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: 'Une erreur est survenue lors de la requête vers la base de données.'
                            });
                            throw err;
                            }
                        if (rows.length > 0) {
                            res.json({
                                success: true,
                                list: rows
                            });
                        } else {
                            res.json({
                                success: false,
                                message: "Nous n'avons rien ajouté dans la base de données."
                        });
                        }   
                    });
                break
            }

        } else {
            res.send('Vous n\'avez rien à faire ici !');
        }

    });
};