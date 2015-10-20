angular.module 'iBuy.services'
.service 'ShoppingsService', (UserService, $filter, CollectionsService)->
  filter = $filter('filter')

  service =
    save: (shopping)->
      UserService.save()

    remove: (shopping)->
      return false if shopping.status is 'PAID'
      user = UserService.current
      _idx = _.findIndex(user.shoppings, {_id: shopping._id})

      if _idx isnt -1
        shopping = user.shoppings[_idx]
        for own key, product of shopping.products
          CollectionsService.products.retrieve(product, product.count)
        
        user.shoppings.splice(_idx, 1)
      else
        for own key, product of user.cart.products
          CollectionsService.products.retrieve(product, product.count)
        angular.extend user.cart, UserService.newCart()
      
      UserService.save()


    create: ->
      user = UserService.current
      shopping = angular.copy user.cart

      shopping.status = 'CREATED'
      shopping._id = new Date().getTime()

      user.shoppings.push(user.cart)
      UserService.save()

    pay: (shopping)->
      shopping.status = 'PAID'
      UserService.save()



  return service