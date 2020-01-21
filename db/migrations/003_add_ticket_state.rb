# frozen_string_literal: true

Sequel.migration do
  up do
    alter_table(:tickets) do
      drop_column :checkout_at
      add_column :state, String, null: false
      add_column :updated_at, DateTime, null: false
    end
  end

  down do
    alter_table(:tickets) do
      drop_column :updated_at
      drop_column :state
      add_column :checkout_at, DateTime, null: true
    end

    drop_table(:payments)
  end
end
