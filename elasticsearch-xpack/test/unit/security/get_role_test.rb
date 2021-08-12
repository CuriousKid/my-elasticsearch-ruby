# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackSecurityGetRoleTest < Minitest::Test

      context "XPack Security: Get role" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_security/role', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.get_role
        end

        should "perform correct request for multiple roles" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_security/role/foo,bar', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.get_role name: ['foo', 'bar']
        end

        should "catch a NotFound exception with the ignore parameter" do
          subject.expects(:perform_request).raises(NotFound)

          assert_nothing_raised do
            subject.xpack.security.get_role name: 'foo', ignore: 404
          end
        end
      end

    end
  end
end
