module Umengo
  class Params
    attr_accessor :data, :payload, :body, :extra, :policy

    def initialize(data, payload, body, extra, policy)
      @data    = data
      @payload = payload
      @body    = body || {}
      @extra   = extra || {}
      @policy  = policy || {}
    end

    def build_ios
      check_require(data, [:appkey, :timestamp, :type])
      @data[:payload] = payload
      check_require(body, [:alert])
      @data[:payload][:aps] = body
      build_default_ios!
    end

    def build_android
      check_require(data, [:appkey, :timestamp, :type])
      display_type = payload.fetch(:display_type, "notifcation")
      @data[:payload] = payload

      case display_type
      when "notifcation"
        check_require(body, [:ticker, :title, :text, :after_open])
      when "message"
        check_require(body, [:custom])
      end

      @data[:payload][:body] = body
      build_default_android!
    end

    private

    def check_require(hash, keys)
      keys.each do |k|
        raise NotEnoughRequireParamsError, "key #{k}" unless hash.has_key?(k)
      end
    end

    def build_default_ios!
      @data[:policy] = policy if policy.any?
      @data
    end

    def build_default_android!
      @data[:payload][:extra] = extra if extra.any?
      @data[:policy] = policy if policy.any?
      @data
    end

  end
end
