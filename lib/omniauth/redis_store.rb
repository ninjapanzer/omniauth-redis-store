module OmniAuth
  class Configuration
    attr_accessor :redis
  end

  class RedisStore
    require 'securerandom'
    require 'json'

    OMNIAUTH_REDIS_KEY= 'omniauth.redis_store'
    REDIS_EXPIRE_TIME= 60 #seconds

    attr_reader :env

    def initialize(env)
      @env = env
    end

    def []= (key,value)
      redis.hset(session_id, key, value.to_json)
      redis.expire(session_id, REDIS_EXPIRE_TIME)
    end

    def [] (key)
      JSON.parse(redis.hget(session_id,key))
    rescue TypeError
      {}
    end

    def delete (key)
      val = [key]
      redis.hdel(session_id, key)
      session.delete(OMNIAUTH_REDIS_KEY) unless redis.exists(session_id)
      val
    end

    protected

    def redis
      OmniAuth.config.redis
    end

    def session
      @env['rack.session']
    end

    def session_id
      session[OMNIAUTH_REDIS_KEY] = SecureRandom.uuid if session[OMNIAUTH_REDIS_KEY].nil?
      session[OMNIAUTH_REDIS_KEY]
    end

  end
end