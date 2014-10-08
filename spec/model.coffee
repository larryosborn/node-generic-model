Model = require '../src/model'

describe 'Model', ->

    it 'Simple Create', (done) ->
        model = new Model()
        expect(model).not.toBe(null)
        done()

    it 'Create with object', (done) ->
        model = new Model({ something: 1, other: { thing: 2 }})
        expect(model.get('something')).toBe(1)
        expect(model.get('other.thing')).toBe(2)
        expect(model.get('nothing.here')).not.toBeDefined()
        done()

    it 'Simple get/set', (done) ->
        model = new Model()
        model.set('foobar', 1)
        expect(model.get('foobar')).toBe(1)
        done()

    it 'Dot notation Get/Set', (done) ->
        model = new Model()
        model.set('many.dot.notations', 1)
        expect(model.get('many.dot.notations')).toBe(1)
        expect(model.get('ficticious.value')).not.toBeDefined()
        done()

    it 'Set with object', (done) ->
        model = new Model()
        model.set('many.dot.notations', 1)
        model.set({ goober: 1, foobar: { random: 5 }})
        expect(model.get('goober')).toBe(1)
        expect(model.get('foobar.random')).toBe(5)
        expect(model.get('many.dot.notations')).toBe(1)
        done()

    it 'Get with default value', (done) ->
        model = new Model()
        expect(model.get('some.fake.object', 9)).toBe(9)
        expect(model.get('some.fake.object')).not.toBeDefined()
        done()
