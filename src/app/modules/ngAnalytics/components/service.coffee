angular.module 'ngAnalytics.services'
.service 'GATracker', (ngAnalyticsTrackers, $window)->

  return API = {
    ga:
      send: (tracker, options)->
        try
          $window.ga "#{tracker.name}.send", options
        catch e
          console.log 'ngAnalytics.track error', e, tracker

      set: (tracker, options)->
        try
          $window.ga "#{tracker.name}.set", options
        catch e
          console.log 'ngAnalytics.track error', e, tracker

    all:
      send: (options)->
        for own key, tracker of ngAnalyticsTrackers
          API.ga.send tracker, options

      set: (options)->
        for own key, tracker of ngAnalyticsTrackers
          API.ga.set tracker, options

    byName:
      send: (name, options)->
        tracker = ngAnalyticsTrackers[name]
        if tracker?
          API.ga.send tracker, options

      set: (name, options)->
        tracker = ngAnalyticsTrackers[name]
        if tracker?
          API.ga.set tracker, options

    setUser: (user)->
      API.all.set({userId: "USER_#{user.id}"})

    setPage: (page)->
      API.all.set({page: page})

    setAppVersion: (version, name)->
      options = {}
      if name?
        tracker = ngAnalyticsTrackers[name]
        if tracker? and tracker.versionDimension?
          options[tracker.versionDimension] = version
          API.ga.set(tracker, options)
      else
        for own key, tracker of ngAnalyticsTrackers
          if tracker.versionDimension?
            options[tracker.versionDimension] = version
            API.ga.set(tracker, options)

    trackEvent: (values, name)->
      hit =
        hitType: 'event'
        eventValue: 1

      $.extend true, hit, values

      if name?
        API.byName.send(name, hit)
      else
        API.all.send(hit)

    trackView: (values, name)->
      hit =
        hitType: 'pageview'

      $.extend true, hit, values

      if name?
        API.byName.send(name, hit)
      else
        API.all.send(hit)

  }








