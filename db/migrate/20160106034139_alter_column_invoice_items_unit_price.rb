class AlterColumnInvoiceItemsUnitPrice < ActiveRecord::Migration
  def self.up
    change_table :invoice_items do |t|
      t.change :unit_price, :decimal, :precision => 10, :scale => 2
    end
  end
  def self.down
    change_table :invoice_items do |t|
      t.change :unit_price, :integer
    end
  end
end
