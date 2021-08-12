# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Queries

        # A query which returns documents having a span containing a term
        #
        # @example
        #
        #     search do
        #       query do
        #         span_term title: 'disaster'
        #       end
        #     end
        #
        # @see http://elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-span-term-query.html
        # @see https://lucene.apache.org/core/5_0_0/core/org/apache/lucene/search/spans/package-summary.html
        #
        class SpanTerm
          include BaseComponent
        end

      end
    end
  end
end
