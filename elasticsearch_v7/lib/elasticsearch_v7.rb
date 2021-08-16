# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "elasticsearch_v7/version"

require 'elasticsearch_v7/transport'
require 'elasticsearch_v7/api'

module ElasticsearchV7
  module Transport
    class Client
      byebug
      include ElasticsearchV7::API
    end
  end
end
