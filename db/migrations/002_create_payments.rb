# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:payments) do
      column :id, String, primary_key: true, size: 36

      foreign_key :ticket_id, :tickets, type: String
      column :payed_at, DateTime, null: false
      column :method, String, null: false
    end
  end

  down do
    drop_table(:payments)
  end
end
