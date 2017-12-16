module SitesHelper

  def get_spent
    total_amount = 0.0
    @expenditure_source = @site.contractual_labours

    @expenditure_source.each do |expenditure|
      total_amount += expenditure.amount.to_f.round
    end

    @expenditure_source = @site.departmental_labours
    @expenditure_source.each do |expenditure|
      total_amount += expenditure.amount.to_f.round
    end

    @expenditure_source = @site.materials
    @expenditure_source.each do |expenditure|
      total_amount += expenditure.amount.to_f.round
    end

    @expenditure_source = @site.office_expences
    @expenditure_source.each do |expenditure|
      total_amount += expenditure.amount.to_f.round
    end

    return total_amount
  end

  def get_income
    total_income = 0.0

    @expenditure_source = @site.booking_details
    @expenditure_source.each do |expenditure|
      total_income += expenditure.final_sale_deed.to_f.round(2)
    end

    return total_income
  end

  def get_total_oe
    total_oe = 0.0
    @expenditure_source = @site.office_expences
    @expenditure_source.each do |expenditure|
      total_oe += expenditure.amount.to_f.round
    end
    return total_oe
  end

  def get_total_cl
    total_cl = 0.0
    @expenditure_source = @site.contractual_labours
    @expenditure_source.each do |expenditure|
      total_cl += expenditure.amount.to_f.round
    end
    return total_cl
  end

  def get_total_dl
    total_dl = 0.0
    @expenditure_source = @site.departmental_labours
    @expenditure_source.each do |expenditure|
      total_dl += expenditure.amount.to_f.round
    end
    return total_dl
  end

  def get_total_m
    total_m = 0.0
    @expenditure_source = @site.materials
    @expenditure_source.each do |expenditure|
      total_m += expenditure.amount.to_f.round
    end
    return total_m
  end
end
