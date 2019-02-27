const ipLocal = require('ip');

/**
 * Generate random key id for the user connection, please don't touch
 * @returns {string}
 */
function makeId() {
    let text = "";
    const possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (let i = 0; i < 5; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
}

/**
 * Define the listen port et multi cross origin request
 * @type {{PORT_EXPRESS: number, HOST_ANGULAR: (*|*), SECRET_KEY: string}}
 */
const AUTH = {
    PORT_EXPRESS : 8080, // use for listen this port on backend
    HOST_ANGULAR : ipLocal.address(), // use for multi-cross origin request with client
    SECRET_KEY: makeId() // secret key for token crypt
};


/**
 * only use for dev
 * DELETE ALL THIS ON FINAL PROD
 * @type {{PORT_ANGULAR: number, HOST_EXPRESS: (*|*)}}
 */
const AUTHDEV = {
    PORT_EXPRESS : 8080, // use for listen this port on backend
    HOST_ANGULAR : 'localhost:4200', // use for multi-cross origin request with client
    SECRET_KEY: makeId() // secret key for token crypt
};


/**
 * export AUTH attribute
 * -----------------------------------------------------------------
 * for developpement. Comment and uncomment the line of ip of you need
 * DELETE 'exports.auth = AUTHDEV;' ON FINAL PROD
 */
// exports.auth = AUTH;
exports.auth = AUTHDEV;
