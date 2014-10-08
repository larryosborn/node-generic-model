class Base

    _data: {}

    get: (path) ->
        obj = @_data
        path = path.split '.'
        obj = obj[path.shift()] while obj and path.length
        return obj

    set: (path, value) ->
        path = path.split '.'
        obj = @_data
        while obj and path.length - 1
            if obj[path[0]]
                obj = obj[path[0]]
            else
                obj = obj[path[0]] = {}
            path.shift()
        obj[path.shift()] = value

    read: ->
    save: ->
    delete: ->

module.exports = Base