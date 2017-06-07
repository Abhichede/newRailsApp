class MaterialListController < ApplicationController
  def index
    @material_list = MaterialList.all
  end

  def show
  end

  def add
    @material_list = MaterialList.new(:material_name => params[:material_name].upcase,
                                      :material_unit => params[:material_unit].upcase,
                                      :deleting_status=>params[:deleting_status] )
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if @material_list.save
        format.html { redirect_to session.delete(:return_to), notice: 'Material was successfully added.' }
        format.json { render :show, status: :created, location: @material_list }
      else
        format.html { redirect_to site_path(params[:site]) }
        format.json { render json: @material_list.errors, status: :unprocessable_entity }
      end
    end
  end

end
