module HomeHelper
  def sort_desc some_hash
    some_hash.keys.sort.reverse.each do |key|
      yield key, some_hash[key]
    end
  end

  alias :stream_years_by :sort_desc
  alias :stream_months_by :sort_desc
  alias :stream_days_by :sort_desc
end
