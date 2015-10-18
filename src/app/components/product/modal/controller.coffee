angular.module 'iBuy'
.controller 'ProductModalController', ($modalInstance, product)->
  ctrl = @

  ctrl.product = product

  ctrl.actions =
    close: ->
      $modalInstance.close()

  return @