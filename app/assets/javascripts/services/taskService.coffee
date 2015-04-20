angular.module('todoApp').factory 'Task', ($resource)->
  $resource 'api/lists/:list_id/tasks/:id', { list_id: '@list_id', id: '@id' },
    create:
      method: 'POST'
    destroy:
      method: 'DELETE'
    update:
      method: 'PATCH'