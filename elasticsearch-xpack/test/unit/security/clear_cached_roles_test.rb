# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackSecurityClearCachedRolesTest < Minitest::Test

      context "XPack Security: Clear cached roles" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'POST', method
            assert_equal '_security/role/foo/_clear_cache', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.clear_cached_roles :name => 'foo'
        end

      end

    end
  end
end
