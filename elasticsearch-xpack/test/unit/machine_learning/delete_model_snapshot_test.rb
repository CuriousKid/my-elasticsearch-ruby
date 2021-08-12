# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'test_helper'

module ElasticsearchV7
  module Test
    class XPackMlDeleteModelSnapshotTest < Minitest::Test

      context "XPack MachineLearning: Delete model snapshot" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'DELETE', method
            assert_equal "_ml/anomaly_detectors/foo/model_snapshots/bar", url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.ml.delete_model_snapshot :job_id => 'foo', :snapshot_id => 'bar'
        end

      end

    end
  end
end
