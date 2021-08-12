# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "elasticsearch/version"

require 'elasticsearch/transport'
require 'elasticsearch/api'

module ElasticsearchV7
  module Transport
    class Client
      byebug
      include ElasticsearchV7::API
    end
  end
end
