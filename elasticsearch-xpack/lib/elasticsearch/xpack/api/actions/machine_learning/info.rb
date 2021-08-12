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
          # @see [TODO]
          #
          def info(arguments = {})
            arguments = arguments.clone

            method = ElasticsearchV7::API::HTTP_GET
            path   = "_ml/info"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
