class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string    :name
      t.string    :address
      t.integer :rating
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end