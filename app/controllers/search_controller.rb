class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
    # binding.pry
    # binding.pry
    # redirect_to :search
    # redirect_toとかいらない！ application.html.erb部分でsearch.index.erbに飛ぶようになっている
  end



  private

    # どのモデルを検索するか
    def match(model, content)
      if model == "user"
        User.where(name: content)
      elsif model == "book"
        Book.where(title: content)
      end
    end

    # 前方一致
    def forward(model, content)
      if model == "user"
        User.where("name LIKE ?", "#{content}%")
      elsif model == "book"
        Book.where("title LIKE ?", "#{content}%")
      end
    end

    # 後方一致
    def backward(model, content)
      if model == "user"
        User.where("name LIKE ?", "%#{content}")
      elsif model == "book"
        Book.where("title LIKE ?", "%#{content}")
      end
    end

    # 完全一致
    def partical(model, content)
      if model == "user"
        User.Where("name LIKE ?", "%#{content}%")
      elsif model == "book"
        Book.where("title LIKE ?", "%#{content}%")
      end
    end

    
    def search_for(how, model, content)
      case how
      when "match"
        match(model, content)
      when "forward"
        forward(model, content)
      when "backward"
        backward(model, content)
      when "partical"
        partical(model, content)
      end
    end
  end




