require "test_helper"

describe Movie do

  setup { build_movie }
  setup { @movie = Movie.new(title: nil, description: 'description #{n}', year: 1990)}
  teardown { Movie.delete_all }


  it "must be valid" do
    Movie.first.must_be :valid?
    @movie.wont_be :valid?
  end

  private

  def build_movie
    5.times do |n|
      Movie.create(title: "title #{n}", description: 'description #{n}', year: 1990)
    end
  end

  def build_invalid
    Movie.new(title: "nil", description: 'description #{n}', year: 1990)
  end
end
