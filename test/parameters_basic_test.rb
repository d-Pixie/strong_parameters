require 'test_helper'
require 'action_controller/parameters'

class BasicParametersTest < ActiveSupport::TestCase
  test 'KeyError in fetch block should not be coverd up' do
    params = ActionController::Parameters.new()
    err = assert_raises(KeyError){
      params.fetch(:missing_key){ raise(KeyError, "key not found: :also_missing") }
    }
    assert_match /also_missing/, err.message
  end
end