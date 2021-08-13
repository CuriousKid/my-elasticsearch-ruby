# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client.snapshot#verify_repository' do

  let(:expected_args) do
    [
        'POST',
        '_snapshot/foo/_verify',
        {},
        nil,
        nil
    ]
  end

  it 'performs the request' do
    expect(client_double.snapshot.verify_repository(repository: 'foo')).to eq({})
  end
end
