# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe ElasticsearchV7::DSL::Search::Aggregations::Composite do

  let(:search) do
    described_class.new
  end

  describe '#to_hash' do

    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(composite: {})
    end
  end

  context 'when options methods are called' do

    let(:search) do
      described_class.new(:foo)
    end

    describe '#size' do

      before do
        search.size(2_000)
      end

      it 'applies the option' do
        expect(search.to_hash[:composite][:foo][:size]).to eq(2_000)
      end
    end

    describe '#sources' do

      before do
        search.sources('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:composite][:foo][:sources]).to eq('bar')
      end
    end

    describe '#after' do
      context 'when after is not given' do
        before do
          search.size(2_000)
        end

        it 'applies the option' do
          expect(search.to_hash[:composite][:foo].keys).not_to include(:after)
        end
      end

      context 'when after is given' do
        before do
          search.after('fake_after_key')
        end

        it 'applies the option' do
          expect(search.to_hash[:composite][:foo][:after]).to eq('fake_after_key')
        end
      end
    end
  end

  describe '#initialize' do

    context 'when a block is provided' do

      let(:search) do
        described_class.new(:foo) do
          size 2_000
        end
      end

      it 'executes the block' do
        expect(search.to_hash).to eq({ composite: { foo: { size: 2_000 } } })
      end
    end
  end
end
