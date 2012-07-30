
FactoryGirl.define do
  factory :user do
	#name	"Test test"
	#email	"test@example.com"
	
	sequence(:name) { |n| "Person #{n}" }
	sequence(:email) { |n| "Person_#{n}@example.com" }

	password	"testtest"
	password_confirmation	"testtest"

	factory :admin do
	  admin true
	end

  end
end
	
