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
          # @option arguments [String] :policy The name of the index lifecycle policy

          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-delete-lifecycle.html
          #
          def delete_lifecycle(arguments = {})
            raise ArgumentError, "Required argument 'policy' missing" unless arguments[:policy]

            arguments = arguments.clone

            _policy = arguments.delete(:policy)

            method = ElasticsearchV7::API::HTTP_DELETE
            path   = "_ilm/policy/#{ElasticsearchV7::API::Utils.__listify(_policy)}"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
