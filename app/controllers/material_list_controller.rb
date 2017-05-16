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

    respond_to do |format|
      if @material_list.save
        format.html { redirect_to material_list_index_path, notice: 'Material was successfully added.' }
        format.json { render :index, status: :created, location: @material_list }
      else
        format.html { render :index }
        format.json { render json: @material_list.errors, status: :unprocessable_entity }
      end
    end
  end

end
