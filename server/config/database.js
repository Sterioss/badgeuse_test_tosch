let mysql = require('mysql');

db = mysql.createPool(
    {
            host     : process.env.MYSQL_HOST || "127.0.0.1",
            port     : process.env.MYSQL_PORT || 3306,
            user     : process.env.MYSQL_USER || "uhaSQL",
            password : process.env.MYSQL_PASSWORD || "uha",
            database : process.env.MYSQL_DATABASE || "badgeuse",
            multipleStatements: true // ATTENTION CETTE INFORMATIONS PEUT-ETRE A LORIGINE DE GROS PROBLEMES
    });
