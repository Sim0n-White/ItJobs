class CreateSkillLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_levels do |t|
      t.string :skill_level_name

      t.timestamps
    end
  end
end
