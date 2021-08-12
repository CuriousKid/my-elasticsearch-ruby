# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class SearchIntegrationTest < ::ElasticsearchV7::Test::IntegrationTestCase
      include ElasticsearchV7::DSL::Search

      class MySearch
        include ElasticsearchV7::DSL::Search

        def initialize(q)
          @q = q
        end

        def tags
          %w[ one two ]
        end

        def search_definition
          search do |q|
            q.query do |q|
              q.bool do |q|
                q.must do |q|
                  q.match title: @q
                end
                q.must do |q|
                  q.terms tags: tags
                end
              end
            end
          end
        end
      end

      context "The Search class" do
        startup do
          ElasticsearchV7::Extensions::Test::Cluster.start(number_of_nodes: 1) if ENV['SERVER'] and not ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 1)
        end

        setup do
          @client.indices.create index: 'test'
          @client.index index: 'test', id: '1', body: { title: 'Test', tags: ['one'] }
          @client.index index: 'test', id: '2', body: { title: 'Test', tags: ['one', 'two'] }
          @client.index index: 'test', id: '3', body: { title: 'Test', tags: ['three'] }
          @client.indices.refresh index: 'test'
        end


        should "have access to the calling context" do
          s = MySearch.new('test')
          response = @client.search index: 'test', body: s.search_definition.to_hash

          assert_equal 2, response['hits']['total']['value']
          assert_equal 'Test', response['hits']['hits'][0]['_source']['title']
          assert_same_elements ['1', '2'], response['hits']['hits'].map { |d| d['_id'] }
        end
      end
    end
  end
end
