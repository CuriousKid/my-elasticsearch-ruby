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
          # @option arguments [String] :job_id The ID of the job to delete
          # @option arguments [Boolean] :force True if the job should be forcefully deleted
          # @option arguments [Boolean] :wait_for_completion Should this request wait until the operation has completed before returning

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-job.html
          #
          def delete_job(arguments = {})
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

            arguments = arguments.clone

            _job_id = arguments.delete(:job_id)

            method = ElasticsearchV7::API::HTTP_DELETE
            path   = "_ml/anomaly_detectors/#{ElasticsearchV7::API::Utils.__listify(_job_id)}"
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:delete_job, [
            :force,
            :wait_for_completion
          ].freeze)
      end
    end
    end
  end
end
