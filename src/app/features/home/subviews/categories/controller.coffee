angular.module 'iBuy.controllers'
.controller 'CategoriesController', (categories, CategoriesService)->
  ctrl = @
  Service = CategoriesService

  angular.extend ctrl, {
    categories: categories
  }


  return @