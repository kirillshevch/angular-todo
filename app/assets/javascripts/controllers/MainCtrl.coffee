angular.module('todoApp').controller('MainCtrl', ['$scope', 'Auth', '$location', 'List', '$rootScope'
  ($scope, Auth, $location, List, $rootScope) ->
    $scope.showContent = false

    Auth.currentUser().then ((user) ->
      isAuthenticated = true
      List.index '',
        (response)->
          $rootScope.lists = response
      $rootScope.user = Auth._currentUser
      $location.path('/')
      $scope.showContent = true
    ), (error) ->
      $scope.showContent = true
])