# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module MachineLearning
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :job_id The ID of the job to forecast for
          # @option arguments [Time] :duration The duration of the forecast
          # @option arguments [Time] :expires_in The time interval after which the forecast expires. Expired forecasts will be deleted at the first opportunity.

          #
          # @see [TODO]
          #
          def forecast(arguments = {})
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

            arguments = arguments.clone

            _job_id = arguments.delete(:job_id)

            method = ElasticsearchV7::API::HTTP_POST
            path   = "_ml/anomaly_detectors/#{ElasticsearchV7::API::Utils.__listify(_job_id)}/_forecast"
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:forecast, [
            :duration,
            :expires_in
          ].freeze)
      end
    end
    end
  end
end
