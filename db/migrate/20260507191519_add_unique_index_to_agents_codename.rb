class AddUniqueIndexToAgentsCodename < ActiveRecord::Migration[7.0]
  def change
    execute("DELETE FROM agents WHERE id NOT IN (SELECT MIN(id) FROM agents GROUP BY codename)")

    add_index :agents, :codename, unique: true
  end
end
