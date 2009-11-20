class CreateInvoiceTrails < ActiveRecord::Migration
  def self.up
    create_table :invoice_trails do |t|
      t.date :admission_date
      t.string :admission_code
      t.string :full_name
      t.decimal :gross_amount     , :precision => 5, :scale => 2, :default => 40.0
      t.decimal :discounted_amount, :precision => 5, :scale => 2, :default => 0.0
      t.decimal :discount         , :precision => 5, :scale => 2, :default => 0.0
      t.boolean :payed, :default => false
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
