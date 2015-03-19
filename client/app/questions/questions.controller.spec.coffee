'use strict'

describe 'Controller: QuestionsCtrl', ->

  # load the controller's module
  beforeEach module 'taxPartyOnlineApp'
  QuestionsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    QuestionsCtrl = $controller 'QuestionsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
