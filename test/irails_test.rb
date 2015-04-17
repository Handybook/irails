require 'test_helper'

class IRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, IRails
  end

  test 'plain, no helpers or variables' do
    out = IRails.render 'welcome/about'
    expect(out.to_s).to eq "<p>French Cooking Blog.</p>"
  end

  test 'with URL helpers' do
    out = IRails.render 'welcome/index'
    expect(out.to_s).to eq "<h1>Welcome#index</h1>\n\n<a href=\"/articles\">My Blog</a>"
  end

  test 'with a model' do
    article = double("article")
    allow(article).to receive(:title).and_return("The RSpec Book")
    allow(article).to receive(:text).and_return("The RSpec Text")
    out = IRails.render "articles/show", locals: {:@article => article}
    expect(out.to_s).to eq "<p>\n  <strong>Title:</strong>\n  The RSpec Book\n</p>\n \n<p>\n  <strong>Text:</strong>\n  The RSpec Text\n</p>\n\n<a href=\"/articles\">Back</a>"
  end
end
