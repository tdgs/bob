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

    its(:name) {should == "Senior Web &amp;amp; API Engineer at"}
  end
end
