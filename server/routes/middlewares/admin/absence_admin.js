require ('../../../config/database');

module.exports = function(router) {

    router.post('/', (req, res) => {


        const action = req.body.action;

        switch (action) {

             // GET ABSENCE LIST FOR ADMIN
             case 'getUserListAbsence':

                 db.query('SELECT ' +
                     'CONCAT(users.nom_user, \' \', users.prenom_user) AS absName, ' +
                     '' +
                     'absences.ref_absence AS ref, ' +
                     'MIN(absences.absence_date) AS minDate, ' +
                     'MAX(absences.absence_date) AS maxDate, ' +
                     'absences.half_day AS halfDay, ' +
                     'absences.comment_absences as comment, ' +
                     'absences.certificate as certificate, ' +
                     '' +
                     'reason.nom_reason AS absReason ' +
                     '' +
                     'FROM absences ' +
                     '' +
                     'INNER JOIN users ON absences.id_user = users.id_user ' +
                     'INNER JOIN reason ON absences.id_reason = reason.id_reason ' +
                     'WHERE id_status = 2 ' +
                     '' +
                     'GROUP BY ref ' +
                     '' +
                     'ORDER BY ref'
                     , (err, rows) => {
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
                    });
                break;

            case 'getUpdateAbsence':
                const ref = req.body.ref;
                const valide = req.body.valide;

                const content = [[valide], [ref]];
                db.query('UPDATE absences SET id_status = ? WHERE ref_absence = ?', content, (err) => {
                    if(err) {
                        res.json({success: false});
                        throw err;
                    } else {
                        res.json({success: true});
                    }
                });
                break
        }
    });
};
