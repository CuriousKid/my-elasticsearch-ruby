# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Remote
      module Actions; end

      # Client for the "remote" namespace (includes the {Remote::Actions} methods)
      #
      class RemoteClient
        include Common::Client, Common::Client::Base, Remote::Actions
      end

      # Proxy method for {RemoteClient}, available in the receiving object
      #
      def remote
        @remote ||= RemoteClient.new(self)
      end

    end
  end
end
