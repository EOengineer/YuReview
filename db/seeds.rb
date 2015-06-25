# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?


  2.times do |a|
    movie = 1
    @user = User.create(first_name: "Bob_#{a}", last_name: "Smith_#{a}", email: "user_#{a}@email.com", password: 'password', password_confirmation: 'password')
      puts "#{@user.first_name} #{@user.last_name}"
    3.times do |b|
      Movie.create(title: "Movie #{a}#{b}", description: "Bacon ipsum dolor amet fatback doner jowl picanha, bresaola rump short ribs tongue ham biltong bacon shankle corned beef t-bone. Pork loin doner spare ribs tri-tip, ground round t-bone corned beef bacon prosciutto pork belly ball tip beef strip steak picanha. Venison hamburger jowl shoulder, sausage meatloaf cupim porchetta flank beef pork ham shank shankle pastrami. Meatloaf short ribs bresaola porchetta picanha ham hock brisket pork belly jerky biltong turkey spare ribs alcatra kielbasa beef. Corned beef cupim fatback tail pig short loin shank beef ribs turducken prosciutto ham hock bresaola alcatra bacon pork loin. Flank bacon short ribs, pork chop ground round shankle venison ham hock frankfurter brisket cupim capicola beef sausage.", year: 1979 )
    end

    6.times do |c|
      Review.create(title: "Review #{a}#{c}", summary: "Review Summary #{a}#{c}", body: "Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.", rating: 8, user_id: a + 1, movie_id: movie)
      movie += 1
    end
  end
end
