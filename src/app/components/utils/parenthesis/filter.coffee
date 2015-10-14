angular.module 'iBuy.filters'
.filter 'parenthesis', ()->
  return (obj, keyName)->
    return '' if !(obj instanceof Object) or !obj[keyName]?
    return "(" + obj[keyName] + ")"
