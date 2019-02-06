require ('../../../config/database');
const isDateFormat = require('is-date-format');
const Entities = require('html-entities').AllHtmlEntities;
const  DateDiff = require('date-diff');

module.exports = function(router) {

    router.post('/', (req, res) => {

        const action = req.body.action;

        switch (action) {

        // GET REASON DATA
            case 'getReason':
                db.query('SELECT * FROM reason ORDER BY id_reason', (err, rows) => {
                    if(err) {
                        res.json({
                            success: false
                        });
                        throw err;
                    } else {
                        res.json({
                            success: true,
                            list: rows
                        });
                    }
                })

            break

        // REQUEST ABSENCE TO DB
            case 'absenceRequest':
                let err = '';
                let currDate = new Date; // current date
                let id_user = Number(req.body.id_user);
                let reason = Number(req.body.reason);
                let startDate = req.body.startDate;
                let endDate = req.body.endDate;
                let dateOnly = req.body.dateOnly;
                let halfDay = req.body.halfDay;
                let comment = req.body.comment;

            // CHECK ALL DATA FROM FORMULAR
                if(reason && Number.isInteger(reason)) {}
                    else {err += '[reason] ';}

                // check the date format
                if(startDate && isDateFormat(startDate, 'yyyy-mm-dd')) {startDate = new Date(startDate.trim());}
                    else {if(startDate !== null){ err += '[startDate] ';}}

                // check the date format
                if(endDate && isDateFormat(endDate, 'yyyy-mm-dd')) {endDate = new Date(endDate.trim());}
                    else {if(endDate !== null){ err += '[endDate] ';}}

                // check the date format and if dateOnly is not null, set the startDate, endDate.
                if(dateOnly && isDateFormat(dateOnly, 'yyyy-mm-dd')) {dateOnly = new Date(dateOnly.trim()); startDate = dateOnly; endDate = dateOnly;}
                    else {if(dateOnly !== null){ err += '[dateOnly] ';}}

                // check the halfDay variable
                if(halfDay === true || halfDay === false || halfDay === null) {if(halfDay === true){halfDay = 0;} else if(halfDay === false || halfDay === null){halfDay = 1;}}
                    else {
                    err += '[halfDay] ';
                }

                // convertie les éventuel balise HTML en texte
                if(comment) {comment = Entities.encode(comment.trim());}
                if(comment === ''){comment = null;}

                // vérifie que la date de fin soit supérieur à la date de début
                if(dateOnly === null) {
                    if (endDate <= startDate) {
                        err += '[La 1ere date doit être supérieur à la dernière date] ';
                    }
                }

                // vérifie que lorsque le status est "malade", que les date ne soit pas supérieur à la date d'aujourd'hui
                if(reason === 1 && (startDate > currDate || endDate > currDate)) {err += '[Vous ne pouvez pas justifier une maladie futur]';}

                // vérifie le nombre de caractère de commentaire
                if(comment !== null && comment.length > 512){err += '[Nombre de caractère dépassé dans commentaire] ';}

            // IF NO ERROR
                if(err === '') {
                    // check if date selected isn't to db
                    let check = [
                        [id_user],
                        [new Date(startDate).toISOString()],
                        [new Date(endDate).toISOString()]
                    ];
                    db.query('SELECT * FROM absences WHERE id_user = ? AND id_status > 0 AND absence_date BETWEEN ? AND ?', check, (err,rows)=>{

                       if(rows.length === 0){
                        db.query('SELECT MAX(ref_absence) AS max_ref FROM absences', (err, rows) => { // check the last reference

                        // DEFINE DATA FOR DB

                            // set the new reference of absence
                            let newRef = rows[0].max_ref + 1;

                            // set the end Day for endDate
                            endDate = new Date(endDate.setHours(23,59,59,0));

                            // date difference
                            let entryNumber = new DateDiff(endDate, startDate);

                            // number of day
                            entryNumber = Number(entryNumber.days());

                            // only for 1 day
                            if(entryNumber === 0){entryNumber = 1;}

                            // for count in the loop
                            let entryCount = 0;


                        // Loop for every day selected
                            for (let i = 0; i < entryNumber; i++) {
                                let otherDate = new Date(startDate);
                                let newDate = new Date(otherDate.setDate(startDate.getDate() + i));

                            // INSERT TO DB
                                let content = [[id_user], [newRef], [2], [newDate], [halfDay], [reason], [comment], [null]];
                                db.query('INSERT INTO absences(id_user, ref_absence, id_status, absence_date, half_day, id_reason, comment_absences, certificate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
                                    content, (err) => {
                                        if (err) {
                                            res.json({
                                                success: false,
                                                message: 'Nous avons eu un souçis avec la base de données.'
                                            });
                                            throw err;
                                        } else {
                                            entryCount++;
                                            if (entryCount === entryNumber) {
                                                res.json({
                                                    success: true,
                                                    message: 'Votre justification à été soumis. Un administrateur se chargera de la valider ou de la refuser.'
                                                });
                                            }
                                        }
                                    });
                            }
                        });
                       } else {
                           res.json({
                               success: false,
                               message: 'Vous avez déjà une justification validé ou en attente aux dates choisie '
                           });
                       }
                    });
                } else {
                    res.json({
                        success: false,
                        message: 'Une des données saisie n\'est pas valide: '+err
                    });
                }
            break
        }
    });
};