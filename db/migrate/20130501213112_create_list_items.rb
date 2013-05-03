class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :title
      t.boolean :done

      t.timestamps
    end
  end
end
