/**
 * Created by Ihor on 15.07.2015.
 */

define(["blocks", app.path+"Models/Product"], function (blocks, model) {
    var App = blocks.Application();
    app.Collections["Product"] = App.Collection(model);
    return app.Collections["Product"];
});
