require_relative "../spec_helper"

RSpec.describe Brewer::Adaptibrew::Manager do
  before :each do
    @manager = Brewer::Adaptibrew::Manager.new
  end

  describe "#new" do
    it "can return an object" do
      expect(Brewer::Adaptibrew::Manager.new).to be_an_instance_of Brewer::Adaptibrew::Manager
    end

    it "has a brewer directory" do
      expect(@manager.brewer_dir).to be_an_instance_of String
    end
  end
end
