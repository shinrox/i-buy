angular.module 'iBuy.services'
.service 'ShoppingsService', (UserService, $filter)->
  filter = $filter('filter')

  service =
    save: (shopping)->
      UserService.save()

    remove: (shopping)->
      return false if shopping.status is 'PAID'
      user = UserService.current
      _idx = _.findIndex(user.shoppings, {_id: shopping._id})
      user.shoppings.splice(_idx, 1)
      

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