# -*- encoding : utf-8 -*-
module ActsAsCached

  module Mixin
    def acts_as_cached(options = {})
      extend  ClassMethods
      include InstanceMethods
      @cache_options = options
      @cache_options[:expires_in] ||= 1.week
      @cache_options[:version] ||= 0
      relation.class.send :include, ActsAsCached::ActiveRecord::FinderMethods
    end
  end

  module ClassMethods
    @@nil_sentinel = :_nil
    attr_reader :cache_options

    def get_cache(cache_id)
      if (item = fetch_cache(cache_id)).nil?
        if block_given?
          set_cache(cache_id,  yield)
        else
          fetch_cachable_data(cache_id)
        end
      else
        @@nil_sentinel == item ? nil : item
      end
    end

    def fetch_cache(cache_id)
      Rails.cache.read(cache_key(cache_id))
    end

    def fetch_cachable_data(cache_id)
      send(:find, cache_id)
    end

    def caches(method)
      get_cache(method) { send(method) }
    end
    alias :cached :caches

    def set_cache(cache_id, value, options = {})
      options[:expires_in] ||= cache_options[:expires_in]
      v = value.nil? ? @@nil_sentinel : value
      Rails.cache.write(cache_key(cache_id), v, options)
      value
    end

    def expire_cache(cache_id = nil)
      Rails.cache.delete(cache_key(cache_id))
      true
    end

    def reset_cache(cache_id = nil)
      fetch_cachable_data(cache_id)
    end

    def cached?(cache_id = nil)
      Rails.cache.exist?(cache_key(cache_id))
    end
    alias :is_cached? :cached?

    def cache_name
      @cache_name ||= respond_to?(:model_name) ? model_name.cache_key : name
    end

    def cache_key(cache_id)
      [cache_name, cache_options[:version], cache_id].compact.join('/').gsub(' ', '_')[0..(250-1)]
    end
  end

  module InstanceMethods
    def self.included(base)
      base.send :delegate, :cache_config,  :to => 'self.class'
      base.class_eval do
        after_commit :expire_cache, :on => :destroy
        after_commit :reset_cache, :on => :update
        after_commit :set_cache, :on => :create
      end
    end

    def get_cache(key = nil)
      self.class.get_cache(cache_id(key))
    end

    def set_cache(options = {})
      self.class.set_cache(cache_id, self, options)
    end

    def expire_cache(key = nil)
      self.class.expire_cache(cache_id(key))
      self
    end

    def reset_cache(key = nil)
      self.class.reset_cache(cache_id(key))
    end

    def cached?(key = nil)
      self.class.cached? cache_id(key)
    end

    def cache_id(key = nil)
      cid = case
            when new_record?
              "new"
            else
              id.to_s
            end
      key.nil? ? cid : "#{cid}/#{key}"
    end

    def caches(method)
      self.class.get_cache(cache_id(method)) { send(method) }
    end
    alias :cached :caches
  end

  # find のキャッシュ化
  # SecondLevelCache から一部コード拝借
  module ActiveRecord
    module FinderMethods
      extend ActiveSupport::Concern

      included do
        class_eval do
          alias_method_chain :find_one, :act_as_cache
        end
      end

      def find_one_with_act_as_cache(id)
        return find_one_without_act_as_cache(id) unless select_all_column?
#        id = id.id if ActiveRecord::Base === id

        if cachable?
          if record = @klass.fetch_cache(id)
            return record
          else
            record = find_one_without_act_as_cache(id)
            @klass.set_cache(id, record)
            return record
          end
        end
 
        return find_one_without_act_as_cache(id)
      end

      private

      def cachable?
        where_values.blank? &&
          limit_one? && order_values.blank? &&
          includes_values.blank? && preload_values.blank? &&
          readonly_value.nil? && joins_values.blank? && !@klass.locking_enabled?
      end

      def limit_one?
        limit_value.blank? || limit_value == 1
      end

      def select_all_column?
        select_values.blank?
      end
    end
  end
end
