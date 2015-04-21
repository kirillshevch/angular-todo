angular.module('todoApp').controller 'TasksCtrl', ['$scope', 'Task',
  ($scope, Task)->
    $scope.addTask = (list)->
      Task.create
        list_id: list.id, name: list.newTaskName
          , (response)->
              $scope.list.tasks.unshift(response)
              $scope.list.newTaskName = ''


    $scope.deleteTask = (list, task)->
      Task.delete
        list_id: list.id, id: task.id
          , (response)->
            $scope.list.tasks.splice($scope.list.tasks.indexOf(task), 1)


    $scope.editTask = (task)->
      task.newName = task.name
      task.edit = !task.edit

    $scope.updateTask = (list, task)->
      Task.update
        list_id: list.id, id: task.id, name: task.newName
          , ()->
            task.name = task.newName
            task.edit = false


    $scope.taskCompleted = (list, task)->
      Task.update
        list_id: list.id, id: task.id, completed: task.completed
          , ()->

    $scope.taskDate = (list, task)->
      Task.update
        list_id: list.id, id: task.id, due_date: task.due_date
          , ()->
            task.edit = false

    $scope.dateOptions =
      showOn: 'button',
      buttonText: ''
]