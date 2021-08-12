# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module MachineLearning
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :datafeed_id The ID of the datafeeds stats to fetch
          # @option arguments [Boolean] :allow_no_datafeeds Whether to ignore if a wildcard expression matches no datafeeds. (This includes `_all` string or when no datafeeds have been specified)

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-datafeed-stats.html
          #
          def get_datafeed_stats(arguments = {})
            arguments = arguments.clone

            _datafeed_id = arguments.delete(:datafeed_id)

            method = ElasticsearchV7::API::HTTP_GET
            path   = if _datafeed_id
                       "_ml/datafeeds/#{ElasticsearchV7::API::Utils.__listify(_datafeed_id)}/_stats"
                     else
                       "_ml/datafeeds/_stats"
  end
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:get_datafeed_stats, [
            :allow_no_datafeeds
          ].freeze)
      end
    end
    end
  end
end
