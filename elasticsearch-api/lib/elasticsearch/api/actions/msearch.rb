# Licensed to ElasticsearchV7 B.V under one or more agreements.
# ElasticsearchV7 B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module ElasticsearchV7
  module API
    module Actions
      # Allows to execute several search operations in one request.
      #
      # @option arguments [List] :index A comma-separated list of index names to use as default
      # @option arguments [List] :type A comma-separated list of document types to use as default
      # @option arguments [String] :search_type Search operation type
      #   (options: query_then_fetch,query_and_fetch,dfs_query_then_fetch,dfs_query_and_fetch)

      # @option arguments [Number] :max_concurrent_searches Controls the maximum number of concurrent searches the multi search api will execute
      # @option arguments [Boolean] :typed_keys Specify whether aggregation and suggester names should be prefixed by their respective types in the response
      # @option arguments [Number] :pre_filter_shard_size A threshold that enforces a pre-filter roundtrip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter roundtrip can limit the number of shards significantly if for instance a shard can not match any documents based on it's rewrite method ie. if date filters are mandatory to match but the shard bounds and the query are disjoint.
      # @option arguments [Number] :max_concurrent_shard_requests The number of concurrent shard requests each sub search executes concurrently per node. This value should be used to limit the impact of the search on the cluster in order to limit the number of concurrent shard requests
      # @option arguments [Boolean] :rest_total_hits_as_int Indicates whether hits.total should be rendered as an integer or an object in the rest search response
      # @option arguments [Boolean] :ccs_minimize_roundtrips Indicates whether network round-trips should be minimized as part of cross-cluster search requests execution

      # @option arguments [Hash] :body The request definitions (metadata-search request definition pairs), separated by newlines (*Required*)
      #
      # *Deprecation notice*:
      # Specifying types in urls has been deprecated
      # Deprecated since version 7.0.0
      #
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.5/search-multi-search.html
      #
      def msearch(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone

        _index = arguments.delete(:index)

        _type = arguments.delete(:type)

        method = ElasticsearchV7::API::HTTP_GET
        path   = if _index && _type
                   "#{Utils.__listify(_index)}/#{Utils.__listify(_type)}/_msearch"
                 elsif _index
                   "#{Utils.__listify(_index)}/_msearch"
                 else
                   "_msearch"
  end
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

        body = arguments[:body]
        case
        when body.is_a?(Array) && body.any? { |d| d.has_key? :search }
          payload = body
                    .inject([]) do |sum, item|
                      meta = item
                      data = meta.delete(:search)

                      sum << meta
                      sum << data
                      sum
                    end
                    .map { |item| ElasticsearchV7::API.serializer.dump(item) }
          payload << "" unless payload.empty?
          payload = payload.join("
")
        when body.is_a?(Array)
          payload = body.map { |d| d.is_a?(String) ? d : ElasticsearchV7::API.serializer.dump(d) }
          payload << "" unless payload.empty?
          payload = payload.join("
")
        else
          payload = body
      end

        perform_request(method, path, params, payload, { "Content-Type" => "application/x-ndjson" }).body
      end

      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:msearch, [
        :search_type,
        :max_concurrent_searches,
        :typed_keys,
        :pre_filter_shard_size,
        :max_concurrent_shard_requests,
        :rest_total_hits_as_int,
        :ccs_minimize_roundtrips
      ].freeze)
    end
    end
end
