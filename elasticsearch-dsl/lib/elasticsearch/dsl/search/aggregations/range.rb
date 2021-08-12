# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Aggregations

        # A multi-bucket aggregation which returns document counts for custom numerical ranges,
        # which define the buckets
        #
        # @example
        #
        #     search do
        #       aggregation :clicks do
        #         range field: 'clicks',
        #               ranges: [
        #                 { to: 10 },
        #                 { from: 10, to: 20 }
        #               ]
        #       end
        #     end
        #
        # @example Using custom names for the ranges
        #
        #     search do
        #       aggregation :clicks do
        #         range do
        #           field 'clicks'
        #           key :low, to: 10
        #           key :mid, from: 10, to: 20
        #         end
        #       end
        #     end
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-range-aggregation.html
        class Range
          include BaseAggregationComponent

          option_method :field
          option_method :script
          option_method :params
          option_method :keyed

          def key(key, value)
            @hash[name].update(@args) if @args
            @hash[name][:keyed] = true unless @hash[name].has_key?(:keyed)
            @hash[name][:ranges] ||= []
            @hash[name][:ranges] << value.merge(key: key) unless @hash[name][:ranges].any? { |i| i[:key] == key }
            self
          end
        end

      end
    end
  end
end
