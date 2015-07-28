
/**
 * Created by Ihor on 15.07.2015.
 */
define(['blocks'], function(blocks) {
  var App;
  App = blocks.Application();
  app.Models['Product'] = App.Model({
    name: App.Property(),
    version: App.Property(),
    link: App.Property(),
    remove: function() {
      return this.destroy(true);
    }
  });
  return app.Models['Product'];
});
