require 'spec_helper'

describe Bob::Fetchers::Github do
  context "with a valid github url" do
    let(:url) do
      "https://jobs.github.com/positions/19341a08-377e-11e3-862f-7f91026928c0"
    end

    subject do
      VCR.use_cassette('github_job') do
        Bob::Fetchers::Github.fetch(url)
      end
    end

    its(:name) {should == "Sr. Mobile Application Developer, Android at ModCloth"}
    its(:description) {should =~ /<p>ModCloth currently has an exciting opportunity for a highly skilled Android developer./}
    its(:company_name) {should == "ModCloth"}
    its(:company_logo) {should == "http://github-jobs.s3.amazonaws.com/f5100178-377d-11e3-8618-7ebb0e979680.png"}
    its(:company_url) {should == "http://www.modcloth.com"}
  end
end
