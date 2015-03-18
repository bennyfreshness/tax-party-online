'use strict'

angular.module 'taxPartyOnlineApp'
.controller 'MainCtrl', ($scope, $http, Pusher) ->
  $scope.awesomeThings = []

  chatWidget = new PusherChatWidget(Pusher,
    appendTo: '#pusher-chat-widget'
    chatEndPoint: '/chat'
  )

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings

