var Base, isObject;

isObject = function(value) {
  return {}.toString.call(value) === '[object Object]';
};

Base = (function() {
  function Base(data) {
    if (data) {
      this._data = data;
    }
  }

  Base.prototype._data = {};

  Base.prototype.get = function(path, def) {
    var obj;
    obj = this._data;
    path = path.split('.');
    while (obj && path.length) {
      obj = obj[path.shift()];
    }
    if (typeof obj === 'undefined' && typeof def !== 'undefined') {
      return def;
    }
    return obj;
  };

  Base.prototype.set = function(path, value) {
    var key, obj;
    if (isObject(path)) {
      for (key in path) {
        value = path[key];
        this._data[key] = value;
      }
      return;
    }
    path = path.split('.');
    obj = this._data;
    while (obj && path.length - 1) {
      if (obj[path[0]]) {
        obj = obj[path[0]];
      } else {
        obj = obj[path[0]] = {};
      }
      path.shift();
    }
    return obj[path.shift()] = value;
  };

  Base.prototype.read = function() {};

  Base.prototype.save = function() {};

  Base.prototype["delete"] = function() {};

  return Base;

})();

module.exports = Base;
