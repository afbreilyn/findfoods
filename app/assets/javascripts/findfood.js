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
    restaurants: Findfood.restaurants;
    Backbone.history.start();
  }
};


$(document).ready(function(){
  Findfood.initialize();
});