class CreateProjectActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :project_activities do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :activity_type, default: 0, index: true
      t.references :user, null: false, foreign_key: true
      t.string :old
      t.string :new
      t.timestamps
    end
  end
end
