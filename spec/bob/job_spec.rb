require 'spec_helper'

describe Bob::Job do
  subject do
    attrs = {
      name: "name",
      url: "url",
      description: "a description",
      extra_info: {
        hello: "World"
      }}
    Bob::Job.new(attrs)
  end

  its(:name) {should == "name"}
  its(:url) {should == "url"}
  its(:description) {should == "a description"}
  its(:extra_info) {should == {hello: "World"}}
end
