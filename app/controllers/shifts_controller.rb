class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [:edit, :update, :destroy]
  attr_accessor :shifts
  # GET /shifts or /shifts.json
  def filter
    shift = Shift.find(params['name']['id']) 
    @shifts = shift.name
  end  
    
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    # @shift = Shift.new
    @shift = current_user.shifts.build
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts or /shifts.json
  def create
    # @shift = Shift.new(shift_params)
    @shift = current_user.shifts.build(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @shift = current_user.shifts.find_by(id: params[:id])
    redirect_to shifts_path, notice: "Not authourised to edit this shift" if @shift.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:full_name, :shift_date, :start_time, :finish_time, :break_length, :user_id)
    end
end
