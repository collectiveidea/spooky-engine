require "quick_blog/version"
require "quick_blog/engine"

module QuickBlog
  # Your code goes here...
  def self.author_class
    "User"
  end

  def self.author_required
    true
  end
end
