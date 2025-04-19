module SpookyEngine
  module ApplicationHelper
    # Borrowed from rails_admin to get around an annoying issue with
    # ActiveStorage::VariantWithRecord and ActionText
    # https://github.com/railsadminteam/rails_admin/commit/458d0fb56d79d4fa0a252ad1ca715fd0a3b4b900#diff-4b358674818ce5d724b976cafd4ff97aab8c42bf52a62daf571c395fc994e40f
    # Workaround for https://github.com/rails/rails/issues/31325
    def image_tag(source, options = {})
      if %w[ActiveStorage::Variant ActiveStorage::VariantWithRecord ActiveStorage::Preview].include? source.class.to_s
        super(main_app.route_for(ActiveStorage.resolve_model_to_route, source), options)
      else
        super
      end
    end
  end
end
