module Umengo
  class Res
    attr_reader :type, :body, :status

    def initialize(response, uri)
      @type = uri
      @status = response.status
      @body = response.body
    end

    def ok?
      status == 200
    end

    def json_body
      Oj.load(@body)
    end
  end
end
