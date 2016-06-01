require 'umengo/res'

module Umengo
  module Util
    def generate_sign(uri, params)
      method = 'POST'
      url = [Umengo::UMENG_HOST, '/', uri]
      post_body = Oj.dump(params)
      Digest::MD5.hexdigest([method, url, post_body, @app_master_secret].join)
    end

    def perform(uri, params)
      conn = Faraday.new(:url => Umengo::UMENG_HOST) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      response = conn.post do |req|
        req.url uri, sign: generate_sign(uri, params)
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end

      Res.new(response, uri)
    end
  end
end
