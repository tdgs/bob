require 'spec_helper'

describe Bob::Fetchers::Stackoverflow do
  context "with a valid github url" do
    let(:url) do
      "http://careers.stackoverflow.com/company/stadtwerke-m%C3%BCnchen"
    end

    subject do
      VCR.use_cassette('stackoverflow_job') do
        Bob::Fetchers::Stackoverflow.fetch(url)
      end
    end

    its(:name) {should == "Stadtwerke München GmbH"}
    its(:description) {should == "Die Stadtwerke M&amp;uuml;nchen (SWM) z&amp;auml;hlen zu den gr&amp;ouml;&amp;szlig;ten Energie- und Infrastrukturunternehmen Deutschlands. &amp;Uuml;ber eine Million Privathaushalte, Gewerbe- und Gesch&amp;auml;ftskundenâ\u0080¦"}

    its(:company_logo) {should == "http://i.stack.imgur.com/ghuhbl.jpg"}
  end
end
