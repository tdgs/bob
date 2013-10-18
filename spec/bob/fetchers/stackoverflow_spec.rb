require 'spec_helper'

describe Bob::Fetchers::Stackoverflow do
  context "with a valid github url" do
    let(:url) do
      "http://careers.stackoverflow.com/jobs/21426/senior-web-api-engineer-gamechanger?a=q88RPGaQ"
    end

    subject do
      VCR.use_cassette('stackoverflow_job') do
        Bob::Fetchers::Stackoverflow.fetch(url)
      end
    end

    its(:name) {should == "Senior Web &amp; API Engineer at"}
    its(:description) {should == "Work with cool technology, a great design team, and a ton of data to build one of the most engaging sites on the internet. We use modern technology and processâ\u0080¦"}

    its(:company_logo) {should == "http://media.tumblr.com/tumblr_kv5xo0oUZP1qa9tmv.jpg"}
  end
end
