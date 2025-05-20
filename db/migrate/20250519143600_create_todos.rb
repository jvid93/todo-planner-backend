class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description
      t.date :due_date
      t.string :priority, default: 'Medium'
      t.boolean :completed, default: false
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
