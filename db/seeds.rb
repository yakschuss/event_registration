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
puts "#{attendees.count} Attendees created."
