# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Ingest
      module Actions; end

      # Client for the "ingest" namespace (includes the {Ingest::Actions} methods)
      #
      class IngestClient
        include Common::Client, Common::Client::Base, Ingest::Actions
      end

      # Proxy method for {IngestClient}, available in the receiving object
      #
      def ingest
        @ingest ||= IngestClient.new(self)
      end

    end
  end
end
