require_relative "../spec_helper"

RSpec.describe Brewer::Adaptibrew::Manager do
  it "has a version number" do
    expect(Brewer::Adaptibrew::VERSION).not_to be nil
  end

  it "can return an object" do
    expect(Brewer::Adaptibrew::Manager.new).to be_an_instance_of Brewer::Adaptibrew::Manager
  end
end
