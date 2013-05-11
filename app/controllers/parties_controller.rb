class PartiesController < ApplicationController
  before_filter :find_party, only: [:show, :edit]

  # GET /1
  # GET /1.json
  def show
  end

  # GET /new
  # GET /new.json
  def new
    @party = Party.new
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /1
  # PUT /1.json
  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /1
  # DELETE /1.json
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
    end
  end

  private

  def find_party
    @party = Party.find(params[:id])

    if request.path != party_path(@party)
      redirect_to @party, status: :moved_permanently
    end
  end
end
