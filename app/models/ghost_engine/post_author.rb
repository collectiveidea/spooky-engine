module GhostEngine
  class PostAuthor < ApplicationRecord
    belongs_to :author, class_name: GhostEngine.author_class.to_s, optional: !GhostEngine.author_required
    belongs_to :post, inverse_of: :post_authors, class_name: "GhostEngine::Post", foreign_key: :ghost_engine_post_id
  end
end
