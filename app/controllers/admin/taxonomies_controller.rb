# frozen_string_literal: true

class Admin::TaxonomiesController < AdminController
  def index
    @taxonomies = Taxonomy.all.order(:position, :name)
  end

  def new
    @taxonomy = Taxonomy.new
  end

  def edit
    taxonomy
  end

  def show
    taxonomy
  end

  def create
    @taxonomy = Taxonomy.create!(permit_params)
    @taxonomy.update(code: @taxonomy.slug)
    redirect_after_update_or_create(@taxonomy)
  end

  def update
    taxonomy.update(permit_params)
    redirect_after_update_or_create(taxonomy)
  end

  def destroy
    if taxonomy.destroy!
      flash[:notice] = "#{taxonomy.name} deleted successfully"
    else
      flash[:alert] = "#{taxonomy.name} deleted failed"
    end
    redirect_to taxonomies_path
  end

  private

    def permit_params
      params.require(:taxonomy).permit(:name, :slug, :position)
    end

    def taxonomy
      return @taxonomy if @taxonomy
      @taxonomy = Taxonomy.find(params[:id])
    end
end
