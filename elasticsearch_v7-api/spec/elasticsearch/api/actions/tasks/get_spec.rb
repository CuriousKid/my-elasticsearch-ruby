# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client.tasks#get' do

  let(:expected_args) do
    [
        'GET',
        '_tasks/foo1',
        {},
        nil,
        nil
    ]
  end

  it 'performs the request' do
    expect(client_double.tasks.get(task_id: 'foo1')).to eq({})
  end
end
