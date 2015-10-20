angular.module 'iBuy'
.controller 'ProductModalController', ($modalInstance, product, CollectionsService)->
  ctrl = @

  ctrl.product = product

  ctrl.hasProduct = ()->
    ctrl.availableCount() > 0

  ctrl.availableCount = ()->
    CollectionsService.products.available(product)


  ctrl.actions =
    close: ->
      $modalInstance.close()

  return @