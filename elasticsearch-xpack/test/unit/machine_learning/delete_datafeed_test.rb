# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackMlDeleteDatafeedTest < Minitest::Test

      context "XPack MachineLearning: Delete datafeed" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'DELETE', method
            assert_equal "_ml/datafeeds/foo", url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.ml.delete_datafeed :datafeed_id => 'foo'
        end

      end

    end
  end
end
