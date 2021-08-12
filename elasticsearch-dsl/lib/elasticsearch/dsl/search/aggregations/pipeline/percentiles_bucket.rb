# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Aggregations

        # A sibling pipeline aggregation which calculates percentiles across all bucket of a specified metric in a sibling aggregation. 
        #
        # @example Passing the options as a Hash
        #
        #     aggregation :sum_monthly_sales do
        #       percentiles_bucket buckets_path: 'sales_per_month>sales'
        #     end
        #
        # @example Passing the options as a block
        #
        #     aggregation :sum_monthly_sales do
        #       percentiles_bucket do
        #         buckets_path 'sales_per_month>sales'
        #         percents [25.0 50.0 75.0]
        #       end
        #     end
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-pipeline-percentiles-bucket-aggregation.html
        #
        class PercentilesBucket
          include BaseAggregationComponent

          option_method :buckets_path
          option_method :gap_policy
          option_method :format
          option_method :percents
        end
      end
    end
  end
end
