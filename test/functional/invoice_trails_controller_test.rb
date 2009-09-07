require 'test_helper'

class InvoiceTrailsControllerTest < ActionController::TestCase
  context "index action" do
    should "render index template" do
      get :index
      assert_template 'index'
    end
  end
  
  context "show action" do
    should "render show template" do
      get :show, :id => InvoiceTrail.first
      assert_template 'show'
    end
  end
  
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      InvoiceTrail.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    
    should "redirect when model is valid" do
      InvoiceTrail.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to invoice_trail_url(assigns(:invoice_trail))
    end
  end
  
  context "edit action" do
    should "render edit template" do
      get :edit, :id => InvoiceTrail.first
      assert_template 'edit'
    end
  end
  
  context "update action" do
    should "render edit template when model is invalid" do
      InvoiceTrail.any_instance.stubs(:valid?).returns(false)
      put :update, :id => InvoiceTrail.first
      assert_template 'edit'
    end
  
    should "redirect when model is valid" do
      InvoiceTrail.any_instance.stubs(:valid?).returns(true)
      put :update, :id => InvoiceTrail.first
      assert_redirected_to invoice_trail_url(assigns(:invoice_trail))
    end
  end
  
  context "destroy action" do
    should "destroy model and redirect to index action" do
      invoice_trail = InvoiceTrail.first
      delete :destroy, :id => invoice_trail
      assert_redirected_to invoice_trails_url
      assert !InvoiceTrail.exists?(invoice_trail.id)
    end
  end
end
