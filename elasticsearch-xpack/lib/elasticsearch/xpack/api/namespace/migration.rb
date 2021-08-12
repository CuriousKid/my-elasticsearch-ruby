# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module Migration
        module Actions; end

        class MigrationClient
          include ElasticsearchV7::API::Common::Client, ElasticsearchV7::API::Common::Client::Base, Migration::Actions
        end

        def migration
          @migration ||= MigrationClient.new(self)
        end

      end
    end
  end
end
