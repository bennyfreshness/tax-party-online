'use strict'

describe 'Controller: ChatCtrl', ->

  # load the controller's module
  beforeEach module 'taxPartyOnlineApp'
  ChatCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ChatCtrl = $controller 'ChatCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
