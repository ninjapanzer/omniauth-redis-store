omniauth-redis-store
====================

[![Gem Version](https://badge.fury.io/rb/omniauth-redis-store.svg)](http://badge.fury.io/rb/omniauth-redis-store)

redis request_store for omniauth

### Usage

    require 'omniauth-redis-store'
        
    OmniAuth.config.logger = Rails.logger
    OmniAuth.config.request_store = OmniAuth::RedisStore
    OmniAuth.config.redis = Redis::Namespace.new('OmniAuth', :redis => REDIS)
