# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe ElasticsearchV7::API do

  describe '#settings' do

    it 'allows access to settings' do
      expect(described_class.settings).not_to be_nil
    end

    it 'has a default serializer' do
      expect(ElasticsearchV7::API.serializer).to eq(MultiJson)
    end

    context 'when settings are changed' do

      before do
        ElasticsearchV7::API.settings[:foo] = 'bar'
      end

      it 'changes the settings' do
        expect(ElasticsearchV7::API.settings[:foo]).to eq('bar')
      end
    end
  end
end
