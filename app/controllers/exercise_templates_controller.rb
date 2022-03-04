class ExerciseTemplatesController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /friends or /friends.json
  def index
    @exercise_templates = ExerciseTemplate.all
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
#     @friend = Friend.new
    @exercise_templates = current_user.exercise_templates.build()
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
#     @friend = Friend.new(friend_params)
    @exercise_template = current_user.exercise_templates.build(exercise_templates)

    respond_to do |format|
      if @exercise_template.save
        format.html { redirect_to exercise_template_url(@exercise_template), notice: "Exercise template was successfully created." }
        format.json { render :show, status: :created, location: @exercise_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
     @exercise_template.destroy

    respond_to do |format|
      format.html { redirect_to exercise_templates_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
   @exercise_template = current_user.exercise_templates.find_by(id: params[:id])
    redirect_to exercise_templates_path, notice: "Not Authorized to Edit This Friend" if @exercise_template.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @exercise_template = ExerciseTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_templates
      params.require(:exercise_template).permit(:user_id, :weight, :reps, :sets, :exercise_name)
    end
end
