angular.module('todoApp').controller('MainCtrl', ['$scope', 'Auth', '$location', 'List'
  ($scope, Auth, $location, List) ->
    Auth.currentUser().then ((user) ->
      isAuthenticated = true
      List.index '',
        (response)->
          $scope.lists = response
      $scope.user = Auth._currentUser
      $location.path('/')
    ), (error) ->

])