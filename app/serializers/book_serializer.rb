class BookSerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :author,
              :genre,
              :publisher,
              :year,
              :available,
              :image_url

  def available
    rent = object.rents.where(to: object.rents.maximum(:to)).first
    rent ? (rent[:to] <= Time.zone.today) : true
  end
end
