class Post < ApplicationRecord
	has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300", :thumb => "150x150" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


	def previous
	  Post.where(["id < ?", id]).last
	end

	def next
	  Post.where(["id > ?", id]).first
	end
end
