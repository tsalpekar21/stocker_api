module Request
  module JsonHelper
    def json_response(response)
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end
end
