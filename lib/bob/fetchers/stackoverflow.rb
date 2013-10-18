require 'nokogiri'

module Bob
  module Fetchers
    module Stackoverflow
      extend self

      def fetch(url)
        doc = Nokogiri::HTML(open(url))
        attrs = {}

        doc.css('meta').each do |tag|
          property = tag.attribute('property').to_s
          property = tag.attribute('name').to_s if property.empty?

          next unless property.match(/\A(\w+):(\w*)$/)

          attrs[property] = tag.attribute('content').to_s
        end

        create_job(attrs)
      end

      def create_job(attrs)
        opts = {}
        opts[:name] = attrs["og:title"].strip
        opts[:description] = attrs["og:description"].strip
        opts[:company_logo] = attrs["twitter:image"].strip
        opts[:extra_info] = attrs

        ::Bob::Job.new(opts)
      end
    end
  end
end
