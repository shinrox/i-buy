angular.module 'iBuy.services'
.service 'UserService', ($q)->

  return service =
    register: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      exist = users[user.login]

      if !exist? and user.login isnt 'anonymous'
        users[user.login] = angular.extend user, {
          shoppings: []
          cart: 
            currentProducts: {}
            productsCount: 0
            currentTotal: 0
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
      else if service.current.login is 'anonymous'
        simpleStorage.set('anonymousUser', service.current)

    login: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      exist = users[user.login]
      if exist? and exist.password is user.password
        simpleStorage.set('currentUser', exist)
        angular.extend service.current, exist
        service.logged = true
        defer.resolve(exist)
      else
        defer.reject('user.not.found')

      defer.promise

    currentUser: ()->
      user =
        login: 'anonymous'
        cart:
          currentProducts: {}
          productsCount: 0
          currentTotal: 0

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

