require 'rails_helper'
require 'support/controller_helpers'

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

RSpec.describe ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:user) { create(:user) }

  let(:different_user) { User.create(first_name: "John", last_name: "Smith", email: "jsmith@gmail.com") }

  let(:product_attrs) { attributes_for(:product) }

  let(:product) { user.products.create(attributes_for(:product)) }

  let(:valid_attributes) {
    attributes_for(:product)
  }

  let(:invalid_attributes) do
    create(:product)
  end

  describe "GET #index" do

    it "tries to assign the requested product as @products" do
      sign_in nil
      get :index, {}
      expect(response).to be_success
      expect(assigns(:products)).to eq([product])
    end

  end

  describe "GET #show" do

    it "tries to assign the requested product as @product" do
      get :show, {:id => product.to_param}
      expect(assigns(:product)).to eq(product)
    end

  end

  describe "GET #new" do

    it "tries to assign a new product as @product without authorization" do
      sign_in nil
      get :new, {}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "assigns a new product as @product with authorization" do
      sign_in user
      get :new, {}
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do

    it "tries to get the requested product edit page without logging in" do
      sign_in nil
      get :edit, {:id => product.to_param}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "tries to get the requested product edit page as a different user" do
      sign_in different_user
      get :edit, {:id => product.to_param}
      expect(response).to redirect_to(products_path)
    end

    it "gets the product page as the product user" do
      sign_in user
      get :edit, {:id => product.to_param}
      expect(assigns(:product)).to( eq(product) )
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "should fail to add a new product without authorization" do
        sign_in nil
        expect {
          post :create, {:product => product_attrs }
        }.to change(Product, :count).by(0)
      end

      it "creates a new Product with authorization" do
        sign_in user
        expect {
          post :create, {:product => product_attrs }
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        sign_in user
        post :create, {:product => product_attrs}
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        sign_in user
        post :create, {:product => valid_attributes}
        expect(response).to redirect_to(Product.last)
      end
    end

  end

  describe "PUT #update" do


    # it "not update if user is not the author of the product" do
    #   sign_in different_user
    #   product.name = "Playstation 5"
    #   put :update, {:id => product.to_param, :product => product_attrs}
    #   expect(product.name).to_not eq("Playstation 5")
    # end

    context "when user is signed in" do

      before(:each) {sign_in user}

      it "updates the requested product" do
        product.name = "Playstation 5"
        put :update, {:id => product.to_param, :product => product_attrs}
        expect(product.name).to eq("Playstation 5")
      end

      it "assigns the requested product as @product" do
        put :update, {:id => product.to_param, :product => product_attrs}
        expect(assigns(:product)).to eq(product)
      end

      it "redirects to the product" do
        put :update, {:id => product.to_param, :product => product_attrs}
        expect(response).to redirect_to(product)
      end

    end

  end

  describe "DELETE #destroy" do

    it "destroys the requested product" do
      sign_in user
      product = user.products.create! product_attrs
      expect {
        delete :destroy, {:id => product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      sign_in user
      product = user.products.create! valid_attributes
      delete :destroy, {:id => product.to_param}
      expect(response).to redirect_to(products_url)
    end

  end

end