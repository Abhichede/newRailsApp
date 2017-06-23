class ContractListController < ApplicationController

  def add

    @contract_list = ContractList.new(:name => params[:name].upcase, :contract_unit => params[:contract_unit], :deleting_status => params[:deleting_status])
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    if @contract_list.save
      respond_to do |format|
        format.html{ redirect_to session.delete(:return_to), notice: 'Contract were added successfully'}
      end
    else
      respond_to do |format|
        format.html{ redirect_to session.delete(:return_to), alert: 'Something went wrong.'}
        format.json{ render @contract_list.errors, status: :unprocessable_entity }
      end
    end

  end
end
