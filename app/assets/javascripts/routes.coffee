angular.module('todoApp').config ($routeProvider) ->
  $routeProvider
  .when('/',
    templateUrl: 'index.html'
  )
  .when('/sign_up',
    templateUrl: 'sign_up.html',
    controller: 'RegistrationsCtrl'
  )
  .when('/sign_in',
    templateUrl: 'sign_in.html',
    controller: 'SessionsCtrl'
  )
  .otherwise(
    redirectTo: '/'
  )