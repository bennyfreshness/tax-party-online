'use strict'

angular.module 'taxPartyOnlineApp'
.controller 'ChatCtrl', ($scope) ->

  $scope.messages = [
    user:
      display_name: 'jonchay',
      avatar_url: 'https://randomuser.me/api/portraits/med/men/85.jpg',
    created_at: '10:40pm'
    type: 'comment'
    body: 'How you doing?'
  ,
    user:
      display_name: 'peinee',
      avatar_url: 'https://randomuser.me/api/portraits/med/women/85.jpg',
    created_at: '10:40pm'
    type: 'answer'
    body: "I'm doing good!"
  ]
