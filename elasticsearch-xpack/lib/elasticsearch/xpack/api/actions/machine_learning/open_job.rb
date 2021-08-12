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
          # @option arguments [String] :job_id The ID of the job to open

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-open-job.html
          #
          def open_job(arguments = {})
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

            arguments = arguments.clone

            _job_id = arguments.delete(:job_id)

            method = ElasticsearchV7::API::HTTP_POST
            path   = "_ml/anomaly_detectors/#{ElasticsearchV7::API::Utils.__listify(_job_id)}/_open"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
