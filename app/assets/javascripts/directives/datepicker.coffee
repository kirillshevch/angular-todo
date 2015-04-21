angular.module('todoApp').directive 'datepicker', ($parse) ->
  (scope, element, attrs, controller) ->
    ngModel = $parse(attrs.ngModel)
    $ ->
      element.datepicker
        buttonImageOnly: true
        changeMonth: true
        changeYear: true
        showOn: 'both'

        onSelect: (dateText, inst) ->
          scope.$apply (scope) ->
            ngModel.assign scope, dateText
