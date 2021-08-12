# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Indices
      module Actions
        # Closes an index.
        #
        # @option arguments [List] :index A comma separated list of indices to close
        # @option arguments [Time] :timeout Explicit operation timeout
        # @option arguments [Time] :master_timeout Specify timeout for connection to master
        # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
        # @option arguments [Boolean] :allow_no_indices Whether to ignore if a wildcard indices expression resolves into no concrete indices. (This includes `_all` string or when no indices have been specified)
        # @option arguments [String] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both.
        #   (options: open,closed,none,all)

        # @option arguments [String] :wait_for_active_shards Sets the number of active shards to wait for before the operation returns.

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.5/indices-open-close.html
        #
        def close(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = ElasticsearchV7::API::HTTP_POST
          path   = "#{Utils.__listify(_index)}/_close"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil
          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:close, [
          :timeout,
          :master_timeout,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :wait_for_active_shards
        ].freeze)
end
      end
  end
end
