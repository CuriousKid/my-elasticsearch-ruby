# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class UtilsTest < ::ElasticsearchV7::Test::UnitTestCase
      context "Utils" do
        should "convert a string to camelcase" do
          assert_equal 'Foo', ElasticsearchV7::DSL::Utils.__camelize('foo')
        end

        should "convert an underscored string to camelcase" do
          assert_equal 'FooBar', ElasticsearchV7::DSL::Utils.__camelize('foo_bar')
        end

        should "convert a symbol" do
          assert_equal 'FooBar', ElasticsearchV7::DSL::Utils.__camelize(:foo_bar)
        end
      end
    end
  end
end
