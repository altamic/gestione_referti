class InvoiceTrailsController < ApplicationController
  def index
    @invoice_trails = InvoiceTrail.all
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
      flash[:notice] = "Successfully created invoice trail."
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
      flash[:notice] = "Successfully updated invoice trail."
      redirect_to @invoice_trail
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @invoice_trail = InvoiceTrail.find(params[:id])
    @invoice_trail.destroy
    flash[:notice] = "Successfully destroyed invoice trail."
    redirect_to invoice_trails_url
  end
end
