window.Findfood = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.$rootEl = $(".main-content"),
    this.$header = $(".header"),
    this.$sidebar = $(".sidebar"),
    this.restaurants = new Findfood.Collections.Restaurants();
  }
};

$(document).ready(function(){
  Findfood.initialize();
});