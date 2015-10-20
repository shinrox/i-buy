angular.module 'iBuy.services'
.service 'ProductsService', (CollectionsService)->
  CollectionsService.create()

  return service =
    all: ()->
      CollectionsService.products.all()

    get: (category)->
      CollectionsService.products.getByCategory(category)

    getById: (id)->
      CollectionsService.products.getById(id)

