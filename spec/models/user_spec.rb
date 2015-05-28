require 'rails_helper'

RSpec.describe User, type: :model do

  it "create new user" do

    user = create(:user)

    expect(User.all).to include(user)

  end

end
