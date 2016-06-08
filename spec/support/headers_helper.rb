module Request
  module HeadersHelper
    def api_header(version = 1)
      request.headers['Accept'] = "application/api.stocker"
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
