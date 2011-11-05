class QuotesController < ApplicationController
  before_filter :tag_cloud, :only => [:index, :show]
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    if params[:tag].present?
      @quotes = Quote.tagged_with(params[:tag]).page(params[:page])
    elsif params[:keyword].present?
      @quotes = Quote.keyword_search(params[:keyword]).page(params[:page])
    elsif params[:user_id].present? && (@user = User.find_by_id(params[:user_id]))
      @quotes = @user.quotes.page(params[:page])
    else
      @quotes = Quote.page(params[:page])      
    end
  end

  def show
    @quote = Quote.find_by_id(params[:id])
    if @quote.blank?
      redirect_to root_path, alert: 'Quote was not found.'
    else
      @user = @quote.user
    end
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = current_user.quotes.find_by_id(params[:id])
    
    if @quote.blank?
      redirect_to root_path, alert: 'Quote was not found.' 
    end
  end

  def create
    @quote = current_user.quotes.build(params[:quote])

    if @quote.save
      current_user.twitter.update(@quote.body[0..99] + " ... "  + quote_url(@quote)) if params[:twitter] == 'yes'
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @quote = current_user.quotes.find_by_id(params[:id])
    
    if @quote.present?
      if @quote.update_attributes(params[:quote])
        current_user.twitter.update(@quote.body[0..99] + " ... "  + quote_url(@quote)) if params[:twitter] == 'yes'
        redirect_to @quote, notice: 'Quote was successfully updated.'
      else
        render action: "edit"
      end
    else
      redirect_to root_path, alert: 'Quote was not found.'      
    end
  end

  def destroy
    @quote = current_user.quotes.find_by_id(params[:id])

    if @quote.present?
      @quote.destroy
      redirect_to quotes_path, notice: 'Quote was successfully deleted.'
    else
      redirect_to root_path, alert: 'Quote was not found.'      
    end
  end

  private
  
  def tag_cloud
    @tags = Quote.tag_counts_on(:tags)
  end
end
