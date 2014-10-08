Model = require '../src/model'

describe 'Model', ->

    it 'Create', (done) ->

        model = new Model()
        expect(model).not.toBe(null)
        done()

    it 'Set/Get', (done) ->

        model = new Model()
        model.set('foobar', 1)
        expect(model.get('foobar')).toBe(1)

        model.set('many.dot.notations', 1)
        expect(model.get('many.dot.notations')).toBe(1)

        expect(model.get('ficticious.value')).not.toBeDefined()

        done()
