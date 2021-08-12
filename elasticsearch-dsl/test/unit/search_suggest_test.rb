# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class SearchSuggestTest < ::ElasticsearchV7::Test::UnitTestCase
      subject { ElasticsearchV7::DSL::Search::Suggest.new :foo }

      context "Search suggest" do
        should "be an empty hash by default" do
          assert_equal({ foo: {} }, subject.to_hash)
        end

        should "contain options" do
          subject = ElasticsearchV7::DSL::Search::Suggest.new :foo, boo: 'bam'
          assert_equal({ foo: { boo: 'bam' } }, subject.to_hash)
        end
      end
    end
  end
end
