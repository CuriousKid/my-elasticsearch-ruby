# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackLicensePostTest < Minitest::Test

      context "License: Post" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'PUT', method
            assert_equal '_license', url
            assert_equal Hash.new, params
            assert_equal [], body
            true
          end.returns(FakeResponse.new)

          subject.xpack.license.post body: []
        end

      end

    end
  end
end
