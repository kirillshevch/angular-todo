angular.module('todoApp').factory 'List', ($resource) ->
  $resource '/api/lists/:id', { id: '@id' },
    create:
      method: 'POST'
    index:
      method: 'GET'
      isArray: true
    destroy:
      method: 'DELETE'
    update:
      method: 'PATCH'