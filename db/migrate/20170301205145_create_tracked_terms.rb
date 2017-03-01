class CreateTrackedTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :tracked_terms do |t|
      t.string :term
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
