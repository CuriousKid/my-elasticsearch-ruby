# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

class ElasticsearchV7::Transport::ClientIntegrationTest < ElasticsearchV7::Test::IntegrationTestCase
  startup do
    ElasticsearchV7::Extensions::Test::Cluster.start(number_of_nodes: 2) if ENV['SERVER'] and not ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 2)
  end

  shutdown do
    ElasticsearchV7::Extensions::Test::Cluster.stop(number_of_nodes: 2) if ENV['SERVER'] and ElasticsearchV7::Extensions::Test::Cluster.running?(number_of_nodes: 2)
  end

  context "Transport" do
    setup do
      @host, @port = ELASTICSEARCH_HOSTS.first.split(':')
      begin; Object.send(:remove_const, :Patron);   rescue NameError; end
    end

    should "allow to customize the Faraday adapter" do
      require 'typhoeus'
      require 'typhoeus/adapters/faraday'

      transport = ElasticsearchV7::Transport::Transport::HTTP::Faraday.new \
        :hosts => [ { host: @host, port: @port } ] do |f|
          f.response :logger
          f.adapter  :typhoeus
        end

      client = ElasticsearchV7::Transport::Client.new transport: transport
      client.perform_request 'GET', ''
    end

    should "allow to define connection parameters and pass them" do
      transport = ElasticsearchV7::Transport::Transport::HTTP::Faraday.new \
                    :hosts => [ { host: @host, port: @port } ],
                    :options => { :transport_options => {
                                    :params => { :format => 'yaml' }
                                  }
                                }

      client = ElasticsearchV7::Transport::Client.new transport: transport
      response = client.perform_request 'GET', ''

      assert response.body.start_with?("---\n"), "Response body should be YAML: #{response.body.inspect}"
    end

    should "use the Curb client" do
      require 'curb'
      require 'elasticsearch_v7/transport/transport/http/curb'

      transport = ElasticsearchV7::Transport::Transport::HTTP::Curb.new \
        :hosts => [ { host: @host, port: @port } ] do |curl|
          curl.verbose = true
        end

      client = ElasticsearchV7::Transport::Client.new transport: transport
      client.perform_request 'GET', ''
    end unless JRUBY

    should "deserialize JSON responses in the Curb client" do
      require 'curb'
      require 'elasticsearch_v7/transport/transport/http/curb'

      transport = ElasticsearchV7::Transport::Transport::HTTP::Curb.new \
        :hosts => [ { host: @host, port: @port } ] do |curl|
          curl.verbose = true
        end

      client = ElasticsearchV7::Transport::Client.new transport: transport
      response = client.perform_request 'GET', ''

      assert_respond_to(response.body, :to_hash)
      assert_not_nil response.body['name']
      assert_equal 'application/json', response.headers['content-type']
    end unless JRUBY
  end

end
