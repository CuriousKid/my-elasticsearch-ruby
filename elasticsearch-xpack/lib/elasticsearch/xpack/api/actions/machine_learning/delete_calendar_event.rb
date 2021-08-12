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
          # @option arguments [String] :event_id The ID of the event to remove from the calendar

          #
          # @see [TODO]
          #
          def delete_calendar_event(arguments = {})
            raise ArgumentError, "Required argument 'calendar_id' missing" unless arguments[:calendar_id]
            raise ArgumentError, "Required argument 'event_id' missing" unless arguments[:event_id]

            arguments = arguments.clone

            _calendar_id = arguments.delete(:calendar_id)

            _event_id = arguments.delete(:event_id)

            method = ElasticsearchV7::API::HTTP_DELETE
            path   = "_ml/calendars/#{ElasticsearchV7::API::Utils.__listify(_calendar_id)}/events/#{ElasticsearchV7::API::Utils.__listify(_event_id)}"
            params = {}

            body = nil
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
