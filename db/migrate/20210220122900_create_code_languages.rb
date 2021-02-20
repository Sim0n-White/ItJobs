class CreateCodeLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :code_languages do |t|
      t.string :code_language_name

      t.timestamps
    end
  end
end
