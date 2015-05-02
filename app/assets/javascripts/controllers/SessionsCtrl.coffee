angular.module('todoApp').controller('SessionsCtrl', ['$scope', 'Auth', '$location', 'List', '$rootScope',
  ($scope, Auth, $location, List, $rootScope) ->
    if Auth._currentUser
      $location.path '/'

    $scope.logout = ->
      Auth.logout().then ((oldUser) ->
        $rootScope.user = undefined
        $rootScope.lists = undefined
        $location.path '/sign_in'
      ), (error) ->

    $scope.signinData = {}
    $scope.signIn = ->
      Auth.login($scope.signinData).then ((user) ->
        $rootScope.user = user
        List.index '',
          (response)->
            $rootScope.lists = response
        $location.path '/'
      ), (error) ->
        $scope.error = error

])