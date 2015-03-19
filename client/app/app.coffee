'use strict'

angular.module 'taxPartyOnlineApp', [
  'ngCookies'
  'ngResource'
  'ngSanitize'
  'ngRoute'
  'ui.bootstrap'
  'doowb.angular-pusher'
  'luegg.directives'
  'angularMoment'
]
.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .otherwise
    redirectTo: '/'

  $locationProvider.html5Mode true

.config (PusherServiceProvider) ->
  PusherServiceProvider.setToken('12efb0b7d2bf512b60d2').setOptions({});
