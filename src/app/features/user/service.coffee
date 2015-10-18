angular.module 'iBuy.services'
.service 'UserService', ($q, $timeout)->

  return service =
    register: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      $timeout ->
        exist = users[user.login]

        if !exist?
          users[user.login] = user
          simpleStorage.set('availableUsers', users)
          defer.resolve(user)
        else
          defer.reject('user.already.exists')

      , 500

      defer.promise


    login: (user)->
      users = simpleStorage.get('availableUsers') or {}
      defer = $q.defer()

      $timeout ->
        exist = users[user.login]
        if exist? and exist.password is user.password
          simpleStorage.set('currentUser', exist)
          service.currentUser()
          defer.resolve(exist)
        else
          defer.reject('user.not.found')
      , 500

      defer.promise

    currentUser: ()->
      user = simpleStorage.get('currentUser')
      service.logged = user?
      return service.current = user or { name: 'anonymous'}
      

    logged: false

    logout: ->
      defer = $q.defer()

      $timeout ->
        simpleStorage.deleteKey('currentUser')
        service.currentUser()
        defer.resolve()
      , 300

      return defer.promise

