class AddUniqueIndexToSkillsName < ActiveRecord::Migration[7.0]
  def change
    execute("DELETE FROM skills WHERE id NOT IN (SELECT MIN(id) FROM skills GROUP BY name)")

    add_index :skills, :name, unique: true
  end
end
