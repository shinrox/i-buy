angular.module 'iBuy.services'
.service 'alphanumSort', ->
  ###*
  parse and humanized sort
  @method alphanumSort service
  @param  {String}     a First string to compare
  @param  {String}     b First string to compare
  @return {Number}       Returns sort value compared between the two strings passed
  ###
  return service = (a, b) ->
    return 0 if !a? or !b?
    aa = a.toString().toUpperCase().split(/(\d+)/)
    bb = b.toString().toUpperCase().split(/(\d+)/)
    x = 0
    while x < Math.max(aa.length, bb.length)
      if aa[x] isnt bb[x]
        cmp1 = if isNaN(parseInt(aa[x], 10)) then aa[x] else parseInt(aa[x], 10)
        cmp2 = if isNaN(parseInt(bb[x], 10)) then bb[x] else parseInt(bb[x], 10)
        if !cmp1? or !cmp2?
          return aa.length - (bb.length)
        else
          return if cmp1 < cmp2 then -1 else 1
      x++
    return 0