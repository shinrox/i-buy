angular.module 'iBuy.controllers'
.controller 'ShoppingsController', (UserService, CartService, user, $filter)->

  ctrl = @

  filter = $filter('filter')

  ctrl.currentUser = UserService.current
  ctrl.status =
    ALL: "Todas"
    CREATED: "Em andamento"
    WAITING: "Aguardando pagamento"
    PAID: "Finalizadas"


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
    finish: ->

    remove: ->


  return @