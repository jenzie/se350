require 'test_helper'

class SongTest < ActiveSupport::TestCase

  def test_create_title
    # loads song with an id=1, id=2
    @song1 = Song.find(1)
    @song2 = Song.find(2)
    assert_equal "The Long and Winding Road", @song1.title
    assert_equal "Get Back", @song2.title
  end

  def test_create_year
    # loads song with an id=1, id=2
    @song1 = Song.find(1)
    @song2 = Song.find(2)
    assert_equal 1968, @song1.year
    assert_equal 1968, @song2.year
  end

  def test_create_author
    # loads song with an id=1, id=2
    @song1 = Song.find(1)
    @song2 = Song.find(2)
    assert_equal 1, @song1.author_id
    assert_equal 1, @song2.author_id
  end

  
end
