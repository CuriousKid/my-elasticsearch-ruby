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
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/get-basic-status.html
          #
          def get_basic_status(arguments = {})
            arguments = arguments.clone

            method = ElasticsearchV7::API::HTTP_GET
            path   = "_license/basic_status"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
