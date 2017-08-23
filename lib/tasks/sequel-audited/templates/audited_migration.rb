Sequel.migration do
  # created by sequel-audited gem

  change do
    create_table(:audit_logs) do
      primary_key :id
      String    :associated_type
      Integer   :associated_id
      String    :event
      String    :changed,     text: true
      Integer   :version
      Integer   :modifier_id
      String    :modifier_type
      DateTime  :created_at
    end
  end
end
