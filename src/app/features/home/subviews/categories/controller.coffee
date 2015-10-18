angular.module 'iBuy.controllers'
.controller 'CategoriesController', (categories, alphanumSort, CategoriesService)->
  ctrl = @
  Service = CategoriesService

  angular.extend ctrl, {
    categories: categories.data.sort (a, b)->
      return alphanumSort(a.name, b.name)
  }

  # for category in ctrl.categories
  #   Service.remove category._id


  return @