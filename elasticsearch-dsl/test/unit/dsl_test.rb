# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class DSLTest < ::ElasticsearchV7::Test::UnitTestCase
      context "The DSL" do
        class DummyDSLReceiver
          include ElasticsearchV7::DSL
        end

        should "include the module in receiver" do
          assert_contains DummyDSLReceiver.included_modules, ElasticsearchV7::DSL
          assert_contains DummyDSLReceiver.included_modules, ElasticsearchV7::DSL::Search
        end
      end
    end
  end
end
