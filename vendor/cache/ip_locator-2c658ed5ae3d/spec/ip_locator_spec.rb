require 'spec_helper'

describe IpLocator do
  before do
    IpLocator.reset!
  end

  after do
    IpLocator.reset!
  end

  it "sets defaults" do
    IpLocator::Configurable.keys.each do |key|
      expect(IpLocator.instance_variable_get(:"@#{key}")).to eq(IpLocator::Default.send(key))
    end
  end

  describe ".client" do
    it "creates a IpLocator::Client" do
      expect(IpLocator.client).to be_kind_of IpLocator::Client
    end
    it "caches the client when the same options are passed" do
      expect(IpLocator.client).to eq(IpLocator.client)
    end
    it "returns a fresh client when options are not the same" do
      client = IpLocator.client
      IpLocator.user_agent = "Some other value"
      client_two = IpLocator.client
      client_three = IpLocator.client
      expect(client).not_to eq(client_two)
      expect(client_three).to eq(client_two)
    end
  end

  describe ".configure" do
    IpLocator::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_',' ')}" do
        IpLocator.configure do |config|
          config.send("#{key}=", key)
        end
        expect(IpLocator.instance_variable_get(:"@#{key}")).to eq(key)
      end
    end
  end

end