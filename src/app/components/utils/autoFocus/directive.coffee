angular.module 'iBuy'
.directive 'autoFocus', ($timeout)->
  return ($scope, $element, $attrs)->
    $scope.$watch($attrs.autoFocus,
      (newValue)->
        $timeout ->
          newValue and $element.focus()
    ,true)
