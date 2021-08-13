# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class WrapperGemTest < Minitest::Test

      context "Wrapper gem" do

        should "require all neccessary subgems" do
          assert defined? ElasticsearchV7::Client
          assert defined? ElasticsearchV7::API
        end

        should "mix the API into the client" do
          client = ElasticsearchV7::Client.new

          assert_respond_to client, :search
          assert_respond_to client, :cluster
          assert_respond_to client, :indices
        end

      end

    end
  end
end
