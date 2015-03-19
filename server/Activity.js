var _ = require("underscore");
var UUID = require("uuid");
var moment = require("moment");
var gravatar = require("gravatar");

var Activity = function(activityType, actionText, options, callback) {
  var self = this;

  self.options = options
  self.id = UUID.v1();
  self.created_at = moment().format("ddd, DD MMM YYYY HH:mm:ss ZZ");

  callback(self);
};

Activity.prototype.getMessage = function() {
  var activity = {
    "id": this.id,
    "body": this.options.body,
    "createdAt": this.created_at,
    "user": this.options.user
  };

  return activity;
};

exports = module.exports = Activity;
