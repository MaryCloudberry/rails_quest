class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :codename, null: false
      t.integer :level, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :agents, :codename, unique: true
    add_check_constraint :agents, "level >= 1 AND level <= 10", name: "check_agent_level_range"
  end
end
