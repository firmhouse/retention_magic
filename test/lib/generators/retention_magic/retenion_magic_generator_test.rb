require 'test_helper'
require 'generators/retention_magic/retention_magic_generator'

module RetentionMagic
  class RetentionMagicGeneratorTest < Rails::Generators::TestCase
    tests RetentionMagicGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test "generator runs without errors" do
      assert_nothing_raised do
        run_generator
      end
    end
  end
end
