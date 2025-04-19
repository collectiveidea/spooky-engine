# frozen_string_literal: true

config = Rails.application.config.spooky_engine

xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom", "xml:lang" => "en-us" do
  xml.title config.title
  xml.subtitle config.subtitle if config.subtitle
  xml.icon image_url(config.icon) if config.icon
  xml.logo image_url(config.logo) if config.logo
  xml.rights config.rights if config.rights
  xml.generator "SpookyEngine #{SpookyEngine::VERSION}", uri: ""
  xml.link href: root_url, rel: "alternate"
  xml.link href: atom_url, type: "application/atom+xml", rel: "self"

  xml.id atom_url
  xml.updated @posts.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")

  @posts.each do |post|
    xml.entry do
      xml.id post_url(post.slug)
      xml.title post.title
      xml.link href: post_url(post.slug), type: "text/html", rel: "alternate"
      xml.published post.published_at.strftime("%Y-%m-%dT%H:%M:%SZ")
      xml.updated post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")
      post.authors.each do |author|
        xml.author do
          xml.name author
          xml.uri  author_url(author)
        end
      end

      post.tags.each do |tag|
        xml.category term: tag.name, scheme: tag_url(tag)
      end

      xml.summary(type: "text", "xml:lang": "en") do
        xml.cdata!(post.excerpt.to_s)
      end

      # TODO make lang configurable or remove?
      # Could get from settings endpoint
      xml.content(type: "html", "xml:lang": "en") do
        xml.cdata!(post.html.to_s)
      end
    end
  end
end
