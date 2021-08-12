# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module Watcher
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :id Watch ID
          # @option arguments [Boolean] :debug indicates whether the watch should execute in debug mode

          # @option arguments [Hash] :body Execution control
          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/watcher-api-execute-watch.html
          #
          def execute_watch(arguments = {})
            arguments = arguments.clone

            _id = arguments.delete(:id)

            method = ElasticsearchV7::API::HTTP_PUT
            path   = if _id
                       "_watcher/watch/#{ElasticsearchV7::API::Utils.__listify(_id)}/_execute"
                     else
                       "_watcher/watch/_execute"
  end
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = arguments[:body]
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:execute_watch, [
            :debug
          ].freeze)
      end
    end
    end
  end
end
