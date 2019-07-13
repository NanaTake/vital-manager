class CreateVitals < ActiveRecord::Migration[5.0]
  def change
    create_table :vitals do |t|
      t.date     :record_date, null: false
      t.float    :weight
      t.integer  :blood_pressure
      t.integer  :pulse
      t.string   :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
