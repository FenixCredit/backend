class Product::Create
  Result = ImmutableStruct.new(:successful?, :product, :errors)

  def self.call(params)
    product = nil
    promissory_note = PromissoryNote.find_by_id(
      params[:guarantee_product][:promissory_note_id]
    )

    form_product = Product::FormObject.new(
      params.except(:guarantee_product)
    )

    if form_product.save
      product = form_product.product
    else
      return Result.new(
        successful: false,
        product: nil,
        errors: form_product.errors[:base]
      )
    end

    if !product.nil? && !promissory_note.nil?
      form_guarantee_product = GuaranteeProduct::FormObject.new({
        product_id: product.id,
        promissory_note_id: promissory_note.id
      })

      if form_guarantee_product.save
        Result.new(
          successful: true,
          product: product,
          errors: nil
        )
      else
        Result.new(
          successful: false,
          product: nil,
          errors: form_promissory_note.errors[:base]
        )
      end
    end
  end
end
