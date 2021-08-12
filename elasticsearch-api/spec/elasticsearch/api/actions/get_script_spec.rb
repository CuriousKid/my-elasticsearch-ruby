# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client#get_script' do

  let(:expected_args) do
    [
        'GET',
        url,
        params,
        nil
    ]
  end

  let(:params) do
    { }
  end

  let(:url) do
    '_scripts/foo'
  end

  context 'when the `lang` parameter is specificed' do

    let(:params) do
      { master_timeout: '1s' }
    end

    it 'performs the request' do
      expect(client_double.get_script(master_timeout: '1s', id: 'foo')).to eq({})
    end
  end
end
