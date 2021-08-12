# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Nodes
      module Actions; end

      # Client for the "nodes" namespace (includes the {Nodes::Actions} methods)
      #
      class NodesClient
        include Common::Client, Common::Client::Base, Nodes::Actions
      end

      # Proxy method for {NodesClient}, available in the receiving object
      #
      def nodes
        @nodes ||= NodesClient.new(self)
      end

    end
  end
end
