# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module MachineLearning
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :filter_id The ID of the filter to delete

          #
          # @see [TODO]
          #
          def delete_filter(arguments = {})
            raise ArgumentError, "Required argument 'filter_id' missing" unless arguments[:filter_id]

            arguments = arguments.clone

            _filter_id = arguments.delete(:filter_id)

            method = ElasticsearchV7::API::HTTP_DELETE
            path   = "_ml/filters/#{ElasticsearchV7::API::Utils.__listify(_filter_id)}"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
