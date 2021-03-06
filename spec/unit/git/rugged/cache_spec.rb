require 'spec_helper'
require 'r10k/git/rugged/cache'

describe R10K::Git::Rugged::Cache do
  subject(:cache) { described_class.new('git://some/git/remote') }

  it "wraps a Rugged::BareRepository instance" do
    expect(cache.repo).to be_a_kind_of R10K::Git::Rugged::BareRepository
  end

  describe "settings" do
    before do
      R10K::Git::Cache.settings[:cache_root] = '/some/path'
      described_class.settings.reset!
    end

    after do
      R10K::Git::Cache.settings.reset!
      described_class.settings.reset!
    end

    it "falls back to the parent class settings" do
      expect(described_class.settings[:cache_root]).to eq '/some/path'
    end
  end
end
