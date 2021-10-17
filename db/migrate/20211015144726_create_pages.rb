class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title_es
      t.string :title_en
      t.string :title_fr
      t.text :description_es
      t.text :description_en
      t.text :description_fr
      t.decimal :display, :default => 1

      t.timestamps
    end
  end
end
