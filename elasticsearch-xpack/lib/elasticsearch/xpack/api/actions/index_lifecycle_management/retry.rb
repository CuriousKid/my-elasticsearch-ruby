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
          # @option arguments [String] :index The name of the indices (comma-separated) whose failed lifecycle step is to be retry

          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-retry-policy.html
          #
          def retry(arguments = {})
            raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

            arguments = arguments.clone

            _index = arguments.delete(:index)

            method = ElasticsearchV7::API::HTTP_POST
            path   = "#{ElasticsearchV7::API::Utils.__listify(_index)}/_ilm/retry"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
