module ParamsChecker

  def params_parser
    if params[:created_at]
      params[:created_at] = params[:created_at].to_time
    elsif params[:updated_at]
      params[:updated_at] = params[:updated_at].to_time
   end
  end

end
