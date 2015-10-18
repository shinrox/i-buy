angular.module 'iBuy.directives'
.directive 'productPreview', ->
  return directive = 
    restrict: "AE"
    replace: true
    scope:
      product: "="
    templateUrl: 'app/components/product/preview/template.html'
