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
          # @option arguments [Boolean] :local Return local information, do not retrieve the state from master node (default: false)

          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/get-license.html
          #
          def get(arguments = {})
            arguments = arguments.clone

            method = ElasticsearchV7::API::HTTP_GET
            path   = "_license"
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:get, [
            :local
          ].freeze)
      end
    end
    end
  end
end
