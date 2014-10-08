Model = require '../src/model'

describe 'Model', ->

    it 'Create', (done) ->
        model = new Model()
        expect(model).not.toBe(null)
        model = new Model({ something: 1, other: { thing: 2 }})
        expect(model.get('something')).toBe(1)
        expect(model.get('other.thing')).toBe(2)
        expect(model.get('nothing.here')).not.toBeDefined()
        done()

    it 'Set/Get', (done) ->
        model = new Model()
        model.set('foobar', 1)
        expect(model.get('foobar')).toBe(1)
        model.set('many.dot.notations', 1)
        expect(model.get('many.dot.notations')).toBe(1)
        expect(model.get('ficticious.value')).not.toBeDefined()
        model.set({ goober: 1, foobar: { random: 5 }})
        expect(model.get('goober')).toBe(1)
        expect(model.get('foobar.random')).toBe(5)
        expect(model.get('many.dot.notations')).toBe(1)
        done()
