class ItemsController < ApplicationController
  def create
    @item = Item.new(params[:item])
    @item.party_id = params[:party][:id]

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
      format.js
    end
  end
end
