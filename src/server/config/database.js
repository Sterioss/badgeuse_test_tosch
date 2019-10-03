let mysql = require('mysql');

db = mysql.createPool(
    {
            host     : 'mariadb',
            port     : process.env.MYSQL_PORT,
            user     : process.env.MYSQL_USER,
            password : process.env.MYSQL_PASSWORD,
            database : process.env.MYSQL_DATABASE,
            multipleStatements: true // ATTENTION CETTE INFORMATIONS PEUT-ETRE A LORIGINE DE GROS PROBLEMES
    });
