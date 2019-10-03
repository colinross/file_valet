class CreatePayloads < ActiveRecord::Migration[5.2]
  def change
    create_table :payloads do |t|
      t.string :uuid
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end
