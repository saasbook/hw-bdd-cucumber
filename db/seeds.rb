# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed the RottenPotatoes DB with some movies.
movies = [{ title: 'Aladdin', rating: 'G', release_date: '25-Nov-1992' },
          { title: 'The Terminator', rating: 'R', release_date: '26-Oct-1984' },
          { title: 'When Harry Met Sally', rating: 'R', release_date: '21-Jul-1989' },
          { title: 'The Help', rating: 'PG-13', release_date: '10-Aug-2011' },
          { title: 'Chocolat', rating: 'PG-13', release_date: '5-Jan-2001' },
          { title: 'Amelie', rating: 'R', release_date: '25-Apr-2001' },
          { title: '2001: A Space Odyssey', rating: 'G', release_date: '6-Apr-1968' },
          { title: 'The Incredibles', rating: 'PG', release_date: '5-Nov-2004' },
          { title: 'Raiders of the Lost Ark', rating: 'PG', release_date: '12-Jun-1981' },
          { title: 'Chicken Run', rating: 'G', release_date: '21-Jun-2000' }]

movies.each do |movie|
  Movie.create!(movie)
end
