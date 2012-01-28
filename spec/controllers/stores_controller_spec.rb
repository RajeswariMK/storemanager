require 'spec_helper'

describe StoresController do
   
  before(:each) do
    Store.delete_all
    User.delete_all
    @user = Factory(:user)
    sign_in @user
  end
   describe "GET index" do
     before(:each) do
       @store = Factory(:store)
       @store_url = Factory(:urls_for_current_user)
     end    
     it "should be success" do
      get 'index'
      response.should be_success
     end
     
     it "assigns all stores as @stores" do
      
     end
   end 
   
   describe "GET show" do
    it "assigns the requested store as @store" do
      @store = Factory(:store)
      get :show, {:id => @store.to_param}
      assigns(:store).should eq(@store)
    end
  end
  
   describe "GET new" do
    it "assigns a new store as @store" do
      get :new
      assigns(:store).should be_instance_of(Store)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested store as @store" do
      @store = Factory(:store)
      get :edit, {:id => @store.to_param}
      assigns(:store).should eq(@store)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      before(:each) do
       @store = Factory(:store)
      end  
      it "creates a new Store" do
        expect {
          post :create, {:store => @store}
        }.to change(Store, :count).by(1)
      end

      it "assigns a newly created store as @store" do
        post :create, {:store => @store }
        assigns(:store).should be_a(Store)
        assigns(:store).should be_persisted
      end

      it "redirects to the created store" do
        post :create, {:store => @store }
        response.should redirect_to(Store.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved store as @store" do
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        post :create, {:store => {}}
        assigns(:store).should be_a_new(Store)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        post :create, {:store => {}}
        response.should render_template("new")
      end
    end
  end
  
   describe "PUT update" do
      before(:each) do
       @store = Factory(:store)
      end    
    describe "with valid params" do
      it "updates the requested store" do
        #store = Store.create! valid_attributes
        # Assuming there are no other stores in the database, this
        # specifies that the Store created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Store.any_instance.should_receive(:update_attributes).with({'url' => 'http://www.somesite.com'})
        put :update, {:id => @store.to_param, :store => {'url' => 'http://www.somesite.com'}}
      end

      it "assigns the requested store as @store" do
        put :update, {:id => @store.to_param, :store => @store}
        assigns(:store).should eq(@store)
      end

      it "redirects to the store" do
        put :update, {:id => @store.to_param, :store => @store}
        response.should redirect_to(@store)
      end
    end

    describe "with invalid params" do
      it "assigns the store as @store" do
       
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        put :update, {:id => @store.to_param, :store => {}}
        assigns(:store).should eq(@store)
      end

      it "re-renders the 'edit' template" do
        
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        put :update, {:id => @store.to_param, :store => {}}
        response.should render_template("edit")
      end
    end
  end
  
  
  describe "DELETE destroy" do
     before(:each) do
       @store = Factory(:store)
      end 
    it "destroys the requested store" do
      expect {
        delete :destroy, {:id => @store }
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the stores list" do
      delete :destroy, {:id => @store }
      response.should redirect_to(stores_url)
    end
  end
  
  
  describe "tag_list_for_urls" do
    before(:each) do
     @url1 = Store.create(:url => "http://www.asdgg.com", :tag_list => "rails, ruby, rhomobile")
     @helper = class Helper
      include ActsAsTaggableOn::TagsHelper
    end.new
   end  
   before(:each) do
      Store.tag_types = []
      Store.acts_as_taggable_on(:tags)
      @store = Factory(:store)
     
   end  
   it "should respond 'true' to taggable for store model" do
      @store.class.should be_taggable
   end
    
   it "should show tags for url" do 
	tags = { }
	get :tag_cloud
	@count = @url1.tag_counts_on(:tags)
	response.should_not be_nil
    end
    it "should get urls tag names" do
      @store =  @url1.tag_counts_on(:tags)
      get :tag, :id => 'rails'
      response.should be_success
    end
  end
end
