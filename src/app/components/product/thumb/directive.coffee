angular.module 'iBuy.directives'
.directive 'productThumb', ->

  return directive = 
    restrict: 'AE'
    replace: true
    scope: 
      product: '='

    templateUrl: 'app/components/product/thumb/template.html'
    controller: 'ProductThumbController as ctrl'