# encoding: UTF-8
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BillsController do

  # This should return the minimal set of attributes required to create a valid
  # Bill. As you add validations to Bill, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "uid" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BillsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested bill as @bill" do
      bill = FactoryGirl.create(:bill1)
      get :show, id: bill.uid, format: :json
      assigns(:bill).should eq(bill)
    end

    it "returns the correct bill in json format" do
      bill = FactoryGirl.create(:bill1)
      get :show, id: bill.uid, format: :json
      response.should be_success
      response.body.should eq(assigns(:bill).to_json)
    end
  end

  describe "GET search" do
    it "assigns query results to @bills" do
      bill1 = FactoryGirl.create(:bill1)
      bill2 = FactoryGirl.create(:bill2)
      Sunspot.remove_all(Bill)
      Sunspot.index!(Bill.all)
      get :search, q: "Pena", format: :json
      assigns(:bills).should eq([bill1])
    end

    #works well, but haven't found the way to test the format
    xit "returns bills in roar/json format" do
      bill1 = FactoryGirl.create(:bill1)
      bill2 = FactoryGirl.create(:bill2)
      Sunspot.remove_all(Bill)
      Sunspot.index!(Bill.all)
      get :search, q: "Tramitación", format: :json
      response.body.should eq(assigns(:bills).to_json)
    end
  end

  describe "GET index" do
    xit "assigns all bills as @bills" do
      bill = Bill.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bills).should eq([bill])
    end
  end

  describe "GET new" do
    xit "assigns a new bill as @bill" do
      get :new, {}, valid_session
      assigns(:bill).should be_a_new(Bill)
    end
  end

  describe "GET edit" do
    xit "assigns the requested bill as @bill" do
      bill = Bill.create! valid_attributes
      get :edit, {:id => bill.to_param}, valid_session
      assigns(:bill).should eq(bill)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Bill" do
        expect {
          post :create, {:bill => valid_attributes}, valid_session
        }.to change(Bill, :count).by(1)
      end

      xit "assigns a newly created bill as @bill" do
        post :create, {:bill => valid_attributes}, valid_session
        assigns(:bill).should be_a(Bill)
        assigns(:bill).should be_persisted
      end

      xit "redirects to the created bill" do
        post :create, {:bill => valid_attributes}, valid_session
        response.should redirect_to(Bill.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved bill as @bill" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => { "uid" => "invalid value" }}, valid_session
        assigns(:bill).should be_a_new(Bill)
      end

      xit "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => { "uid" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested bill" do
        bill = Bill.create! valid_attributes
        # Assuming there are no other bills in the database, this
        # specifies that the Bill created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bill.any_instance.should_receive(:update_attributes).with({ "uid" => "MyString" })
        put :update, {:id => bill.to_param, :bill => { "uid" => "MyString" }}, valid_session
      end

      xit "assigns the requested bill as @bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        assigns(:bill).should eq(bill)
      end

      xit "redirects to the bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        response.should redirect_to(bill)
      end
    end

    describe "with invalid params" do
      xit "assigns the bill as @bill" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => { "uid" => "invalid value" }}, valid_session
        assigns(:bill).should eq(bill)
      end

     xit "re-renders the 'edit' template" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => { "uid" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested bill" do
      bill = Bill.create! valid_attributes
      expect {
        delete :destroy, {:id => bill.to_param}, valid_session
      }.to change(Bill, :count).by(-1)
    end

    xit "redirects to the bills list" do
      bill = Bill.create! valid_attributes
      delete :destroy, {:id => bill.to_param}, valid_session
      response.should redirect_to(bills_url)
    end
  end

end
