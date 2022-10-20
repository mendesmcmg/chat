# frozen_string_literal: true

class ScaffoldTestsController < ApplicationController
  before_action :set_scaffold_test, only: %i[show update destroy]

  # GET /scaffold_tests
  def index
    @scaffold_tests = ScaffoldTest.all

    render json: @scaffold_tests
  end

  # GET /scaffold_tests/1
  def show
    render json: @scaffold_test
  end

  # POST /scaffold_tests
  def create
    @scaffold_test = ScaffoldTest.new(scaffold_test_params)

    if @scaffold_test.save
      render json: @scaffold_test, status: :created, location: @scaffold_test
    else
      render json: @scaffold_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scaffold_tests/1
  def update
    if @scaffold_test.update(scaffold_test_params)
      render json: @scaffold_test
    else
      render json: @scaffold_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scaffold_tests/1
  def destroy
    @scaffold_test.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_scaffold_test
    @scaffold_test = ScaffoldTest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def scaffold_test_params
    params.require(:scaffold_test).permit(:text, :user_id)
  end
end
