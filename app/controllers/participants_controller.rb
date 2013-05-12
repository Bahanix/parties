class ParticipantsController < ApplicationController
  def set
    @participant = Participant.includes(:items).where(party_id: params[:party][:id]).find(params[:participant][:id])
    @items = Party.find(params[:party][:id]).items

    respond_to do |format|
      if @participant.items = Item.where(id: (params[:items] || {}).keys)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @participant = Participant.new(params[:participant])
    @participant.party_id = params[:party][:id]

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render json: @participant, status: :created }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end
end
