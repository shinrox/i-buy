angular.module 'iBuy'
.controller 'ProductsController', (products, alphanumSort, ProductsService)->
  ctrl = @
  Service = ProductsService

  angular.extend ctrl, {
    products: products.data.sort (a, b)->
      return alphanumSort(a.name, b.name)
  }


  return @