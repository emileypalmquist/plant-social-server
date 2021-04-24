class Api::V1::CareNotesController < ApplicationController
  before_action :set_care_note, only: [:show, :update, :destroy]

  # GET /care_notes
  def index
    @care_notes = CareNote.all

    render json: @care_notes
  end

  # GET /care_notes/1
  def show
    render json: @care_note
  end

  # POST /care_notes
  def create
    @care_note = CareNote.new(care_note_params)

    if @care_note.save
      render json: @care_note, status: :created
    else
      render json: @care_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /care_notes/1
  def update
    if @care_note.update(care_note_params)
      render json: @care_note
    else
      render json: @care_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /care_notes/1
  def destroy
    @care_note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_note
      @care_note = CareNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def care_note_params
      params.require(:care_note).permit(:user_plant_id, :content)
    end
end
