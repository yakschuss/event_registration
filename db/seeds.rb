attendees = Attendee.all

(attendees.count+1).upto(50) do
    #another possible method for idempotency
    # (users.count..5).each do
    a =  Attendee.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        company: Faker::Company.name
    )

end

events = Event.all

(events.count+1).upto(25) do
    #another possible method for idempotency
    # (users.count..5).each do
    e =  Event.create!(
        name: Faker::Beer.name,
        date: Faker::Date.between(2.days.ago, Date.today),
        description: Faker::Lorem.paragraph
    )

end

puts "#{attendees.count} Attendees created."
puts "#{events.count} Events created."
