class Entry < ActiveRecord::Base
  validates_presence_of :title, :url, :source, :date
  validates_uniqueness_of :title, :url

  def self.for_stream
    stream = {}

    Entry.all.each do |entry|
      date = entry.date

      stream[date.year] ||= {}
      stream[date.year][date.month] ||= {}
      stream[date.year][date.month][date.day] ||= []

      stream[date.year][date.month][date.day] << {
        :source => entry.source,
        :url => entry.url,
        :title => entry.title
      }
    end

    stream
  end

  def self.post opts
    Entry.create! :title => opts[:title],
                  :date => opts[:date] || DateTime.now,
                  :url => "/post/#{opts[:name]}",
                  :source => 'post'

    filename = "#{Rails.root}/app/views/post/_#{opts[:name]}.html.haml"

    unless File.exists? filename
      File.open filename, 'w' do |f|
        f.write '%p null'
      end
    end
  end

  def self.habrapost opts
    Entry.create! :title => opts[:title],
                  :date => opts[:date],
                  :url => opts[:url],
                  :source => 'habr'
  end

  def self.event opts
    Entry.create! :title => opts[:title],
                  :date => opts[:date] || DateTime.now,
                  :url => opts[:url],
                  :source => 'event'
  end
end
