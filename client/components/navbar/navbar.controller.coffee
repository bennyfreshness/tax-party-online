'use strict'

angular.module 'taxPartyOnlineApp'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.questions = window.QUESTION_MODEL

  $scope.isActive = (route) ->
    route is $location.path()
