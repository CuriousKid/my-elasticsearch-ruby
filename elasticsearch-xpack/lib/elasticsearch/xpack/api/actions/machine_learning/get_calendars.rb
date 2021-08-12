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
          # @option arguments [String] :calendar_id The ID of the calendar to fetch
          # @option arguments [Int] :from skips a number of calendars
          # @option arguments [Int] :size specifies a max number of calendars to get

          # @option arguments [Hash] :body The from and size parameters optionally sent in the body
          #
          # @see [TODO]
          #
          def get_calendars(arguments = {})
            arguments = arguments.clone

            _calendar_id = arguments.delete(:calendar_id)

            method = ElasticsearchV7::API::HTTP_GET
            path   = if _calendar_id
                       "_ml/calendars/#{ElasticsearchV7::API::Utils.__listify(_calendar_id)}"
                     else
                       "_ml/calendars"
  end
            params = ElasticsearchV7::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = arguments[:body]
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:get_calendars, [
            :from,
            :size
          ].freeze)
      end
    end
    end
  end
end
