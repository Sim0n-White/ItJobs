class CreateEnglishSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :english_skills do |t|
      t.string :english_skill_name

      t.timestamps
    end
  end
end
