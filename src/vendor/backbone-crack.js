Backbone.Model.prototype.fetch = function(options) {
  options || (options = {});
  var model = this;
  var success = options.success;
  options.success = function(resp, status, xhr) {
    if (!model.set(model.parse(resp.data, xhr), options)) return false;
    if (success) success(model, resp);
  };
  options.error = wrapError(options.error, model, options);
  return (this.sync || Backbone.sync).call(this, 'read', this, options);
}

Backbone.Collection.prototype.fetch = function(options) {
  options || (options = {});
  var collection = this;
  var success = options.success;
  options.success = function(resp, status, xhr) {
    collection[options.add ? 'add' : 'reset'](collection.parse(resp.data, xhr), options);
    if (success) success(collection, resp);
  };
  options.error = wrapError(options.error, collection, options);
  return (this.sync || Backbone.sync).call(this, 'read', this, options);
}


var wrapError = function(onError, model, options) {
  return function(resp) {
    if (onError) {
      onError(model, resp, options);
    } else {
      model.trigger('error', model, resp, options);
    }
  };
};
