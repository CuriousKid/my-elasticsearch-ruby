# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Actions
      # Allows an arbitrary script to be executed and a result to be returned
      #

      # @option arguments [Hash] :body The script to execute
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/painless/7.5/painless-execute-api.html
      #
      def scripts_painless_execute(arguments = {})
        arguments = arguments.clone

        method = ElasticsearchV7::API::HTTP_GET
        path   = "_scripts/painless/_execute"
        params = {}

        body = arguments[:body]
        perform_request(method, path, params, body).body
      end
    end
    end
end
