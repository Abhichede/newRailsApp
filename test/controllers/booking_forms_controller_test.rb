require 'test_helper'

class BookingFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_form = booking_forms(:one)
  end

  test "should get index" do
    get booking_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_form_url
    assert_response :success
  end

  test "should create booking_form" do
    assert_difference('BookingForm.count') do
      post booking_forms_url, params: { booking_form: { actual_agreement_cost: @booking_form.actual_agreement_cost, address: @booking_form.address, adhar: @booking_form.adhar, allotted_parking_charges: @booking_form.allotted_parking_charges, amenities_difference: @booking_form.amenities_difference, apartment_declaration: @booking_form.apartment_declaration, area: @booking_form.area, balance_amount: @booking_form.balance_amount, booking_charges: @booking_form.booking_charges, building_name: @booking_form.building_name, date: @booking_form.date, extras: @booking_form.extras, final_sale_deed_fees: @booking_form.final_sale_deed_fees, flat_cost: @booking_form.flat_cost, floor: @booking_form.floor, government_consideration: @booking_form.government_consideration, gst: @booking_form.gst, infrastructure_and_development: @booking_form.infrastructure_and_development, loan_possible: @booking_form.loan_possible, maintainance_charges: @booking_form.maintainance_charges, mseb_and_other_charges: @booking_form.mseb_and_other_charges, name: @booking_form.name, pan_number: @booking_form.pan_number, phone_number: @booking_form.phone_number, registration_charges: @booking_form.registration_charges, stamp_duty: @booking_form.stamp_duty, terms_and_consitions: @booking_form.terms_and_consitions, type_of_unit: @booking_form.type_of_unit, unit_no: @booking_form.unit_no, water_charges: @booking_form.water_charges } }
    end

    assert_redirected_to booking_form_url(BookingForm.last)
  end

  test "should show booking_form" do
    get booking_form_url(@booking_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_form_url(@booking_form)
    assert_response :success
  end

  test "should update booking_form" do
    patch booking_form_url(@booking_form), params: { booking_form: { actual_agreement_cost: @booking_form.actual_agreement_cost, address: @booking_form.address, adhar: @booking_form.adhar, allotted_parking_charges: @booking_form.allotted_parking_charges, amenities_difference: @booking_form.amenities_difference, apartment_declaration: @booking_form.apartment_declaration, area: @booking_form.area, balance_amount: @booking_form.balance_amount, booking_charges: @booking_form.booking_charges, building_name: @booking_form.building_name, date: @booking_form.date, extras: @booking_form.extras, final_sale_deed_fees: @booking_form.final_sale_deed_fees, flat_cost: @booking_form.flat_cost, floor: @booking_form.floor, government_consideration: @booking_form.government_consideration, gst: @booking_form.gst, infrastructure_and_development: @booking_form.infrastructure_and_development, loan_possible: @booking_form.loan_possible, maintainance_charges: @booking_form.maintainance_charges, mseb_and_other_charges: @booking_form.mseb_and_other_charges, name: @booking_form.name, pan_number: @booking_form.pan_number, phone_number: @booking_form.phone_number, registration_charges: @booking_form.registration_charges, stamp_duty: @booking_form.stamp_duty, terms_and_consitions: @booking_form.terms_and_consitions, type_of_unit: @booking_form.type_of_unit, unit_no: @booking_form.unit_no, water_charges: @booking_form.water_charges } }
    assert_redirected_to booking_form_url(@booking_form)
  end

  test "should destroy booking_form" do
    assert_difference('BookingForm.count', -1) do
      delete booking_form_url(@booking_form)
    end

    assert_redirected_to booking_forms_url
  end
end
