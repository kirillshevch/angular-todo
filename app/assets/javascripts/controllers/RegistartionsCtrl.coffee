angular.module('todoApp').controller('RegistrationsCtrl', ['$scope', 'Auth', '$location', '$rootScope'
  ($scope, Auth, $location, $rootScope) ->
    if Auth._currentUser
      $location.path('/')

    $scope.signupData = {}
    $scope.addUser = ->
      Auth.register($scope.signupData).then ((registeredUser) ->
        $rootScope.user = registeredUser
        $rootScope.lists = new Array()
        $location.path('/')
      ), (error) ->
        $scope.error = error
])

