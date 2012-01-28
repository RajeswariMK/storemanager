Factory.define :store do |i|
  i.sequence(:url) { |n| "http://www.google_#{n}.com" }
  i.association :user
end

Factory.define :urlstore_with_user, :parent => :store do |i|
  i.association :user
end

Factory.define :urls_for_current_user , :class => Store do |i|
  i.sequence(:url) { |n| "http://www.google_#{n}.com" }
  i.association :user
end

Factory.define :url_with_tags, :class => Store do |i|
  i.sequence(:url) { |n| "http://www.myweb_#{n}.com" }
  i.tags "c"
  i.association :user
end

