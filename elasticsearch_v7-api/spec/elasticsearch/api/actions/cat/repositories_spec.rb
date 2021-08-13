# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client.cat#repositories' do

  let(:expected_args) do
    [
        'GET',
        '_cat/repositories',
        {},
        nil,
        nil
    ]
  end

  it 'performs the request' do
    expect(client_double.cat.repositories).to eq({})
  end
end
