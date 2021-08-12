# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module DSL
    module Search
      module Filters

        # A filter which returns documents where the field value a specified prefix
        #
        # @example
        #
        #     search do
        #       query do
        #         filtered do
        #           filter do
        #             prefix path: '/usr/local'
        #           end
        #         end
        #       end
        #     end
        #
        # @see http://elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-prefix-filter.html
        #
        class Prefix
          include BaseComponent
        end

      end
    end
  end
end
