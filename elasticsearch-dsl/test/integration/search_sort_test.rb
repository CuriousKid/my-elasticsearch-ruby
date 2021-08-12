# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class SortingIntegrationTest < ::ElasticsearchV7::Test::IntegrationTestCase
      include ElasticsearchV7::DSL::Search

      context "Sorting integration" do
        startup do
          ElasticsearchV7::Extensions::Test::Cluster.start(number_of_nodes: 1) if ENV['SERVER'] and not ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 1)
        end

        setup do
          @client.indices.create index: 'test'
          @client.index index: 'test', id: '1', body: { tags: ['one'], clicks: 15 }
          @client.index index: 'test', id: '2', body: { tags: ['one', 'two'], clicks: 5 }
          @client.index index: 'test', id: '3', body: { tags: ['one', 'three'], clicks: 20 }
          @client.indices.refresh index: 'test'
        end

        context "sorting by clicks" do
          should "return documents in order" do
            response = @client.search index: 'test', body: search {
              sort do
                by :clicks, order: 'desc'
              end
            }.to_hash

            assert_same_elements ['3', '1', '2'], response['hits']['hits'].map { |d| d['_id'] }
          end
        end

      end
    end
  end
end
