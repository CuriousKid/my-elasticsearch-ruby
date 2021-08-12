# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class QueryIntegrationTest < ::ElasticsearchV7::Test::IntegrationTestCase
      include ElasticsearchV7::DSL::Search

      context "Queries integration" do
        startup do
          ElasticsearchV7::Extensions::Test::Cluster.start(number_of_nodes: 1) if ENV['SERVER'] and not ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 1)
        end

        setup do
          @client.indices.create index: 'test'
          @client.index index: 'test', id: '1', body: { title: 'Test', tags: ['one'] }
          @client.index index: 'test', id: '2', body: { title: 'Rest', tags: ['one', 'two'] }
          @client.indices.refresh index: 'test'
        end

        context "for match query" do
          should "find the document" do
            response = @client.search index: 'test', body: search { query { match title: 'test' } }.to_hash

            assert_equal 1, response['hits']['total']['value']
          end
        end

        context "for match_phrase_prefix query" do
          should "find the document" do
            response = @client.search index: 'test', body: search { query { match_phrase_prefix title: 'te' } }.to_hash

            assert_equal 1, response['hits']['total']['value']
          end
        end

        context "for query_string query" do
          should "find the document" do
            response = @client.search index: 'test', body: search { query { query_string { query 'te*' } } }.to_hash

            assert_equal 1, response['hits']['total']['value']
          end
        end

        context "for the bool query" do
          should "find the document" do
            response = @client.search index: 'test', body: search {
                query do
                  bool do
                    must   { terms tags: ['one'] }
                    should { match title: 'Test' }
                  end
                end
              }.to_hash

            assert_equal 2, response['hits']['total']['value']
            assert_equal 'Test', response['hits']['hits'][0]['_source']['title']
          end

          should "find the document with a filter" do
            skip "Not supported on this ElasticsearchV7 version" unless @version > '2'

            response = @client.search index: 'test', body: search {
                query do
                  bool do
                    filter  { terms tags: ['one'] }
                    filter  { terms tags: ['two'] }
                  end
                end
              }.to_hash

            assert_equal 1, response['hits']['total']['value']
            assert_equal 'Rest', response['hits']['hits'][0]['_source']['title']
          end
        end

      end
    end
  end
end
