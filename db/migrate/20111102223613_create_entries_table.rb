class CreateEntriesTable < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.string :title,  null: false
      t.string :url,    null: false
      t.string :source, null: false
      t.datetime :date, null: false
    end
  end

  def down
    drop_table :entries
  end
end
