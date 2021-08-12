# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class BaseAggregationComponentTest < ::ElasticsearchV7::Test::UnitTestCase
      context "BaseAggregationComponent" do

        class DummyAggregationComponent
          include ::ElasticsearchV7::DSL::Search::BaseAggregationComponent
        end

        class ::ElasticsearchV7::DSL::Search::Aggregations::Dummy
          include ::ElasticsearchV7::DSL::Search::BaseAggregationComponent
        end

        subject { DummyAggregationComponent.new }

        should "return an instance of the aggregation by name" do
          assert_instance_of ::ElasticsearchV7::DSL::Search::Aggregations::Dummy, subject.dummy
        end

        should "raise an exception when unknown aggregation is called" do
          assert_raise(NoMethodError) { subject.foobar }
        end

        should "add a nested aggregation" do
          subject.aggregation :inner do
            dummy field: 'foo'
          end

          assert ! subject.aggregations.empty?, "#{subject.aggregations.inspect} is empty"

          assert_instance_of ElasticsearchV7::DSL::Search::Aggregation, subject.aggregations[:inner]
          assert_equal( {:dummy=>{:field=>"foo"}}, subject.aggregations[:inner].to_hash )

          assert_equal 'foo', subject.to_hash[:aggregations][:inner][:dummy][:field]
        end
      end
    end
  end
end
