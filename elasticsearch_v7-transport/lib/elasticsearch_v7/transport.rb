# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "elasticsearch_v7/transport/transport/loggable"
require "elasticsearch_v7/transport/transport/serializer/multi_json"
require "elasticsearch_v7/transport/transport/sniffer"
require "elasticsearch_v7/transport/transport/response"
require "elasticsearch_v7/transport/transport/errors"
require "elasticsearch_v7/transport/transport/base"
require "elasticsearch_v7/transport/transport/connections/selector"
require "elasticsearch_v7/transport/transport/connections/connection"
require "elasticsearch_v7/transport/transport/connections/collection"
require "elasticsearch_v7/transport/transport/http/faraday"
require "elasticsearch_v7/transport/client"
require "elasticsearch_v7/transport/redacted"

require "elasticsearch_v7/transport/version"

module ElasticsearchV7
  module Client

    # A convenience wrapper for {::ElasticsearchV7::Transport::Client#initialize}.
    #
    def new(arguments={}, &block)
      ElasticsearchV7::Transport::Client.new(arguments, &block)
    end
    extend self
  end
end
