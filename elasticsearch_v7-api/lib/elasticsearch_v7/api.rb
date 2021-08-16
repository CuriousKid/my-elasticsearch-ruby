# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "cgi"
require "multi_json"

require "elasticsearch_v7/api/version"
require "elasticsearch_v7/api/namespace/common"
require "elasticsearch_v7/api/utils"
require "elasticsearch_v7/api/actions/params_registry"

Dir[ File.expand_path('../api/actions/**/params_registry.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../api/actions/**/*.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../api/namespace/**/*.rb', __FILE__) ].each { |f| require f }

module ElasticsearchV7
  module API
    DEFAULT_SERIALIZER = MultiJson

    COMMON_PARAMS = [
      :ignore,                        # Client specific parameters
      :index, :type, :id,             # :index/:type/:id
      :body,                          # Request body
      :node_id,                       # Cluster
      :name,                          # Alias, template, settings, warmer, ...
      :field                          # Get field mapping
    ]

    COMMON_QUERY_PARAMS = [
      :ignore,                        # Client specific parameters
      :format,                        # Search, Cat, ...
      :pretty,                        # Pretty-print the response
      :human,                         # Return numeric values in human readable format
      :filter_path                    # Filter the JSON response
    ]

    HTTP_GET          = 'GET'.freeze
    HTTP_HEAD         = 'HEAD'.freeze
    HTTP_POST         = 'POST'.freeze
    HTTP_PUT          = 'PUT'.freeze
    HTTP_DELETE       = 'DELETE'.freeze
    UNDERSCORE_SEARCH = '_search'.freeze
    UNDERSCORE_ALL    = '_all'.freeze
    DEFAULT_DOC       = '_doc'.freeze

    # Auto-include all namespaces in the receiver
    #
    def self.included(base)
      base.send :include,
                ElasticsearchV7::API::Common,
                ElasticsearchV7::API::Actions,
                ElasticsearchV7::API::Cluster,
                ElasticsearchV7::API::Nodes,
                ElasticsearchV7::API::Indices,
                ElasticsearchV7::API::Ingest,
                ElasticsearchV7::API::Snapshot,
                ElasticsearchV7::API::Tasks,
                ElasticsearchV7::API::Cat,
                ElasticsearchV7::API::Remote
    end

    # The serializer class
    #
    def self.serializer
      settings[:serializer] || DEFAULT_SERIALIZER
    end

    # Access the module settings
    #
    def self.settings
      @settings ||= {}
    end
  end
end
