class RenameTypeToFlowtype < ActiveRecord::Migration[6.0]
  def change
    rename_column :cashflows, :type, :flowtype
  end
end
