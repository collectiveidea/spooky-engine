module GhostEngine
  class Post < ApplicationRecord
    # include ActionText::Attachable

    has_many :post_authors, class_name: "GhostEngine::PostAuthor", foreign_key: "ghost_engine_post_id", dependent: :destroy
    has_many :authors, through: :post_authors, as: :author

    has_rich_text :body
  end
end
