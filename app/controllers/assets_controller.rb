class AssetsController < ApplicationController

  def new
    @student = Student.new
    asset = @student.assets.build
    render :partial => 'assets/form', locals: { file_number: params[:file_number].to_i, asset: asset }
  end
end
