class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|

      t.timestamps
    end
  end
end
