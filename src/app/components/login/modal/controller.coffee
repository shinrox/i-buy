angular.module 'iBuy.controllers'
.controller 'LoginController', (UserService, $modalInstance, sAlert, CartService)->

  ctrl = @

  ctrl.user = {
    email: null
    password: null
  }

  ctrl.register = false

  ctrl.actions =
    close: ->
      $modalInstance.close()

    continue: ->
      if ctrl.register
        ctrl.actions.register()
      else
        ctrl.actions.login()

    register: ->
      promise = UserService.register(ctrl.user)
      promise.then ->
        ctrl.register = false

      rejected = ->
        sAlert.error({
         title: "Ops!" 
         text: 'Login já cadastrado, por favor tente novamente.'
        })

      promise.catch(rejected)

    login: ->
      promise = UserService.login(ctrl.user)
      promise.then ->
        CartService.load()
        $modalInstance.close()

      rejected = ->
        sAlert.error({
         title: "Ops!" 
         text: 'Usuário/senha inválidos, por favor tente novamente ou registre-se.'
        })

      promise.catch(rejected)


  return @

