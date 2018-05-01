class ArticlesController < ApplicationController

  def new
    # creates a new record or row to save to the db 
    # <Article id: nil, title: nil, description: nil, created_at: nil, updated_at: nil>
    @article = Article.new
  end
  
  def create
    # Params object
    
    # { 
    #     "utf8"=>"✓", 
    #     "authenticity_token"=>"+EjFAQPVloZ1iHrAaYH0BEE6icMimHWlHKTP1I6bYtiP7715Do1f0X0FSwjquOOAp1AkYydGEUjcjAMjo/hhSw==", 
    #     "article"=> {
    #       "title"=>"A cool title", 
    #       "description"=>"A cooler description"
    #     },
    #     "commit"=>"Create Article", 
    #     "controller"=>"articles", 
    #     "action"=>"create"
    #   }
    @article = Article.new(article_params)
    @article.save

    # the controller doesn't know what to after it saves 
    # so we have to specify that we want it to redirect to a new url to show the data that was just saved
    redirect_to articles_show(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end