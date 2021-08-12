# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackSecurityInvalidateTokenTest < Minitest::Test

      context "XPack Security: Invalidate token" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'DELETE', method
            assert_equal "_security/oauth2/token", url
            assert_equal Hash.new, params
            assert_equal Hash.new, body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.invalidate_token :body => {}
        end

      end

    end
  end
end
