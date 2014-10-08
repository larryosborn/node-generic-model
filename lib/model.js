var Base;

Base = (function() {
  function Base() {}

  Base.prototype._data = {};

  Base.prototype.get = function(path) {
    var obj;
    obj = this._data;
    path = path.split('.');
    while (obj && path.length) {
      obj = obj[path.shift()];
    }
    return obj;
  };

  Base.prototype.set = function(path, value) {
    var obj;
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
