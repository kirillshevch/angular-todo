angular.module('todoApp').controller('SessionsCtrl', ['$scope', 'Auth', '$location',
  ($scope, Auth, $location) ->
    if Auth._currentUser
      $location.path('/')

    $scope.logout = ->
      Auth.logout().then ((oldUser) ->
        $location.path "/sign_up"
      ), (error) ->

    $scope.signinData = {}
    $scope.signIn = ->
      Auth.login($scope.signinData).then ((user) ->
        $location.path "/"
      ), (error) ->

])