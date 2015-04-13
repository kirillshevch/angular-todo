angular.module('todoApp').controller('RegistrationsCtrl', ['$scope', 'Auth', '$location',
  ($scope, Auth, $location) ->
    if Auth._currentUser
      $location.path('/')

    $scope.signupData = {}
    $scope.addUser = () ->
      Auth.register($scope.signupData).then ((registeredUser) ->
        $location.path('/')
      ), (error) ->
])

