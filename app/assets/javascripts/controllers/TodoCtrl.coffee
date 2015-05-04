angular.module('todoApp').controller('TodoCtrl', ['Auth', '$location', '$scope', 'List', 'ngToast',
  (Auth, $location, $scope, List, ngToast)->
    if (Auth._currentUser == null)
      $location.path('/sign_up')

    $scope.addList = ->
      List.create '', (response)->
        $scope.lists.unshift(response)

    $scope.deleteList = (list)->
      List.delete
        id: list.id
          , ->
            $scope.lists.splice($scope.lists.indexOf(list), 1)

    $scope.editList = (list)->
      if list.edit
        list.edit = false
      else
        list.edit = true
        list.nameFeature = list.name

    $scope.updateList = (list)->
      if list.nameFeature != undefined
        List.update
          id: list.id, name: list.nameFeature
            , ->
              list.name = list.nameFeature
              list.edit = false
          , (error)->
            ngToast.create
              className: 'danger'
              content: 'Task ' + error.data.name
      else
        ngToast.create
          className: 'danger'
          content: 'List name can\'t be blank'
])