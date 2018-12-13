class AddSubTitleToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sub_title, :string
  end
end
