# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:tickets) do
      column :id, String, primary_key: true, size: 16
      column :created_at, DateTime, null: false
      column :checkout_at, DateTime, null: true
    end
  end

  down do
    drop_table(:tickets)
  end
end
