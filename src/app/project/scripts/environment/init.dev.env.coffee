$(document).ready ->

  window.ENV or= {}
  setupData              = {}
  waitForSetup           = false
  ENV    = window.ENV
  window.ENV.user = null
  # Bootstrap da aplicação
  bootstrap = ->

    # for index in [1..10]
    #   do (index)->
    #     product = {
    #       "tags": [
    #         "tech"
    #       ],
    #       "registered": new Date().getTime(),
    #       "about": "Officia et cupidatat consequat reprehenderit do qui velit anim magna sint minim qui ullamco. Ex amet cupidatat non deserunt. Lorem nulla irure ex do amet irure.",
    #       "price": parseFloat(Math.min(10 + (Math.random() * (100 - 10)),100).toFixed(2))
    #       "thumb": "http://lorempixel.com/250/250/technics/#{index}",
    #       "preview": "http://lorempixel.com/640/480/technics/#{index}",
    #       "quantity": Math.floor(Math.random() * 30) + 10,
    #       "type": "tech"
    #       "name": "Produto #{index}"
    #     }

    #     $.post("https://openws.herokuapp.com/products?apiKey=#{ENV.APIKEY}", product).done (data)->
    #       if index is 10
    #         angular.bootstrap(document, ["iBuy"])
    angular.bootstrap(document, ["iBuy"])
    return

  bootstrap()
