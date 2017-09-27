$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "diegoedoolsapi"

require "minitest/autorun"

class Minitest::Test
  def school_token
    school_token = Diegoedoolsapi.configuration.token = "d632d9a892d87ee3e3bd799a30f18335:895ed89b5f1f3f04faaf33190b78d1c7"
  end
end