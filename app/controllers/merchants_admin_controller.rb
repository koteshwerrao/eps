class MerchantsAdminController < ApplicationController
	 before_action :set_merchant, only: [:show, :edit, :update, :destroy]
  def index
    @merchants = Merchant.all
    Merchant.asc(:created_at).last.send_confirmation_instructions
  end

  def show
  end


  def new
    @merchant = Merchant.new
  end

 
  def edit
  end

  def create
    @merchant = Merchant.new(merchant_params)
    @merchant.skip_confirmation_notification! 
    respond_to do |format|
      if @merchant.save
        format.html {redirect_to merchants_admin_index_path}
      else
        format.html { render action: 'new' }
      end
     end
  end

  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to merchants_admin_index_path, notice: 'merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchnat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
      params.require(:merchant).permit(:email,:password,:password_confirmation)
    end
end
