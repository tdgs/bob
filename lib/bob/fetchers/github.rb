module Bob
  module Fetchers
    class Github < Base
      def fetch(url)
        uri = URI("#{url}.json")
        response = get uri

        data = ::Oj.load(response.body)

        create_job(data)
      end
    end

    def create_job(data)
      name = data["title"]
      description = data["description"]
      extra_info = data

      ::Bob::Job.new(name: name, description: description, extra_info: extra_info)
    end
  end
end
