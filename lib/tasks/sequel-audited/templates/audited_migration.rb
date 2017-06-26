Sequel.migration do
  # created by sequel-audited gem

  up do
    create_table(:audit_logs) do
      primary_key :id
      String    :model_type
      Integer   :model_pk
      String    :model_ref
      String    :event
      String    :changed,     text: true
      Integer   :version,     default: 0
      Integer   :user_id
      String    :username
      String    :user_type,   default: 'User'
      DateTime  :created_at
    end
  end

  down do
    drop_table :audit_logs
  end
end
