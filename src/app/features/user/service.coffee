angular.module 'iBuy.services'
.service 'UserService', ->
  users = simpleStorage.get('availableUsers')

  return service =
    register: (user)->
      exist = users[user.email]
      if !exist?
        users[user.email] = user
        simpleStorage.set('availableUsers', users)


    login: (user)->
      exist = users[user.email]
      if exist? and exist.password is user.password
        simpleStorage.set('currentUser', user)
        return true
      else
        return false

    currentUser: ()->
      user = simpleStorage.get('currentUser')

      return user or 'anonymous'

    logout: ->
      simpleStorage.deleteKey('currentUser')

