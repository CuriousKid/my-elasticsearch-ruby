# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module MachineLearning
        module Actions; end

        class MachineLearningClient
          include ElasticsearchV7::API::Common::Client, ElasticsearchV7::API::Common::Client::Base, MachineLearning::Actions
        end

        def machine_learning
          @machine_learning ||= MachineLearningClient.new(self)
        end

        alias :ml :machine_learning

      end
    end
  end
end
