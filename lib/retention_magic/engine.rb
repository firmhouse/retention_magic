require "chartkick"
require "bootstrap-sass"

module RetentionMagic
  class Engine < ::Rails::Engine
    isolate_namespace RetentionMagic

    config.to_prepare do
      ActionView::Base.send :include, Chartkick::Helper
    end
  end
end
