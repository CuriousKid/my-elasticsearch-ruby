# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module XPack
    module API
      module Rollup
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :id The ID of the job(s) to fetch. Accepts glob patterns, or left blank for all jobs

          #
          # @see
          #
          def get_jobs(arguments = {})
            arguments = arguments.clone

            _id = arguments.delete(:id)

            method = ElasticsearchV7::API::HTTP_GET
            path   = if _id
                       "_rollup/job/#{ElasticsearchV7::API::Utils.__listify(_id)}"
                     else
                       "_rollup/job"
  end
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
