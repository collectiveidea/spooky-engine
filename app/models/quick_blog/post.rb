module QuickBlog
  class Post < ApplicationRecord
    has_many :post_authors, class_name: "QuickBlog::PostAuthor", foreign_key: "quick_blog_post_id", dependent: :destroy
    has_many :authors, through: :post_authors, as: :author

    has_rich_text :body
  end
end
