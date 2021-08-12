# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackSecurityAuthenticateTest < Minitest::Test

      context "XPack Security: Authenticate" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_security/_authenticate', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.authenticate
        end

      end

    end
  end
end
