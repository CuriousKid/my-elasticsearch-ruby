# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Queries

        # A query which returns documents matching the specified IDs
        #
        # @example
        #
        #     search do
        #       query do
        #         ids values: [1, 2, 3]
        #       end
        #     end
        #
        # @see http://elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-ids-query.html
        #
        class Ids
          include BaseComponent

          option_method :type
          option_method :values
        end

      end
    end
  end
end
