angular.module('todoApp').controller('MainCtrl', ['$scope', 'Auth', '$location',
  ($scope, Auth, $location) ->
    Auth.currentUser().then ((user) ->
      isAuthenticated = true
      $scope.user = Auth._currentUser
      $location.path('/')
    ), (error) ->

])