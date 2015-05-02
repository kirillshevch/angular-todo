angular.module('todoApp').directive 'validateEmail', ->
  EMAIL_REGEXP = /^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,8})$/
  require: 'ngModel'
  restrict: ''
  link: (scope, elm, attrs, ctrl) ->
    if ctrl and ctrl.$validators.email
      ctrl.$validators.email = (modelValue) ->
        ctrl.$isEmpty(modelValue) or EMAIL_REGEXP.test(modelValue)