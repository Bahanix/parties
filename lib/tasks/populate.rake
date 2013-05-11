namespace :db do
  desc "Create some Parties"
  task :populate => :environment do
    require 'faker'

    [Party].each(&:destroy_all)
    [Item, Participant].each(&:delete_all)

    2.times do |i|
      party = Party.new
      party.name = "party#{i}"
      party.description = Faker::Lorem.sentences(1..3)
      party.location = Faker::Address.street_address
      party.start_at = Time.now
      rand(5..10).times do
        item = Item.new
        item.name = Faker::Lorem.words(1)
        party.items << item
      end
      rand(4..12).times do
        p = Participant.new
        p.name = Faker::Name.name
        party.participants << p
        p.items << Item.where(party_id: party.id).order('random()').limit(rand(1..5))
      end
      party.save
    end
  end
end


