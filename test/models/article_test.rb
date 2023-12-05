require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
  end

  test "#draft? responds correctly based on published_at" do
    refute @article.draft?

    @article.published_at = nil

    assert @article.draft?
  end

  test "#has_canonical_url? responds correctly based on canoncial_url" do
    refute @article.has_canonical_url?

    @article.canonical_url = "foo"

    assert @article.has_canonical_url?
  end



  test "#published? is true if published in past" do
    @article.published_at = Date.yesterday

    assert @article.published?
    refute @article.scheduled?
  end

  test "#scheduled? is true if published in future" do
    @article.published_at = Date.tomorrow

    assert @article.scheduled?
    refute @article.published?
  end
end
