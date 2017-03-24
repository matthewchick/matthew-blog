# file name: article.rb -> singular and all lowercase
# :: is to mention the module name. ActiveRecord::Base means base class in activerecord module or namespace.
# model name: Article -> capitalized U and singular
class Article < ActiveRecord::Base
   belongs_to :user
   #add validation before saving to dB
   validates :title, presence: true, length:{minimum: 3, maximum: 50 }
   validates :description, presence: true, length:{minimum: 10, maximum: 300 }
   validates :user_id, presence: true
end
