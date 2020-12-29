class FormsController < ApplicationController
  def basic_forms
  end

  def advanced
  end

  def wizard
  end

  def file_upload
    @import_infos = ImportInfo.all
    redirect_to dashboard_path if params[:file]
  end

  def text_editor
  end

  def markdown
  end

end
