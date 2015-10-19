angular.module 'iBuy.controllers'
.controller 'ShoppingsController', (ShoppingsService, UserService, CartService, user, $filter, sAlert)->

  ctrl = @

  filter = $filter('filter')

  CartService.finish(true)

  ctrl.currentUser = UserService.current
  ctrl.status =
    ALL: "Todas"
    CREATED: "Em andamento"
    PAID: "Finalizada"


  ctrl.filters = []

  for own key, value of ctrl.status
    ctrl.filters.push {status: key, name: value}


  ctrl.currentFilter = ctrl.filters[0]

  ctrl.currentShoppings = ctrl.currentUser.shoppings

  ctrl.actions = 
    filterBy: (obj) ->
      ctrl.currentFilter = obj
      ctrl.currentShoppings = filter(ctrl.currentUser.shoppings, {
        status: if obj.status isnt 'ALL' then obj.status
      })

    pay: (shopping)->
      ShoppingsService.pay(shopping)
      ctrl.actions.filterBy(ctrl.currentFilter)

    remove: (shopping)->
      sAlert.confirm({
        text: 'Certeza que deseja apagar esta compra?'
        closeOnConfirm: true
      }, (confirm)->
        if confirm
          ShoppingsService.remove(ctrl.currentUser.cart)
          if shopping._id is ctrl.currentUser.cart._id
            CartService.clearCart()
      )

  return @