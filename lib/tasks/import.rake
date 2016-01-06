require 'csv'

namespace :db do

  desc "Import the Customer CSV to DB"
  task :customers => :environment do
    counter = 0
    customers_path =
    "#{Rails.root}/lib/assets/customers.csv"
    CSV.foreach(customers_path) do |row|
      id, first_name, last_name, created_at, updated_at = row
      customer = Customer.create(first_name: first_name, last_name: last_name, created_at: created_at, updated_at: updated_at)
      puts "#{first_name} #{last_name} #{customer.errors.full_messages.join(", ")}" if customer.errors.any?
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"
  end
end

namespace :db do
  desc "Import the Merchants CSV to DB"
  task :merchants => :environment do
    counter = 0
    merchants_path =
    "#{Rails.root}/lib/assets/merchants.csv"
    CSV.foreach(merchants_path) do |row|
      id, name, created_at, updated_at = row
      merchant = Merchant.create(name: name, created_at: created_at, updated_at: updated_at)
      puts "Merchant #{name} #{merchant.errors.full_messages.join(", ")}" if merchant.errors.any?
      counter += 1 if merchant.persisted?
    end

    puts "Imported #{counter} merchants"
  end
end

namespace :db do
  desc "Import the items CSV to DB"
  task :items => :environment do
    counter = 0
    items_path =
    "#{Rails.root}/lib/assets/items.csv"
    CSV.foreach(items_path) do |row|
      id, name, description, unit_price, merchant_id, created_at, updated_at = row
      item = Item.create(name: name, description: description, unit_price: unit_price, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
      puts "Item #{name} #{item.errors.full_messages.join(", ")}" if item.errors.any?
      counter += 1 if item.persisted?
    end

    puts "Imported #{counter} items"
  end
end

namespace :db do
  desc "Import the invoices CSV to DB"
  task :invoices => :environment do
    counter = 0
    invoices_path =
    "#{Rails.root}/lib/assets/invoices.csv"
    CSV.foreach(invoices_path) do |row|
      id, customer_id, merchant_id, status, created_at, updated_at = row
      invoice = Invoice.create(customer_id: customer_id, merchant_id: merchant_id, status: status, created_at: created_at, updated_at: updated_at)
      puts "Invoice for merchant id #{merchant_id} for customer id #{customer_id} #{invoice.errors.full_messages.join(", ")}" if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end

    puts "Imported #{counter} invoices"
  end
end

namespace :db do
  desc "Import the transactions CSV to DB"
  task :transactions => :environment do
    counter = 0
    transactions_path =
    "#{Rails.root}/lib/assets/transactions.csv"
    CSV.foreach(transactions_path) do |row|
      id, invoice_id, credit_card_number, unused, result, created_at, updated_at = row
      transaction = Transaction.create(invoice_id: invoice_id, credit_card_number: credit_card_number, result: result, created_at: created_at, updated_at: updated_at)
      puts "Transaction invoice id #{invoice_id}  #{transaction.errors.full_messages.join(", ")}" if transaction.errors.any?
      counter += 1 if transaction.persisted?
    end

    puts "Imported #{counter} transactions"
  end
end

namespace :db do
  desc "Import the invoice_items CSV to DB"
  task :invoice_items => :environment do
    counter = 0
    invoice_items_path =
    "#{Rails.root}/lib/assets/invoice_items.csv"
    CSV.foreach(invoice_items_path) do |row|
      id, item_id, invoice_id, quantity, unit_price, created_at, updated_at = row
      invoice_item = InvoiceItem.create(item_id: item_id, invoice_id: invoice_id, quantity: quantity, unit_price: unit_price, created_at: created_at, updated_at: updated_at)
      puts "Invoice Item for invoice id #{invoice_id}  #{invoice_item.errors.full_messages.join(", ")}" if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
    end

    puts "Imported #{counter} invoice_items"
  end
end
