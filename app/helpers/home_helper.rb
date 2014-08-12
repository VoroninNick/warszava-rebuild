module HomeHelper
  def welcome_block_title
    HtmlBlock.find(4).content
  end

  def welcome_block_p1
    HtmlBlock.find(5).content
  end
end
