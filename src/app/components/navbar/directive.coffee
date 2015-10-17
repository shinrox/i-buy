angular.module "iBuy.directives"
  .directive "navBar", () ->
    restrict: "EA"
    scope: {}
    replace: true
    templateUrl: 'app/components/navbar/template.html'
    controller: 'NavBarCtrl as ctrl'