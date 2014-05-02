window.Findfood = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Findfood.posts = new Findfood.Collections.Restaurants();
  initialize: function() {

  }
};

$(document).ready(function(){
  Findfood.initialize();
});
