# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require "elasticsearch_v7/api"
require "elasticsearch/xpack/version"
require "elasticsearch/xpack/api/actions/params_registry"

Dir[ File.expand_path('../xpack/api/actions/**/params_registry.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../xpack/api/actions/**/*.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../xpack/api/namespace/**/*.rb', __FILE__) ].each { |f| require f }

module ElasticsearchV7
  module XPack
    module API
      def self.included(base)
        ElasticsearchV7::XPack::API.constants.reject {|c| c == :Client }.each do |m|
          base.__send__ :include, ElasticsearchV7::XPack::API.const_get(m)
        end
      end

      class Client
        include ElasticsearchV7::API::Common::Client, ElasticsearchV7::API::Common::Client::Base
        include ElasticsearchV7::XPack::API
      end
    end
  end
end

ElasticsearchV7::API::COMMON_PARAMS.push :job_id, :datafeed_id, :filter_id, :snapshot_id, :category_id, :policy_id

module ElasticsearchV7
  module Transport
    class Client
      def xpack
        @xpack_client ||= ElasticsearchV7::XPack::API::Client.new(self)
      end

      def security
        @security ||= xpack.security
      end

      def ml
        @ml ||= xpack.ml
      end

      def rollup
        @rollup ||= xpack.rollup
      end

      def watcher
        @watcher ||= xpack.watcher
      end

      def graph
        @graph ||= xpack.graph
      end

      def migration
        @migration ||= xpack.migration
      end

      def sql
        @sql ||= xpack.sql
      end

      def deprecation
        @deprecation ||= xpack.deprecation
      end

      def data_frame
        @data_frame ||= xpack.data_frame
      end

      def ilm
        @ilm ||= xpack.ilm
      end
    end
  end
end if defined?(ElasticsearchV7::Transport::Client)
