# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Thinker.delete_all
Thought.delete_all
Follow.delete_all
Thumb.delete_all

nietzsche = Thinker.create([{name: 'Nietzsche', url: 'http://en.wikipedia.org/wiki/Nietzsche'}]).first
descartes = Thinker.create([{name: 'Descartes', url: 'http://en.wikipedia.org/wiki/Descartes'}]).first
aristotle = Thinker.create([{name: 'Aristotle', url: 'http://en.wikipedia.org/wiki/Aristotle'}]).first
plato = Thinker.create([{name: 'Plato', url: 'http://en.wikipedia.org/wiki/Plato'}]).first
socrates = Thinker.create([{name: 'Socrates', url: 'http://en.wikipedia.org/wiki/Socrates'}]).first

aristotelian = Thought.create([{thinker: aristotle, thought: 'A friend to all is a friend to none.'}]).first
platonic = Thought.create([{thinker: plato, thought: 'A good decision is based on knowledge and not on numbers.'}]).first
socratic = Thought.create([{thinker: socrates, thought: 'I know nothing except the fact of my ignorance.'}]).first
cartesian = Thought.create([{thinker: descartes, thought: 'I think therefore I am. But I\'m nobody until my thoughts are shared on this website.'}]).first
nietzschist = Thought.create([{thinker: nietzsche, thought: 'Nobody folows me!'}]).first

Follow.create([{follower: aristotle, followee: plato}])
Follow.create([{follower: aristotle, followee: socrates}])
Follow.create([{follower: plato, followee: socrates}])
Follow.create([{follower: descartes, followee: socrates}])
Follow.create([{follower: descartes, followee: aristotle}])
Follow.create([{follower: descartes, followee: plato}])

Thumb.create([{thinker: plato, thought: socratic}])
Thumb.create([{thinker: descartes, thought: socratic}])
Thumb.create([{thinker: descartes, thought: aristotelian}])
Thumb.create([{thinker: descartes, thought: platonic}])
Thumb.create([{thinker: nietzsche, thought: nietzschist}])
