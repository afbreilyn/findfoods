window.Findfood = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  // Findfood.restaurants = new Findfood.Collections.Restaurants();
  initialize: function() {
    $rootEl: $(".main-content");
    $header: $(".header");
    $sidebar: $(".sidebar");
    var restaurants = new Findfood.Collections.Restaurants();
    Backbone.history.start();
  }
};


$(document).ready(function(){
  Findfood.initialize();
});