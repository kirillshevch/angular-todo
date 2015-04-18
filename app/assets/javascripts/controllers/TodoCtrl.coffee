angular.module('todoApp').controller('TodoCtrl', ['Auth', '$location', '$scope', 'Project',
  (Auth, $location, $scope, Project)->
    if (Auth._currentUser == null)
      $location.path('/sign_up')

    $scope.loadProjects = Project.index '',
      (response)->
        $scope.projects = response

    $scope.addProject = ()->
      Project.create '',
        (response)->
          $scope.projects.unshift(response)

    $scope.deleteProject = (project)->
      Project.delete
        id: project.id
          , ()->
            $scope.projects.splice($scope.projects.indexOf(project), 1)

    $scope.editProject = (project)->
      if project.edit
        project.edit = false
      else
        project.edit = true
        project.nameFeature = project.name

    $scope.updateProject = (project)->
      Project.update
        id: project.id, name: project.nameFeature
          , ()->
            project.name = project.nameFeature
            project.edit = false

])