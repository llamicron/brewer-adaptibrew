require_relative "spec_helper"

RSpec.describe Brewer::Adaptibrew do

  before :all do
    @manager = Brewer::Adaptibrew::Manager.new
  end

  it "has a version number" do
    expect(Brewer::Adaptibrew::VERSION).not_to be nil
  end

  describe ".build" do
    before { @manager.clear }
    it "clones adaptibrew" do
      expect(Brewer::Adaptibrew::build).to be true
      expect(@manager.present?).to be true
    end
  end
end
