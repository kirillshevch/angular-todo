angular.module('todoApp').controller('SessionsCtrl', ['$scope', 'Auth', '$location', 'List',
  ($scope, Auth, $location, List) ->
    if Auth._currentUser
      $location.path('/')

    $scope.logout = ->
      Auth.logout().then ((oldUser) ->
        $location.path "/sign_up"
      ), (error) ->

    $scope.signinData = {}
    $scope.signIn = ->
      Auth.login($scope.signinData).then ((user) ->
        List.index '',
          (response)->
            alert(response)
        $location.path "/"
      ), (error) ->
        $scope.error = error

])