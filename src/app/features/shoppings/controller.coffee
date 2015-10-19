angular.module 'iBuy.controllers'
.controller 'ShoppingsController', (ShoppingsService, UserService, CartService, user, $filter, sAlert)->

  ctrl = @

  filter = $filter('filter')


  ctrl.currentUser = UserService.current
  if ctrl.currentUser.cart.productsCount > 0
    CartService.updateStatus(ctrl.currentUser.cart.status)

  ctrl.status =
    ALL: "Todas"
    CREATED: "Em andamento"
    WAITING: "Aguardando pagamento"
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
      if shopping._id is ctrl.currentUser.cart._id
        CartService.clearCart()

    remove: (shopping)->
      sAlert.confirm({
        text: 'Certeza que deseja apagar esta compra?'
        closeOnConfirm: true
      }, (confirm)->
        if confirm
          ShoppingsService.remove(shopping)
          ctrl.actions.filterBy(ctrl.currentFilter)
          if shopping._id is ctrl.currentUser.cart._id
            CartService.clearCart()
      )

  return @