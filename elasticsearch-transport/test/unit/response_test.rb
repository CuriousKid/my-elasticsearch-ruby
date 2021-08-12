# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

class ElasticsearchV7::Transport::Transport::ResponseTest < Minitest::Test
  context "Response" do

    should "force-encode the body into UTF" do
      body = "Hello Encoding!".encode(Encoding::ISO_8859_1)
      assert_equal 'ISO-8859-1', body.encoding.name

      response = ElasticsearchV7::Transport::Transport::Response.new 200, body
      assert_equal 'UTF-8', response.body.encoding.name
    end unless RUBY_1_8

  end
end