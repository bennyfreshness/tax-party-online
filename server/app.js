/**
 * Main application file
 */

'use strict';

// Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var express = require('express');
var config = require('./config/environment');
// Setup server
var app = express();
var server = require('http').createServer(app);
require('./config/express')(app);
require('./routes')(app);

var bodyParser = require("body-parser");
var errorHandler = require("errorhandler");
var escapeHTML = require("escape-html");
var Activity = require("./Activity");

var root = __dirname + "/..";

// --------------------------------------------------------------------
// SET UP PUSHER
// --------------------------------------------------------------------
var Pusher = require("pusher");
var pusher = new Pusher({
  appId: process.env.app_id,
  key: process.env.key,
  secret: process.env.secret
});

// --------------------------------------------------------------------
// SET UP EXPRESS
// --------------------------------------------------------------------

// Parse application/json and application/x-www-form-urlencoded
app.use(bodyParser());

// Simple logger
app.use(function(req, res, next){
  console.log("%s %s", req.method, req.url);
  next();
});

// Error handler
app.use(errorHandler({
  dumpExceptions: true,
  showStack: true
}));

// Serve static files from directory
app.use(express.static(root));

app.post("/chat", function(req, res){
  var options = req.body;
  var activity = new Activity("chat-message", options["text"], options, function(result) {
    var data = result.getMessage();

    // Trigger message
    var response = pusher.trigger("question", "chat_message", data);

    var status = 200;
    var body = {"activity": data, "pusherResponse": response};

    res.setHeader("Cache-Control", "no-cache, must-revalidate");
    res.setHeader("Content-Type", "application/json");

    res.send(status, body);
  });
});

// Open server on specified port
app.listen(4567);

// Start server
server.listen(config.port, config.ip, function () {
  console.log('Express server listening on %d, in %s mode', config.port, app.get('env'));
});

app.locals.icon = function(icon){ return '<i class="fa fa-' + icon + '"></i>'; };

// Expose app
exports = module.exports = app;
