require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def test_create_name
    # loads authors with an id=1
    @author1 = Author.find(1)
    assert_equal "The Beatles", @author1.name
  end  

end
