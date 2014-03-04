class RootController < ApplicationController
  include ActiveSupport::NumberHelper
  
  def index
  end

  def legacy_import
  end

  def legacy_import_submit
    imported_items = CustomersProduct.from_legacy_csv params[:file].tempfile.to_path.to_s

    revenue = imported_items.sum(&:total_price)
    redirect_to :legacy_import, :notice => "Gross Revenue #{number_to_currency revenue}"
  end
end
