'use strict'

Pusher.log = (message) ->
  window.console.log(message) if (window.console && window.console.log)

angular.module 'taxPartyOnlineApp'
.config ($routeProvider) ->
  $routeProvider
  .when '/',
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
