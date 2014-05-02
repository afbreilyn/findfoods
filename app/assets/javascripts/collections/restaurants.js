Findfood.Collections.Restaurants = Backbone.Collection.extend({

  model: Findfood.Models.Restaurant,
  url: "/api/searches",

  // url: function () {
    //should grab the info it is given in the url, and parse it to make a 
  // } ,

  // initialize: function() {
  // }

});
