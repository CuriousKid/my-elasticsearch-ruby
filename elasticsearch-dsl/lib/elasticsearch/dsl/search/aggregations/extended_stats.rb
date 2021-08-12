# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Aggregations

        # A multi-value metrics aggregation which returns the extended statistical information on numeric values
        #
        # @example
        #
        #     search do
        #       aggregation :clicks_stats do
        #         extended_stats field: 'clicks'
        #       end
        #     end
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-extendedstats-aggregation.html
        #
        class ExtendedStats
          include BaseComponent
        end

      end
    end
  end
end
