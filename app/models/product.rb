class Product < ActiveRecord::Base
	cattr_accessor :form_steps do
    %w(add_name add_price add_category)
  end

  attr_accessor :form_step

  validates :name, presence: true, if: -> { required_for_step?(:add_name) }
  validates :price, presence: true, if: -> { required_for_step?(:add_price) }
  validates :category, presence: true, if: -> { required_for_step?(:add_category) }

  def required_for_step?(step)
    return true if self.form_steps.index(step.to_s) == self.form_steps.index(form_step)
  end
end
