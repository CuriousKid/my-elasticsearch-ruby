# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "elasticsearch/transport/transport/loggable"
require "elasticsearch/transport/transport/serializer/multi_json"
require "elasticsearch/transport/transport/sniffer"
require "elasticsearch/transport/transport/response"
require "elasticsearch/transport/transport/errors"
require "elasticsearch/transport/transport/base"
require "elasticsearch/transport/transport/connections/selector"
require "elasticsearch/transport/transport/connections/connection"
require "elasticsearch/transport/transport/connections/collection"
require "elasticsearch/transport/transport/http/faraday"
require "elasticsearch/transport/client"
require "elasticsearch/transport/redacted"

require "elasticsearch/transport/version"

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
