angular.module 'iBuy.services'
.service 'CategoriesService', (CollectionsService)->
  CollectionsService.create()

  return service =
    all: ()->
      CollectionsService.categories.all()

    get: (id)->
      CollectionsService.categories.get({_id: id})
