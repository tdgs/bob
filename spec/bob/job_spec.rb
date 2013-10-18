require 'spec_helper'

describe Bob::Job do
  subject do
    attrs = {
      name: "name",
      url: "url",
      description: "a description",
      company_name: "a company_name",
      company_url: "http://co.mpa.ny",
      company_logo: "http://co.mpa.ny/logo.png",
      extra_info: {
        hello: "World"
      }}
    Bob::Job.new(attrs)
  end

  its(:name) {should == "name"}
  its(:url) {should == "url"}
  its(:description) {should == "a description"}
  its(:company_name) {should == "a company_name"}
  its(:company_url) {should == "http://co.mpa.ny"}
  its(:company_logo) {should == "http://co.mpa.ny/logo.png"}
  its(:extra_info) {should == {hello: "World"}}
end
