class Product::StepsController < ApplicationController
	include Wicked::Wizard
  steps *Product.form_steps

  def show
    @product = Product.find(params[:product_id])
    render_wizard
  end

  def update
    @product = Product.find(params[:product_id])
    @product.update_attributes(product_params(step))
    render_wizard @product
  end

  private
  def product_params(step)
  	permitted_attributes = case step
                           when "add_name"
                             [:name]
                           when "add_price"
                             [:price]
                           when "add_category"
                             [:category]
                           end
    params.require(:product).permit(permitted_attributes).merge(form_step: step)
  end
end
