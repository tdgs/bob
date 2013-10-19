require 'spec_helper'

describe Bob do
  describe '#fetch' do
    describe 'Github' do
      let(:url) do
        'https://jobs.github.com/positions/19341a08-377e-11e3-862f-7f91026928c0'
      end

      it 'uses github' do
        Bob::Fetchers::Github.should_receive(:fetch).with(url)
        Bob.fetch(url)
      end
    end

    describe 'Stackoverflow' do
      let(:url) do
        'http://careers.stackoverflow.com/jobs/21426/senior-web-api-engineer-gamechanger?a=q88RPGaQ'
      end

      it 'uses stackoverflow' do
        Bob::Fetchers::Stackoverflow.should_receive(:fetch).with(url)
        Bob.fetch(url)
      end
    end

    describe "Unprocessable host" do
      let(:url) do
        'https://news.ycombinator.com/jobs'
      end

      it 'raises a UnprocessableHostError' do
        expect {
          Bob.fetch(url)
        }.to raise_error Bob::UnprocessableHostError
      end
    end
  end
end
