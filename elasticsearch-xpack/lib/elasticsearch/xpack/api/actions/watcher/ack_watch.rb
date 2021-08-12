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
          # @option arguments [String] :watch_id Watch ID
          # @option arguments [List] :action_id A comma-separated list of the action ids to be acked

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/watcher-api-ack-watch.html
          #
          def ack_watch(arguments = {})
            raise ArgumentError, "Required argument 'watch_id' missing" unless arguments[:watch_id]

            arguments = arguments.clone

            _watch_id = arguments.delete(:watch_id)

            _action_id = arguments.delete(:action_id)

            method = ElasticsearchV7::API::HTTP_PUT
            path   = if _watch_id && _action_id
                       "_watcher/watch/#{ElasticsearchV7::API::Utils.__listify(_watch_id)}/_ack/#{ElasticsearchV7::API::Utils.__listify(_action_id)}"
                     else
                       "_watcher/watch/#{ElasticsearchV7::API::Utils.__listify(_watch_id)}/_ack"
  end
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
