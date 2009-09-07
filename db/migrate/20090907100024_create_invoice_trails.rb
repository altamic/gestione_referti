class CreateInvoiceTrails < ActiveRecord::Migration
  def self.up
    create_table :invoice_trails do |t|
      t.date :admission_date
      t.string :external_code
      t.string :last_name
      t.string :first_name
      t.decimal :gross_amount, :precision => 3, :scale => 2, :default => 0.0
      t.decimal :payed_amount, :precision => 3, :scale => 2, :default => 0.0
      t.decimal :discount,     :precision => 3, :scale => 2, :default => 0.0
      t.boolean :payed
      t.date :payment_date
      t.integer :invoice_number
      t.text :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :invoice_trails
  end
end
