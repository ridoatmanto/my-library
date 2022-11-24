class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :pages
      t.text :plot
      t.string :copyright
      t.text :description
      t.string :language
      t.datetime :release_date
      t.string :cover
      t.text :summary
      t.text :classes

      t.timestamps
    end
  end
end
