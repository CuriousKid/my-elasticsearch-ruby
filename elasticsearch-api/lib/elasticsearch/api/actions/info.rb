# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Actions
      # Returns basic information about the cluster.
      #

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.5/index.html
      #
      def info(arguments = {})
        arguments = arguments.clone

        method = ElasticsearchV7::API::HTTP_GET
        path   = ""
        params = {}

        body = nil
        perform_request(method, path, params, body).body
      end
    end
    end
end
