# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackMlStartDatafeedTest < Minitest::Test

      context "XPack MachineLearning: Start datafeed" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'POST', method
            assert_equal "_ml/datafeeds/foo/_start", url
            assert_equal Hash.new, params
            assert_equal nil, body
            true
          end.returns(FakeResponse.new)

          subject.xpack.ml.start_datafeed :datafeed_id => 'foo'
        end

      end

    end
  end
end
