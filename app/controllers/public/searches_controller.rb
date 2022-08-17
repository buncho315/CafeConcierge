class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
  	@model = params["search"]["model"]
  	@content = params["search"]["content"]
  	@method = params["search"]["method"]
  	@shops = params["search"]["shop"]
  	@access = params["search"]["access"]
  	@records = search_for(@model, @content, @method, @shop, @access)
  	@range = params[:range]
    if @range == "店名"
      @shops = EndUser.looks(params[:search], params[:keyword])
    else
      @access = EndUser.looks(params[:search], params[:keyword])
    end
	end

	private

	def search_for(model, content, method, shop, access)
	  #店名か駅名で検索プルダウン分け/前後部分一致
  	if model == 'shop'
  	  if method == 'perfect'
  	    EndUser.where(name: content)
  	  elsif method == 'forward'
  	    EndUser.where('name LIKE ?', content+'%')
  	  elsif method == 'backward'
  	    EndUser.where('name LIKE ?', '%'+content)
  	  else
  	    EndUser.where('name LIKE ?', '%'+content+'%')
  	  end
  	elsif model == 'access'
  	  if method == 'perfect'
  	    EndUser.where(access: content)
  	  elsif method == 'forward'
  	    EndUser.where('access LIKE ?', content+'%')
  	  elsif method == 'backward'
  	    EndUser.where('access LIKE ?', '%' + content)
  	  else
  	    EndUser.where('access LIKE ?', '%' + content + '%')
  	  end
  	end
	end
end

