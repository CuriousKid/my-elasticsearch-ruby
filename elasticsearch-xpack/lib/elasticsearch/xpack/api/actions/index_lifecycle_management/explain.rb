# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module IndexLifecycleManagement
        module Actions
          # Shows an index’s current lifecycle status
          #
          # @option arguments [String] :index The target index (*Required*)
          # @option arguments [Time] :master_timeout Specifies the period of time to wait for a connection to the master node
          # @option arguments [Time] :timeout Specifies the period of time to wait for a response.
          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-explain-lifecycle.html
          #
          def explain(arguments = {})
            raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

            index = ElasticsearchV7::API::Utils.__escape(arguments.delete(:index))

            method = ElasticsearchV7::API::HTTP_GET
            path   = ElasticsearchV7::API::Utils.__pathify index, "_ilm/explain"
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
            body   = nil

            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          ParamsRegistry.register(:explain, [:master_timeout,
                                             :timeout].freeze)
        end
      end
    end
  end
end
