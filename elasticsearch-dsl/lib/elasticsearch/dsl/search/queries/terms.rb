# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Queries

        # A query which returns documents matching the specified terms
        #
        # @note The specified terms are *not analyzed* (lowercased, stemmed, etc)
        #
        # @example
        #
        #     search do
        #       query do
        #         terms categories: ['World', 'Opinion']
        #       end
        #     end
        #
        # @see http://elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-common-terms-query.html
        #
        class Terms
          include BaseComponent
        end

      end
    end
  end
end
