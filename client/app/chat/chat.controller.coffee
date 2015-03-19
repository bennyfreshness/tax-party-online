'use strict'

angular.module 'taxPartyOnlineApp'
.controller 'ChatCtrl', ($scope, Pusher, $http) ->

  $scope.newMessage = {}

  $scope.messages = [
    user:
      displayName: 'jonchay',
      avatarUrl: 'https://randomuser.me/api/portraits/med/men/85.jpg',
    createdAt: 'Thu, 19 Mar 2015 00:45:05 -0700'
    type: 'comment'
    body: 'How you doing?'
  ,
    user:
      displayName: 'peinee',
      avatarUrl: 'https://randomuser.me/api/portraits/med/women/85.jpg',
    createdAt: 'Thu, 19 Mar 2015 00:45:05 -0700'
    type: 'answer'
    body: "I'm doing good! Busy filing that tax return!"
  ]

  Pusher.subscribe('question', 'chat_message', (data) -> $scope.messages.push(data) )

  $scope.sendMessage = (message) ->
    return if message.body == ''
    $http.post('/chat',
      user:
        displayName: 'intuit'
        avatarUrl: 'http://static.sched.org/a3/949610/avatar.jpg.100x100px.jpg'
      type: 'comment'
      body: message.body
    )
    $scope.messages.shift() if $scope.messages.length > 20
    $scope.newMessage.body = ''
