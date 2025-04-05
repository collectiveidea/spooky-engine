# frozen_string_literal: true

xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom", "xml:lang" => "en-us" do
  xml.title "FIXME: BLOG TITLE"
  xml.link href: root_url, rel: "alternate"
  xml.link href: atom_url, type: "application/atom+xml", rel: "self"

  xml.id atom_url
  xml.updated @posts.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")

  @posts.each do |post|
    xml.entry do
      xml.title     post.title
      xml.link      href: post_url(post.slug), type: "text/html", rel: "alternate"
      xml.published post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
      xml.updated   post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")
      xml.id        post_url(post)
      post.authors.each do |author|
        xml.author do
          xml.name author
          # xml.uri  author_url(author)
          xml.email author.email if author.respond_to?(:email) && author.email.present?
        end
      end

      # post.categories.each do |category|
      #   xml.category term: category.name, scheme: category_url(category)
      # end

      # xml.summary(type: "html", "xml:lang": "en") do
      #   xml.cdata!(post.body.to_s.truncate(200))
      # end

      xml.content(type: "html", "xml:lang": "en") do
        xml.cdata!(post.html.to_s)
      end
    end
  end
end
