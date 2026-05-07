class CreateAgentSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_skills do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end

    add_index :agent_skills, [ :agent_id, :skill_id ], unique: true,
              name: "index_agent_skills_on_agent_id_and_skill_id"
  end
end
