class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :category
      t.string :votes
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
