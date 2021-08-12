# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

# encoding: UTF-8

require 'test_helper'

module ElasticsearchV7
  module Test
    class SuggestIntegrationTest < ::ElasticsearchV7::Test::IntegrationTestCase
      include ElasticsearchV7::DSL::Search

      context "Suggest integration" do
        startup do
          ElasticsearchV7::Extensions::Test::Cluster.start(number_of_nodes: 1) if ENV['SERVER'] and not ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 1)
        end

        setup do
          @client.indices.create index: 'test', body: {
              mappings: {
                  properties: {
                      title: {type: 'text'},
                      suggest: {
                          type: 'object',
                          properties: {
                              title: {type: 'completion'},
                              payload: {type: 'object', enabled: false}
                          }
                      }
                  }
              }
          }

          @client.index index: 'test', id: '1', body: {
            title: 'One',
            suggest: {
              title: { input: ['one', 'uno', 'jedna'] },
              payload: { id: '1' }
            }
          }
          @client.index index: 'test', id: '2', body: {
            title: 'Two',
            suggest: {
              title: { input: ['two', 'due', 'dvě'] },
              payload: { id: '2' }
            }
          }
          @client.index index: 'test', id: '3', body: {
            title: 'Three',
            suggest: {
              title: { input: ['three', 'tres', 'tři'] },
              payload: { id: '3' }
            }
          }
          @client.indices.refresh index: 'test'
        end

        should "return suggestions" do
          s = search do
            suggest :title, text: 't', completion: { field: 'suggest.title' }
          end

          response = @client.search index: 'test', body: s.to_hash

          assert_equal 2, response['suggest']['title'][0]['options'].size

          assert_same_elements %w[2 3], response['suggest']['title'][0]['options'].map { |d| d['_source']['suggest']['payload']['id'] }
        end

        should "return a single suggestion" do
          s = search do
            suggest :title, text: 'th', completion: { field: 'suggest.title' }
          end

          response = @client.search index: 'test', body: s.to_hash

          assert_equal 1, response['suggest']['title'][0]['options'].size

          assert_same_elements %w[3], response['suggest']['title'][0]['options'].map { |d| d['_source']['suggest']['payload']['id'] }
        end
      end
    end
  end
end
