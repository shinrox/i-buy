angular.module 'iBuy.services'
.service 'CartService', (UserService)->

  currentUser = UserService.currentUser()

  service =
    currentProducts: {}
    currentTotal: 0
    calcTotal: ->
      total = 0

      for own key, product of service.currentProducts
        total += (product.price * product.count)

      service.currentTotal = parseFloat(total).toFixed(2)

    updateCart: ->
      service.calcTotal()
      simpleStorage.set(currentUser + 'Cart', service.currentProducts)

    add: (product, quantity)->
      exist = service.currentProducts[product._id]
      if exist?
        exist.count += quantity
      else
        product.count = quantity
        service.currentProducts[product._id] = product

      service.updateCart()

    remove: (product, count)->
      exist = service.currentProducts[product._id]

      if exist?
        exist.count -= quantity

        if exist.count <= 0
          delete service.currentProducts[product._id]

      service.updateCart()

    load: ->
      userCart = simpleStorage.get(currentUser + 'Cart')
      service.currentProducts = userCart || {}
      service.calcTotal()

  service.load()

  return service


