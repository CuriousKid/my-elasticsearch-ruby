# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module Graph
        module Actions; end

        class GraphClient
          include ElasticsearchV7::API::Common::Client, ElasticsearchV7::API::Common::Client::Base, Graph::Actions
        end

        def graph
          @graph ||= GraphClient.new(self)
        end

      end
    end
  end
end
