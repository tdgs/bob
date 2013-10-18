module Bob
  module Fetchers
    module Github
      include ::Bob::Fetchers::Base
      extend self

      def fetch(url)
        uri = URI("#{url}.json")
        response = get uri

        data = ::Oj.load(response.body)

        create_job(data)
      end

      def create_job(data)
        opts = {
          name: data["title"],
          description: data["description"],
          company_name: data["company"],
          company_logo: data["company_logo"],
          company_url: data["company_url"],
          extra_info: data
        }

        ::Bob::Job.new(opts)
      end
    end
  end
end
