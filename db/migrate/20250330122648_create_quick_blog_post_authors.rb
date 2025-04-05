class CreateGhostEnginePostAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :ghost_engine_post_authors do |t|
      t.references :author, null: true
      t.references :ghost_engine_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
