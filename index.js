let express    = require('express'),
    app        = express(),
    bodyParser = require('body-parser'),
    cors       = require('cors'),
    config     = require('./server/config/config');

// required only to send cross data from frontend to backend
/*
app.use(cors({
    origin : 'http://'+ config.auth.HOST_ANGULAR,
    credentials: true
}));
*/
app.use(cors({
    origin : `badgeuse-web:${config.auth.PORT_ANGULAR}`,
    //origin : `http://${config.auth.HOST_ANGULAR}`,
    credentials: true
}));

// Socket.io app
require('./server/config/socket')(app);

// Parse Application to Json
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Routing
require('./server/routes/index')(app);

// Listening port of the server
app.listen(config.auth.PORT_EXPRESS, () => {
    if(process.env.PORT_BACK)
        console.log(`Badgeuse app started on port ${process.env.PORT_BACK}`);
    else
        console.log('Badgeuse app started on port 8080');
});

console.log('=============================')
