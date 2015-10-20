
# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

  # =============================================
  # Config Twain
  # =============================================
  .config (ngAnalyticsTrackersProvider, APP_ENV) ->
    ngAnalyticsTrackersProvider.set {
      main:
        UA: APP_ENV.GA.MAIN
    }