class TypeOfStructuresController < ApplicationController
  def index
    @type_of_structure = TypeOfStructure.all
  end

  def add
    @type_of_structure = TypeOfStructure.new(:name => params[:name].upcase )

    respond_to do |format|
      if @type_of_structure.save
        format.html { redirect_to type_of_structures_index_path, notice: 'Structure type added successfully.' }
        format.json { render :index, status: :created, location: @type_of_structure }
      else
        format.html { render :index }
        format.json { render json: @type_of_structure.errors, status: :unprocessable_entity }
      end
    end
  end
end
