Sequel.migration do
  # created by sequel-audited gem

  change do
    create_table(:audit_logs) do
      primary_key :id
      String    :associated_type
      Integer   :associated_id
      String    :event
      String    :changed,     text: true
      Integer   :version,     default: 0
      Integer   :modifier_id
      String    :modifier_type,   default: 'User'
      DateTime  :created_at

      index [:associated_type, :associated_id]
      index [:modifier_type, :modifier_id]
    end
  end
end
