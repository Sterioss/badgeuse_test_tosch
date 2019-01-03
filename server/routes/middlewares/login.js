require ('../../config/database');
let bcrypt = require('bcrypt');
let jwt = require('jsonwebtoken');
let config = require('../../config/config');

module.exports = function(router) {

    //on reçoit les données envoyer par Angular dans 'req'.
    //on renvoie les données vers angular dans 'res'.
    router.post('/', (req, res) => {

        const action = req.body.action;

        switch (action) {

            // CHECK THE CONNECTION OF USER
            case 'tryConnect':
                const passForm = req.body.password.trim();
                const usermailForm = req.body.username.trim();

                // Password and Usermail min/max length
                const passLengthMin = 5,
                    passLengthMax = 255,
                    usernameLengthMin = 5,
                    usernameLengthMax = 255;

                if (usermailForm.length >= usernameLengthMin && usermailForm.length <= usernameLengthMax) {
                    if (passForm.length >= passLengthMin && passForm.length <= passLengthMax) {
                        // Read the Sql table if the userMail exist
                        db.query('SELECT * FROM account WHERE userMail=?', [usermailForm], (err, result) => {

                            if (err) {
                                res.json
                                ({
                                    success: false,
                                    message: "Une erreur est survenue, veuillez reéssayer ultérieurement."
                                });
                                throw err;
                            }

                            if (result.length !== 0) {

                                let passDb = result[0].userPass;

                                bcrypt.compare(passForm, passDb, (error, isMatch) => {
                                    if (!isMatch) {
                                        res.json({success: false, message: "Le mot de passe est incorrect !"});
                                    } else {
                                        const token = jwt.sign({userId: result[0].id}, config.auth.SECRET_KEY, {expiresIn: '1h'});
                                        res.json({
                                            success: true,
                                            message: "Vous allez être redirigé dans quelques instants.",
                                            token: token,
                                            user: {username: result[0].userFirstName, email: result[0].userMail}
                                        });
                                    }
                                });
                            } else{
                                res.json({success: false, message: "Le nom de compte n'éxiste pas !"});
                            }
                        });
                    } else {
                        res.json({
                            success: false,
                            message: "Le mot de passe doit avoir un minimum de " + passLengthMin + " caractères et ne doit pas dépasser " + passLengthMax + " caractères !"
                        });
                    }
                } else {
                    res.json({
                        success: false,
                        message: "Le nom d'utilisateur doit avoir un minimum de " + passLengthMin + " caractères et ne doit pas dépasser " + passLengthMax + " caractères !"
                    });
                }
            break;
        }
    });
}