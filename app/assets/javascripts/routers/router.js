Findfood.Routers.Router = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl,
    this.$header = options.$header,
    this.$sidebar = options.$sidebar,
    this.restaurants = options.restaurants
	},


  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
