require 'umengo/service'

module Umengo
  module Req
    include Umengo::Service

    def broadcast(opts)
      basic_data = {
        type: 'broadcast',
        production_mode: opts[:production_mode] || "false"
      }
      opts[:data] = opts.fetch(:data, {}).merge(basic_data)

      push(@plantform, opts)
    end

    def unicast(device_tokens, opts)
      basic_data = {
        device_tokens: device_tokens,
        type: 'unicast',
        production_mode: opts[:production_mode] || "false"
      }
      opts[:data] = opts.fetch(:data, {}).merge(basic_data)

      push(@plantform, opts)
    end

    def listcast(device_tokens, opts)
      basic_data = {
        device_tokens: device_tokens,
        type: 'listcast',
        production_mode: opts[:production_mode] || "false"
      }
      opts[:data] = opts.fetch(:data, {}).merge(basic_data)

      push(@plantform, opts)
    end
  end
end
