# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client.cluster#put_settings' do

  let(:expected_args) do
    [
        'PUT',
        '_cluster/settings',
        {},
        {},
        nil
    ]
  end

  it 'performs the request' do
    expect(client_double.cluster.put_settings(body: {})).to eq({})
  end
end
