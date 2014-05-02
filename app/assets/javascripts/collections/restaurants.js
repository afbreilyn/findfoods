Findfood.Collections.Restaurants = Backbone.Collection.extend({

  model: Findfood.Models.Restaurant,
  url: "/api/searches",

  // url: function () {
  // } ,

  initialize: function() {

    
  }

  submitComment: function(event) {
    event.preventDefault();

    var attrs = $(event.target.form).serializeJSON();
    // var comment = new BetterNote.Models.Comment(attrs);
    // comment.author = BetterNote.currentUser;

    // this.collection.create(comment, {});
  },



});
