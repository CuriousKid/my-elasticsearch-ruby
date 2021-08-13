# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Ingest
      module Actions
        # Returns a list of the built-in patterns.
        #

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.5/grok-processor.html#grok-processor-rest-get
        #
        def processor_grok(arguments = {})
          arguments = arguments.clone

          method = ElasticsearchV7::API::HTTP_GET
          path   = "_ingest/processor/grok"
          params = {}

          body = nil
          perform_request(method, path, params, body).body
        end
end
      end
  end
end
