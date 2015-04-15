angular.module('todoApp').controller('TodoCtrl', ['Auth', '$location',
  (Auth, $location)->
    if (Auth._currentUser == null)
      $location.path('/sign_up')
])