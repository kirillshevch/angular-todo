angular.module('todoApp').controller('SessionsCtrl', ['$scope', 'Auth', '$location', 'List', '$rootScope',
  ($scope, Auth, $location, List, $rootScope) ->
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
            $rootScope.lists = response
        $location.path "/"
      ), (error) ->
        $scope.error = error

])