require "retention_magic/engine"

module RetentionMagic
  mattr_accessor :user_class do
    "User"
  end
  mattr_accessor :activation_counter_columns do
    []
  mattr_accessor :retention_models do
    []
  end
end
