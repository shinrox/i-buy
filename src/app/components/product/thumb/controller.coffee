angular.module 'iBuy'
.controller 'ProductThumbController', ($state, $scope, $uibModal)->
  ctrl = @

  ctrl.actions =
    open: ()->
      $state.go 'products.detail', {id: $scope.product._id}
    zoom: ->
      promise = $uibModal.open({
        templateUrl: 'app/components/product/modal/template.html'
        controller: 'ProductModalController as ctrl'
        resolve:
          product: ->
            return $scope.product
      })

  return @