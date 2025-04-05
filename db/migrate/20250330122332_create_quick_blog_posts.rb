class CreateGhostEnginePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :ghost_engine_posts do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.datetime :published_at

      t.timestamps
    end
  end
end
