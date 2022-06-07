# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

user = User.create(name: Faker::Name.name, password: "q1w2e3r4", password_confirmation: "q1w2e3r4", email: "qqq@qqq.qqq", is_admin: true)

6.times do |i|
  game = Game.create(
    name: Faker::Game.title, 
    admins: [user.id],
    description: Faker::Books::Lovecraft.sentences.join(' '),
    max_health: rand(10..100), max_energy: rand(10..100), max_stat: rand(10...40)
  )
  game.update(whitelisted: true, whitelist: [user.id]) if i % 3 == 0
  game.update(nsfw: true) if i % 2 == 0

  6.times do |j|
    item = Item.create(name: Faker::Games::DnD.melee_weapon, kind: "artifact", description: Faker::Books::Lovecraft.sentences.join('\n'), game_id: game.id)
    skill = Skill.create(name: Faker::Games::Witcher.sign, kind: "elemental", description: Faker::Books::Lovecraft.sentences.join('\n'), game_id: game.id)

    max_health = rand(10..game.max_health)
    max_energy = rand(10..game.max_energy)
    char = Character.create(
      game_id: game.id, user_id: user.id,
      name: Faker::Games::Witcher.character, age: 20, race: Faker::Games::DnD.race, profession: Faker::Games::DnD.klass, money: 111,  
      health: rand(1..max_health), max_health: max_health,  
      energy: rand(1..max_energy), max_energy: max_energy, 
      strength: rand(1..game.max_stat), stamina: rand(1..game.max_stat), accuracy: rand(1..game.max_stat), agility: rand(1..game.max_stat), 
      intelligence: 2, wisdom: 2, will: 2, charm: 2, skill_ids: [skill.id],
      item_ids: [item.id],
      description: Faker::Books::Lovecraft.sentences.join(' '), biography: Faker::Books::Lovecraft.sentences.join(' '),
      avatar: Faker::Placeholdit.image(size: '200x300', format: 'jpg')
    )
    loc  = Location.create(
      game_id: game.id,
      name: Faker::Fantasy::Tolkien.location, 
      description: Faker::Books::Lovecraft.sentences.join(' '),
      avatar: Faker::Placeholdit.image(size: '200x300', format: 'jpg')
    )
    15.times do
      Post.create(content: Faker::Books::Dune.quote, character_id: char.id, location_id: loc.id)
    end
  end
end
