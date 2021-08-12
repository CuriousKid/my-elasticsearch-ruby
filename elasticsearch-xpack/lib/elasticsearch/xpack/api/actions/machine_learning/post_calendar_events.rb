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
          # @option arguments [String] :calendar_id The ID of the calendar to modify

          # @option arguments [Hash] :body A list of events (*Required*)
          #
          # @see [TODO]
          #
          def post_calendar_events(arguments = {})
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
            raise ArgumentError, "Required argument 'calendar_id' missing" unless arguments[:calendar_id]

            arguments = arguments.clone

            _calendar_id = arguments.delete(:calendar_id)

            method = ElasticsearchV7::API::HTTP_POST
            path   = "_ml/calendars/#{ElasticsearchV7::API::Utils.__listify(_calendar_id)}/events"
            params = {}

            body = arguments[:body]
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
