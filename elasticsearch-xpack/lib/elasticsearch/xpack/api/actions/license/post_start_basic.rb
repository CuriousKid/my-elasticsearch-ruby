# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module License
        module Actions
          # TODO: Description

          #
          # @option arguments [Boolean] :acknowledge whether the user has acknowledged acknowledge messages (default: false)

          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/start-basic.html
          #
          def post_start_basic(arguments = {})
            arguments = arguments.clone

            method = ElasticsearchV7::API::HTTP_POST
            path   = "_license/start_basic"
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:post_start_basic, [
            :acknowledge
          ].freeze)
      end
    end
    end
  end
end
