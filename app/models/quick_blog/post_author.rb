module QuickBlog
  class PostAuthor < ApplicationRecord
    belongs_to :author, class_name: QuickBlog.author_class.to_s, optional: !QuickBlog.author_required
    belongs_to :post, inverse_of: :post_authors, class_name: "QuickBlog::Post", foreign_key: :quick_blog_post_id
  end
end
