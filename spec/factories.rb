FactoryGirl.define do
  factory :user do
    name "Akash Khandelwal"
  end

  factory :invalid_user, parent: :user do
	  name nil
	end


  factory :collection do
  	name "Example Album"
  end
end