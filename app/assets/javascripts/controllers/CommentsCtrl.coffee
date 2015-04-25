angular.module('todoApp').controller 'CommentsCtrl', ['$scope', 'Comment',
  ($scope, Comment)->

    $scope.addComment = (task)->
      Comment.create
        list_id: task.list_id, task_id: task.id, name: task.commentNewName
          , (response)->
              $scope.task.comments.unshift(response)
              $scope.task.commentNewName = ''
    $scope.deleteComment = (task, comment)->
      Comment.delete
        list_id: task.list_id, task_id: task.id, id: comment.id
          , ->
            $scope.task.comments.splice($scope.task.comments.indexOf(comment), 1)
]