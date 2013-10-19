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
        opts[:name] = any_of(attrs, "og:title", "twitter:title")
        opts[:description] = any_of(attrs, "og:description", "twitter:description")
        opts[:company_logo] = any_of(attrs, "twitter:image")
        opts[:extra_info] = attrs

        ::Bob::Job.new(opts)
      end

      private
      def any_of(hash, *keys)
        hash.values_at(*keys).compact.map(&:strip).first
      end
    end
  end
end
