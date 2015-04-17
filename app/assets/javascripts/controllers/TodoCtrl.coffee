angular.module('todoApp').controller('TodoCtrl', ['Auth', '$location', '$scope', 'Project',
  (Auth, $location, $scope, Project)->
    if (Auth._currentUser == null)
      $location.path('/sign_up')

    $scope.loadProjects = Project.index '',
      (response)->
        $scope.projects = response
    $scope.addProject = ()->
      Project.create '',
        ()->
    $scope.deleteProject = (id)->
      Project.delete
        id: id
        , ()->
])