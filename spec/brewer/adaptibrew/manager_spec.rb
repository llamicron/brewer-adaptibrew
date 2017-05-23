require_relative "../spec_helper"

RSpec.describe Brewer::Adaptibrew::Manager do
  before :each do
    @manager = Brewer::Adaptibrew::Manager.new
  end

  after :all do
    @manager.clone
  end

  describe "#new" do
    it "can return an object" do
      expect(Brewer::Adaptibrew::Manager.new).to be_an_instance_of Brewer::Adaptibrew::Manager
    end

    it "has a brewer directory" do
      expect(@manager.brewer_dir).to be_an_instance_of String
    end
  end

  describe ".clone" do
    before { @manager.clear }
    it "can clone the adaptibrew repo" do
      expect(@manager.clone).to be true
      expect(@manager.present?).to be true
    end

    context "when it already exists" do
      before { @manager.clone }
      it "returns false" do
        expect(@manager.clone).to be false
      end
    end
  end

  describe ".clear" do
    before { @manager.clone }
    it "can clear the adaptibrew repo" do
      expect(@manager.clear).to be true
      expect(@manager.present?).to be false
    end

    context "when it does not exist" do
      before { @manager.clear }
      it "returns false" do
        expect(@manager.clear).to be false
      end
    end
  end

  describe ".refresh" do
    it "clears and clones the repo" do
      expect(@manager.refresh).to be true
    end
  end

  describe ".implode" do
    specify { expect(@manager.present?).to be true }
    it "should destroy the brewer_dir" do
      expect(@manager.implode).to be true
      expect(@manager.present?).to be false
    end

    context "when it does not exists" do
      before { @manager.implode }
      it "should return false" do
        expect(@manager.implode).to be false
      end
    end
  end

  describe ".build" do
    before { @manager.implode }
    it "creates the brewer directory and clones adaptibrew" do
      expect(@manager.build).to be true
      expect(@manager.present?).to be true
    end
  end

end
