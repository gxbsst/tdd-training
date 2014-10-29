FactoryGirl.define do
  sequence :name do |n|
    "course_name_#{n}"
  end
  factory :course do
    name
    intro "here is intro"
    description "here is description"
    cover_url "#"
    released_at Time.now

    # after(:create) do |course|
    #   create_list :character, 3, course: course
    # end
    #
    # trait :type_is_nil do
    #   type ''
    # end
  end
end