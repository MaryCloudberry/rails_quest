class AddUniqueIndexToAgentSkills < ActiveRecord::Migration[7.0]
  def change
    execute("DELETE FROM agent_skills WHERE id NOT IN (
      SELECT MIN(id) FROM agent_skills GROUP BY agent_id, skill_id
    )")

    add_index :agent_skills, [:agent_id, :skill_id], unique: true,
              name: "index_agent_skills_on_agent_id_and_skill_id"
  end
end
