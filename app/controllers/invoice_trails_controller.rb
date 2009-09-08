class InvoiceTrailsController < ApplicationController
  def index
    @search = InvoiceTrail.search(params[:search])
    @invoice_trails, @invoice_trails_count = @search.all.paginate(:per_page => 10, :page => params[:page]), @search.count
    @partial_gross_amount = @search.sum(:gross_amount)
    @partial_payed_amount = @search.sum(:payed_amount)
    @partial_average_discount = @search.average(:discount)
  end
  
  def show
    @invoice_trail = InvoiceTrail.find(params[:id])
  end
  
  def new
    @invoice_trail = InvoiceTrail.new
  end
  
  def create
    @invoice_trail = InvoiceTrail.new(params[:invoice_trail])
    if @invoice_trail.save
      flash[:notice] = "Creazione avvenuta con successo"
      redirect_to @invoice_trail
    else
      render :action => 'new'
    end
  end
  
  def edit
    @invoice_trail = InvoiceTrail.find(params[:id])
  end
  
  def update
    @invoice_trail = InvoiceTrail.find(params[:id])
    if @invoice_trail.update_attributes(params[:invoice_trail])
      flash[:notice] = "Aggiornamento avvenuto con successo"
      redirect_to @invoice_trail
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @invoice_trail = InvoiceTrail.find(params[:id])
    @invoice_trail.destroy
    flash[:notice] = "Eliminazione avvenuta con successo"
    redirect_to invoice_trails_url
  end
end
