# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module Migration
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :index Index pattern

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/migration-api-deprecation.html
          #
          def deprecations(arguments = {})
            arguments = arguments.clone

            _index = arguments.delete(:index)

            method = ElasticsearchV7::API::HTTP_GET
            path   = if _index
                       "#{ElasticsearchV7::API::Utils.__listify(_index)}/_migration/deprecations"
                     else
                       "_migration/deprecations"
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
