module Request
  module HeadersHelper
    def api_header(version = 1)
      request.headers['Accept'] = "application/api.stocker"
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
      request.headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
      request.headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS DELETE UPDATE}.join(",")
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
