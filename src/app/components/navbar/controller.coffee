angular.module "iBuy.controllers"
.controller "NavBarCtrl", ($scope, $document, UserService, $uibModal) ->
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

    logout: ->
      UserService.logout()

  return @

