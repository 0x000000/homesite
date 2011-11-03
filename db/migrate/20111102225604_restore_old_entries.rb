# coding: utf-8
class RestoreOldEntries < ActiveRecord::Migration
  def up

    Entry.habrapost :url => 'http://habrahabr.ru/blogs/ebooks/111536/',
      :title => 'Краткая заметка по некоторым дополнительным возможностям Kindle третьего поколения',
      :date => DateTime.new(2011, 1, 9)

    Entry.post :name => 'first_record',
      :title => 'Первая блогозапись',
      :date => DateTime.new(2011, 4, 30)

    Entry.event :url => '/about',
      :title => 'Появился раздел /about',
      :date => DateTime.new(2011, 5, 2)

    Entry.post :name => 'lifeline',
      :title => 'Линия жизни',
      :date => DateTime.new(2011, 5, 4)

    Entry.post :name => 'about_datings',
      :title => 'Пару слов о дейтингах',
      :date => DateTime.new(2011, 5, 9)

    Entry.post :name => 'more_about_datings',
      :title => 'Еще пару слов о дейтингах',
      :date => DateTime.new(2011, 5, 16)

    Entry.habrapost :url => 'http://habrahabr.ru/blogs/macosx/130367/',
      :title => 'Добавляем города в виджет World Clock',
      :date => DateTime.new(2011, 10, 14)
  end


  def down
    Entry.destroy_all
  end
end
