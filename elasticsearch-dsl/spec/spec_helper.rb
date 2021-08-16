# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'elasticsearch_v7'
require 'elasticsearch-dsl'

RSpec.configure do |config|
  config.formatter = 'documentation'
  config.color = true
end
