require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @user = create(:user)
    @product = assign(:product, @user.products.create!(
      :name => "MyString",
      :description => "The description of the product",
      :price => 1.5
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
