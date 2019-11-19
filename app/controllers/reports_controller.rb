class ReportsController < ApplicationController
  def new
    @report = Report.new(report_params)
    authorize @report
  end

  def create
    @report = Report.new(report_params)
    authorize @report
    @report.user = current_user
    if @report.save
      redirect_to tips_path
    else
      render :new
    end
  end

  private
  def report_params
    params.require(:report).permit(:tip_id, :description, :reason_id)
  end
end
