require 'open-uri'

module Bob
  module Fetchers
    module Github
      extend self

      def fetch(url)
        response = URI("#{url}.json").read

        create_job ::Oj.load(response)
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
