class CreateMessage < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :comment

      t.timestamps
    end
  end
end
