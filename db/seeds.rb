# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: "Katsu", password: "q1w2e3r4", password_confirmation: "q1w2e3r4", email: "qqq@qqq.qqq", is_admin: true)

6.times do |i|
  game = Game.create(name: "Nyan #{rand}", admins: [user.id])
  game.update(whitelisted: true, whitelist: [user.id]) if i % 3 == 0
  game.update(nsfw: true) if i % 2 == 0

  5.times do |j|
    item = Item.create(name: "Item #{rand}", kind: "artifact", description: "Powerful artifact", game_id: game.id)
    skill = Skill.create(name: "Skill #{rand}", kind: "elemental", description: "Fire Magic", game_id: game.id)

    char = Character.create(
      game_id: game.id, user_id: user.id,
      name: "Feris #{rand}", age: 20, race: "Neko", profession: "Archer", money: 111,  
      health: 11, max_health: 15, strength: 2, stamina: 2, accuracy: 2, agility: 2, 
      energy: 11, max_energy: 15, intelligence: 2, wisdom: 2, will: 2, charm: 2,
      description: "Brave Catgirl", biography: "Hard childhood", items: [item.id], skills: [skill.id]
    )
    loc  = Location.create(
      game_id: game.id,
      name: "Temple #{rand}", 
      description: "Gorgeous temple"
    )
    5.times do
      Post.create(content: "#{rand}", character_id: char.id, location_id: loc.id)
    end
  end
end
