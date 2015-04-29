angular.module('todoApp').controller 'CommentsCtrl', ['$scope', 'Comment', 'FileUploader',
  ($scope, Comment, FileUploader)->

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

    csrf_token = document.querySelector("meta[name=\"csrf-token\"]").getAttribute("content")

    $scope.uploader = new FileUploader(
      url: 'file_stores'
      headers:
        "X-CSRF-TOKEN": csrf_token
    )

    $scope.uploader.onBeforeUploadItem = (item) ->
      item.formData.push({file_name: item.file.name})
      item.remove()

    $scope.uploader.onSuccessItem = (item, response, status, headers)->
      $scope.task.comments.forEach (item)->
        if item.id == response.comment_id
          comment = item
          comment.file_stores.push(response)


    $scope.fileSelectShow = (task, comment)->
      id = comment.id
      task = task.comments.map((item) ->
        if item.id != id
          item.fileSelect = false
        else
          comment.fileSelect = !comment.fileSelect
      )
      $scope.uploader.queue = []

]