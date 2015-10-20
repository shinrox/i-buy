(function() {
  $(document).ready(function() {
    var ENV, bootstrap, setupData, waitForSetup;
    window.ENV || (window.ENV = {});
    setupData = {};
    waitForSetup = false;
    ENV = window.ENV;
    window.ENV.user = null;
    bootstrap = function() {
      angular.bootstrap(document, ["iBuy"]);
    };
    return bootstrap();
  });

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInByb2plY3Qvc2NyaXB0cy9lbnZpcm9ubWVudC9pbml0LnByb2QuZW52LmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtFQUFBLENBQUEsQ0FBRSxRQUFGLENBQVcsQ0FBQyxLQUFaLENBQWtCLFNBQUE7QUFFaEIsUUFBQTtJQUFBLE1BQU0sQ0FBQyxRQUFQLE1BQU0sQ0FBQyxNQUFRO0lBQ2YsU0FBQSxHQUF5QjtJQUN6QixZQUFBLEdBQXlCO0lBQ3pCLEdBQUEsR0FBUyxNQUFNLENBQUM7SUFDaEIsTUFBTSxDQUFDLEdBQUcsQ0FBQyxJQUFYLEdBQWtCO0lBR2xCLFNBQUEsR0FBWSxTQUFBO01BQ1YsT0FBTyxDQUFDLFNBQVIsQ0FBa0IsUUFBbEIsRUFBNEIsQ0FBQyxNQUFELENBQTVCO0lBRFU7V0FJWixTQUFBLENBQUE7RUFiZ0IsQ0FBbEI7QUFBQSIsImZpbGUiOiJwcm9qZWN0L3NjcmlwdHMvZW52aXJvbm1lbnQvaW5pdC5wcm9kLmVudi5qcyIsInNvdXJjZVJvb3QiOiIvc291cmNlLyIsInNvdXJjZXNDb250ZW50IjpbIiQoZG9jdW1lbnQpLnJlYWR5IC0+XHJcblxyXG4gIHdpbmRvdy5FTlYgb3I9IHt9XHJcbiAgc2V0dXBEYXRhICAgICAgICAgICAgICA9IHt9XHJcbiAgd2FpdEZvclNldHVwICAgICAgICAgICA9IGZhbHNlXHJcbiAgRU5WICAgID0gd2luZG93LkVOVlxyXG4gIHdpbmRvdy5FTlYudXNlciA9IG51bGxcclxuXHJcbiAgIyBCb290c3RyYXAgZGEgYXBsaWNhw6fDo29cclxuICBib290c3RyYXAgPSAtPlxyXG4gICAgYW5ndWxhci5ib290c3RyYXAoZG9jdW1lbnQsIFtcImlCdXlcIl0pXHJcbiAgICByZXR1cm5cclxuXHJcbiAgYm9vdHN0cmFwKClcclxuIl19