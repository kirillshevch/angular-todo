angular.module('todoApp').factory 'Comment', ($resource)->
  $resource 'api/lists/:list_id/tasks/:task_id/comments/:id',
    {list_id: '@list_id', task_id: '@task_id', id: '@id'},
    create:
      method: 'POST'
    destroy:
      method: 'DELETE'