# frozen_string_literal: true

require_relative "koi_sendle/version"

module KoiSendle
  autoload :Client, "koi_sendle/client"
  autoload :Error, "koi_sendle/error"
  autoload :Object, "koi_sendle/object"
  autoload :Resource, "koi_sendle/resource"
  # Your code goes here...

  autoload :PingResource, "koi_sendle/resources/ping"
  autoload :QuoteResource, "koi_sendle/resources/quote"
  autoload :OrderResource, "koi_sendle/resources/order"
  autoload :ProductResource, "koi_sendle/resources/product"
  autoload :TrackingResource, "koi_sendle/resources/tracking"

  autoload :Ping, "koi_sendle/objects/ping"
  autoload :Quote, "koi_sendle/objects/quote"
  autoload :Order, "koi_sendle/objects/order"
  autoload :Product, "koi_sendle/objects/product"
  autoload :Tracking, "koi_sendle/objects/tracking"
end
