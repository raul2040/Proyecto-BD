class Article < ActiveRecord::Base
    #La tabla => articles
    #Campos => ActiveRecord, article.title()
    #Escribir métodos
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true , length: {minimum:20, maximum:100}
end
