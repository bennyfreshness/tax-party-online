'use strict'

angular.module 'taxPartyOnlineApp'
.config ($routeProvider) ->
  $routeProvider.when '/questions',
    templateUrl: 'app/questions/questions.html'
    controller: 'QuestionsCtrl'

  $routeProvider.when '/questions/:id',
    templateUrl: 'app/questions/questions.html'
    controller: 'QuestionsCtrl'
