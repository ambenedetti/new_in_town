class ReportsController < ApplicationController
  def new
    @report = Report.new
    authorize @report
    @tip = Tip.find(params[:tip_id])
  end

  def create
    @report = Report.new(report_params)
    authorize @report
    @tip = Tip.find(params[:tip_id])
    @report.tip = @tip
    @report.user = current_user
    if @report.save!
      redirect_to tips_path(@report.tip)
    else
      render :new
    end
  end

  private
  def report_params
    params.require(:report).permit( :description, :reason_id)
  end
end
