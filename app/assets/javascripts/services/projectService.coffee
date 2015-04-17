angular.module('todoApp').factory 'Project', ($resource) ->
  $resource '/api/projects/:id', { id: '@id' },
    create:
      method: "POST"
    index:
      method: "GET"
      isArray: true
    destroy:
      method: "DELETE"