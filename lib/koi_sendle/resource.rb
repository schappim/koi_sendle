module KoiSendle
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, headers)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    def put_request(url, body:, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def delete_request(url, params: {}, headers: {})
      handle_response client.connection.delete(url, params, headers)
    end

    def handle_response(response)
      # puts response.body
      # puts response.status
      case response.status
      when 400
        raise Error, "#{response.body["error_description"]}"
      when 401
        raise Error, "#{response.body["error_description"]}"
      when 403
        raise Error, "#{response.body["error_description"]}"
      when 404
        raise Error, "#{response.body["error_description"]}"
      when 429
        raise Error, "#{response.body["error_description"]}"
      when 500
        raise Error, "#{response.body["error_description"]}"
      when 503
        raise Error, "#{response.body["error_description"]}"
      end

      response
    end
  end
end