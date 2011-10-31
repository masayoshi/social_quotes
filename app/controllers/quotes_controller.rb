class QuotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @quotes = Quote.page(params[:page])
  end

  def show
    @quote = Quote.find_by_id(params[:id])

    if @quote.blank?
      redirect_to root_path, alert: 'Quote was not found.' 
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
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @quote = current_user.quotes.find_by_id(params[:id])
    
    if @quote.present?
      if @quote.update_attributes(params[:quote])
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
end
