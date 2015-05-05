angular.module('todoApp').controller 'TasksCtrl', ['$scope', 'Task', 'ngToast',
  ($scope, Task, ngToast)->
    $scope.addTask = (list)->
      if list.newTaskName != undefined
        Task.create
          list_id: list.id, name: list.newTaskName
            , (response)->
                if $scope.list.tasks == undefined
                  $scope.list.tasks = new Array(response)
                  $scope.list.newTaskName = undefined
                else
                  $scope.list.tasks.unshift(response)
                  $scope.list.newTaskName = undefined
            , (error)->
              ngToast.create
                className: 'danger'
                content: 'Task ' + error.data.name
      else
        ngToast.create
          className: 'danger'
          content: 'Task can\'t be blank'

    $scope.deleteTask = (list, task)->
      Task.delete
        list_id: list.id, id: task.id
          , (response)->
            $scope.list.tasks.splice($scope.list.tasks.indexOf(task), 1)


    $scope.editTask = (task)->
      task.newName = task.name
      task.edit = !task.edit

    $scope.updateTask = (list, task)->
      if task.newName.length > 0
        Task.update
          list_id: list.id, id: task.id, name: task.newName
            , ->
              task.name = task.newName
              task.edit = false
            , (error)->
              ngToast.create
                className: 'danger'
                content: 'Task ' + error.data.name
      else
        ngToast.create
          className: 'danger'
          content: 'Task can\'t be blank'

    $scope.taskCompleted = (list, task)->
      Task.update
        list_id: list.id, id: task.id, completed: task.completed
          , ->

    $scope.taskDate = (list, task)->
      Task.update
        list_id: list.id, id: task.id, due_date: task.due_date
          , ->
            task.edit = false

    $scope.dateOptions =
      showOn: 'button',
      buttonText: ''

    $scope.todoSortable =
      containment: 'parent',
      cursor: 'move',
      tolerance: 'pointer',
      stop:  (e, ui) ->
        domIndexOf = (e) -> e.siblings().andSelf().index(e)
        newPriority = domIndexOf(ui.item) + 1
        task = ui.item.scope().task
        task.priority = newPriority
        Task.update
          list_id: task.list_id, id: task.id, task_priority: task.priority
            , ->

    $scope.commentsShow = (task)->
      if task.comments == undefined
        task.comments = new Array()
        task.comments.show = true
      else
        task.comments.show = !task.comments.show
]