Findfood.Views.RestaurantsIndex = Backbone.View.extend({

  template: JST['restaurants/index'],

  // initialize: function() {
  // },

  render: function() {
    var renderedContent = this.template({
      restaurants: this.collection
    });

    this.$el.html.(renderedContent);
    return this;
  }

});