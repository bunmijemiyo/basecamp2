class CreateDiscussion < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.text :discuss

      t.timestamps
    end
  end
end
