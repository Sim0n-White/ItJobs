module Search
  class Finder
    attr_reader :collection

    def initialize(params, session)
      @params = params
      @session = session
      @params[:filter] = {} unless @params[:filter].present?
    end

    def self.find(params, session)
      new(params, session).find
    end

    def find
      @params[:reset_filter] ? reset_filter : fill_filter
      collection_by_filter
      self
    end

    def filter
      @params[:filter]
    end

    def count
      @collection.size
    end

    def total_entries
      if @collection.respond_to? :total_entries
        @collection.total_entries
      else
        @collection.count
      end
    end

    def each(&block)
      @collection.each(&block)
    end

    def each_with_index(&block)
      @collection.each_with_index(&block)
    end

    def [](field)
      filter[field.to_s]
    end

    protected

    # Convention: prefix is equal pluralized class name without ending Finder by default (Search::InvoiceFinder -> 'invoices_filter')

    def filter_session_prefix
      @prefix ||= "#{self.class.name.demodulize.gsub('Finder', '').downcase.pluralize}_filter"
    end

    def collection_by_filter
      @collection = []
    end

    def filter_fields
      []
    end

    def reset_filter
      @params[:filter] = {}
      filter_fields.each { |field| @session["#{filter_session_prefix}_#{field}"] = nil }
    end

    def fill_filter
      filter_fields.each do |field|
        @params[:filter][field] ||= @session["#{filter_session_prefix}_#{field}"]
        @session["#{filter_session_prefix}_#{field}"] = @params[:filter][field]
      end
    end

  end
end
