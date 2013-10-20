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
    fetcher = FETCHERS[host]

    raise_error(url) if fetcher.nil?
    begin
      fetcher.fetch(url)
    rescue StandardError
      raise_error(url)
    end
  end

  private
  def raise_error(url)
    raise UnprocessableHostError.new("Dont know how to handle #{url}.")
  end
end
