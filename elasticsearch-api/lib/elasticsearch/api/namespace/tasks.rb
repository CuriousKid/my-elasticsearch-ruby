# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Tasks
      module Actions; end

      # Client for the "tasks" namespace (includes the {Tasks::Actions} methods)
      #
      class TasksClient
        include Common::Client, Common::Client::Base, Tasks::Actions
      end

      # Proxy method for {TasksClient}, available in the receiving object
      #
      def tasks
        @tasks ||= TasksClient.new(self)
      end

    end
  end
end
