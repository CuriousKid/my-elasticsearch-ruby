# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

class ElasticsearchV7::Transport::Transport::SerializerTest < Minitest::Test

  context "Serializer" do

    should "use MultiJson by default" do
      ::MultiJson.expects(:load)
      ::MultiJson.expects(:dump)
      ElasticsearchV7::Transport::Transport::Serializer::MultiJson.new.load('{}')
      ElasticsearchV7::Transport::Transport::Serializer::MultiJson.new.dump({})
    end

  end

end
