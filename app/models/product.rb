class Product < ApplicationRecord
	validates_presence_of :title, :description, :details, :link, :price
end
