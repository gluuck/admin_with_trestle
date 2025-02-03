Trestle.resource(:products, model: Product) do
  menu do
    item :Продукты, icon: "fa fa-file-text-o"
  end

  search do |query|
    if query
      Product.where("title ILIKE ?", "%#{query}%")
    else
      Product.all
    end
  end

  scopes do
    scope :all, default: true
  end

  table do
    column :Название, ->(product) { product.title }, link: true
    column :updated_at, header: "Last Updated", align: :center
    column :фото, header: false do |product|
      render "home/image", product:
    end
    actions
  end

  form do |product|
    row do
      col(xs: 6) do
        text_field :title, label: "Название"
      end
      col(xs: 3) { file_field :image, label: "Загрузить Фото" }
    end
    render "home/image", product:
  end
end
