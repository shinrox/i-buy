angular.module 'iBuy.services'
.service 'UserService', ($q)->

  return service =
    newCart: ->
      return cart =
        _id: new Date().getTime()
        status: "CREATED"
        products: {}
        productsCount: 0
        currentTotal: 0
    register: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      exist = users[user.login]

      if !exist? and user.login isnt 'anonymous'
        users[user.login] = angular.extend user, {
          shoppings: []
          cart: service.newCart()
        }

        simpleStorage.set('availableUsers', users)
        defer.resolve(user)
      else
        defer.reject('user.already.exists')


      defer.promise

    save: ->
      users = simpleStorage.get('availableUsers') or {}
      exist = users[service.current.login]
      if exist?
        users[service.current.login] = service.current
        simpleStorage.set('availableUsers', users)
        simpleStorage.set('currentUser', service.current)
      else if service.current.login is 'anonymous'
        simpleStorage.set('anonymousUser', service.current)

    login: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      exist = users[user.login]
      if exist? and exist.password is user.password
        angular.extend service.current, exist
        simpleStorage.set('currentUser', service.current)
        service.logged = true
        defer.resolve(exist)
      else
        defer.reject('user.not.found')

      defer.promise

    currentUser: ()->
      user =
        login: 'anonymous'
        cart: service.newCart()

      currentUser = simpleStorage.get('currentUser')
      service.logged = currentUser?
        
      if !service.logged
        angular.extend user, simpleStorage.get('anonymousUser')

      angular.extend service.current, user, currentUser
      return service.current
      
    current: {}
    logged: false

    logout: ->
      defer = $q.defer()
      simpleStorage.deleteKey('currentUser')
      service.logged = false

      angular.extend service.current, simpleStorage.get('anonymousUser')
      defer.resolve()

      return defer.promise

