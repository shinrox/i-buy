angular.module 'iBuy.services'
.service 'CollectionsService', ($filter)->

  filter = $filter('filter')

  count = 1

  models = 
    products: (category)->
      products = []
      about = """ 
        Officia et cupidatat consequat reprehenderit do qui velit
         anim magna sint minim qui ullamco. 
         Ex amet cupidatat non deserunt. 
         Lorem nulla irure ex do amet irure.
      """
      for id in [1..10]
        # technics
        model =
          _id: count
          about: about
          name: "Produto #{category.name.toLowerCase()} #{id}"
          preview: "http://lorempixel.com/640/480/#{category.type}/#{id}"
          price: parseFloat(Math.min(100 + (Math.random() * (3000 - 100)),3000).toFixed(2))
          quantity: Math.floor(Math.random() * 25) + 10
          thumb: "http://lorempixel.com/250/250/#{category.type}/#{id}"
          category: category
          sold: 0

        count++
        products.push model
      return products


    category: (id, name, type)->
      return model =
        _id: 1
        image: "cat#{id}.jpg"
        name: name
        type: type

  return service = 
    create: ->
      savedCat = simpleStorage.get('CategoriesCollection')

      categories = [
        models.category(1, 'Tecnologia', 'technics')
        models.category(2, 'Esportes', 'sports')
        models.category(3, 'Quadros', 'abstract')
      ]

      if !savedCat?
        simpleStorage.set('CategoriesCollection', categories)

      savedProducts = simpleStorage.get('ProductsCollection')

      if !savedProducts?

        products = []
        for category in categories
          products = products.concat(models.products(category))

        simpleStorage.set('ProductsCollection', products)

    products:
      all: ->
        return simpleStorage.get('ProductsCollection')

      getByCategory: (category)->
        all = service.products.all()
        if category is 'all'
          return all
        filtered = filter(all, (item)->
          return item.category.type is category
        )
        return filtered

      sell: (product, count)->
        products = service.products.all()
        item = filter(products, {_id: product._id}, true)[0]
        if item?
          item.sold += count
          simpleStorage.set('ProductsCollection', products)

      retrieve: (product, count)->
        products = service.products.all()
        item = filter(products, {_id: product._id}, true)[0]
        if item?
          item.sold -= count
          simpleStorage.set('ProductsCollection', products)

      available: (product)->
        products = service.products.all()
        item = filter(products, {_id: product._id}, true)[0]
        return if item? then item.quantity - item.sold else 0




    categories: 
      all: ->
        return simpleStorage.get('CategoriesCollection')


