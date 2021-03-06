angular.module 'iBuy.services'
.service 'CartService', (UserService, ShoppingsService, CollectionsService)->

  service =
    calcTotal: ->
      user = UserService.current
      total = 0
      productsCount = 0

      for own key, product of user.cart.products
        productsCount += product.count
        total += (product.price * product.count)

      user.cart.productsCount = productsCount
      user.cart.currentTotal = parseFloat(total).toFixed(2)

    clearCart: (user)->
      user = UserService.current
      angular.extend user.cart, {
        _id: new Date().getTime()
        status: 'CREATED'
        products: {}
        productsCount: 0
        currentTotal: 0
      }

    updateCart: ()->
      service.calcTotal()
      UserService.save()

    add: (product, quantity = 1)->
      user = UserService.current
      if user.cart.status is 'PAID'
        angular.extend user.cart, UserService.newCart()

      exist = user.cart.products[product._id]
      if exist?
        exist.count += quantity
      else
        product.count = quantity
        user.cart.products[product._id] = product

      CollectionsService.products.sell(product, quantity)
      service.updateCart()

    remove: (product, quantity = 1)->
      user = UserService.current
      exist = user.cart.products[product._id]

      if exist?
        exist.count -= quantity

        if exist.count <= 0
          delete user.cart.products[product._id]

      CollectionsService.products.retrieve(product, quantity)
      service.updateCart()

    load: ->
      UserService.currentUser()
      service.updateCart()

    updateStatus: (status)->
      user = UserService.current
      _idx = _.findIndex(user.shoppings, {_id: user.cart._id})
      if _idx > -1
        user.cart.status = status
        user.shoppings[_idx] = angular.copy user.cart
      else
        user.cart.status = status
        user.shoppings.push angular.copy(user.cart)

      UserService.save()

    finish: (keepCart)->
      user = UserService.current
      _idx = _.findIndex(user.shoppings, {_id: user.cart._id})

      if _idx > -1
        if keepCart
          service.updateStatus(user.cart.status)
        else
          service.updateStatus('WAITING')
          service.clearCart()
      else
        service.updateStatus('CREATED')
      
      if !keepCart
        service.clearCart()
      UserService.save()


    setCurrent: (id)->
      user = UserService.current
      
      if user.cart._id isnt id
        if user.cart.productsCount > 0
          service.updateStatus(user.cart.status)
        _idx = _.findIndex(user.shoppings, {_id: id})
        angular.extend user.cart, user.shoppings[_idx]

      UserService.save()



  service.load()

  return service


