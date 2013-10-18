require 'nokogiri'

module Bob
  module Fetchers
    module Stackoverflow
      extend self

      def fetch(url)
        doc = Nokogiri::HTML(open(url))
        attrs = {}

        doc.css('meta').each do |tag|
          name = tag.attribute('property').
            to_s.match(/\Aog:(?<name>\w*)$/).try(:[], :name)

          next if name.nil?

        end
      end
    end
  end
end
