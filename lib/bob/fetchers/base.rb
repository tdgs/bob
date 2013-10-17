module Bob
  module Fetchers
    class Base
      def get(uri)
        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new(uri)

          http.request request
        end
      end
    end
  end
end
