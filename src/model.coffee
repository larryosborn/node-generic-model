
isObject = (value) -> {}.toString.call(value) is '[object Object]'

class Base

    constructor: (data) ->
        @_data = data if data

    _data: {}

    get: (path, def) ->
        obj = @_data
        path = path.split '.'
        obj = obj[path.shift()] while obj and path.length
        return def if typeof obj is 'undefined' and typeof def isnt 'undefined'
        return obj

    set: (path, value) ->
        if isObject path
            @_data[key] = value for key, value of path
            return
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