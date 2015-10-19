angular.module "iBuy.controllers"
  ###
  ## Init
  ###
  ctrl = @

  UserService.currentUser()
  ctrl.UserService = UserService

  $document.on 'scroll', ()->
    ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'
    $scope.$apply()

  ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'

  ctrl.currentUser = UserService.current

  ctrl.actions =
    openLogin: ->
      modal = $uibModal.open {
        templateUrl: 'app/components/login/modal/template.html'
        controller: 'LoginController as ctrl'
      }

      modal.result.then ->
        # ctrl.currentUser = UserService.current

    logout: ->
      UserService.logout()
      # ctrl.currentUser = UserService.current

  return @

