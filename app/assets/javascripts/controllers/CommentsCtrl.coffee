angular.module('todoApp').controller 'CommentsCtrl', ['$scope', 'Comment', 'FileUploader', '$rootScope', 'ngToast',
  ($scope, Comment, FileUploader, $rootScope, ngToast)->

    $scope.addComment = (task)->
      if task.commentNewName != undefined
        Comment.create
          list_id: task.list_id, task_id: task.id, name: task.commentNewName
        , (response)->
          $scope.task.comments.unshift(response)
          $scope.task.commentNewName = undefined
      else
        ngToast.create
          className: 'danger'
          content: 'Comment can\'t be blank'

    $scope.deleteComment = (task, comment)->
      Comment.delete
        list_id: task.list_id, task_id: task.id, id: comment.id
      , ->
        $scope.task.comments.splice($scope.task.comments.indexOf(comment), 1)

    $scope.uploader = new FileUploader(
      url: 'file_stores'
    )

    $scope.uploader.onBeforeUploadItem = (item) ->
      item.formData.push({file_name: item.file.name})
      item.remove()

    $scope.uploader.onSuccessItem = (item, response, status, headers)->
      $scope.task.comments.forEach (item)->
        if item.id == response.comment_id
          comment = item
          if comment.file_stores == undefined
            comment.file_stores = new Array(response)
          else
            comment.file_stores.push(response)

    $scope.uploader.onErrorItem = (item, response, status, headers)->
      ngToast.create
        className: 'danger'
        content: 'File ' + response.file

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