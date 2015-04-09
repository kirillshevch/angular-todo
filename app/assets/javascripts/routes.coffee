angular.module('todoApp').config ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'index.html',
      controller: 'TodoCtrl',
      controllerAs: 'todoCtrl'
    )
    .when('/sign_up',
      templateUrl: 'sign_up.html',
      controller: 'RegistartionsCtrl',
      controllerAs: 'registrationsCtrl'
    )