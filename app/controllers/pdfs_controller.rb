class PdfsController < ApplicationController

  def add_pdfs
    Pdf.add_pdfs
    redirect_to pdfs_path
  end

  def index
    @pdfs = Pdf.all 
  end

  def show
    @pdf = Pdf.find_by_id(params[:id])
    pdf_full_path = Rails.root + "app/assets/pdfs/" + @pdf.name
    send_file(pdf_full_path, :filename => "@pdf.name.gsub('.pdf','')", :disposition => 'inline', :type => "application/pdf")
  end

  def new
    @pdf = Pdf.new 
  end

  def create
    @pdf = Pdf.new(pdf_params)
    if @pdf.save
      flash[:message] = 'Pdf created.'
      redirect_to pdf_path(@pdf)
    else
      render :new
    end
  end

  def edit
    @pdf = Pdf.find_by_id(params[:id])
  end

  def update
    @pdf = Pdf.find_by_id(params[:id])
    @pdf.update(pdf_params)
    if @pdf.save
      flash[:message] = 'Pdf updated.'
      redirect_to pdf_path(@pdf)
    else
      render :edit
    end
  end

  def destroy
    @pdf = Pdf.find_by_id(params[:id])
    @pdf.destroy
    redirect_to pdfs_path
  end

  private

  def pdf_params
    params.require(:pdf).permit(:name, :location)
  end
end
