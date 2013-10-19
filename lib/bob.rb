require 'net/http'
require 'oj'
require "bob/version"
require "bob/job"
require 'bob/fetchers'

module Bob
  extend self

  class UnprocessableHostError < StandardError; end


  FETCHERS = {
    'jobs.github.com' => Bob::Fetchers::Github,
    'careers.stackoverflow.com' => Bob::Fetchers::Stackoverflow
  }

  def fetch(url)
    url = URI.encode(url)
    host = URI(url).host
    FETCHERS.fetch(host) do
      raise UnprocessableHostError.new("Dont know how to handle #{url}.")
    end.fetch(url)
  end
end
