# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module IndexLifecycleManagement
        module Actions
          # TODO: Description

          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-stop.html
          #
          def stop(arguments = {})
            arguments = arguments.clone

            method = ElasticsearchV7::API::HTTP_POST
            path   = "_ilm/stop"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
