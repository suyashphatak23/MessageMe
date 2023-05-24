class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[ edit update destroy ]


  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    logger.debug "_____________________ In Create Method ________________________"
    logger.debug "_____________________ #{params.inspect} ________________________"
    @message = Message.new(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html {redirect_to root_path, notice: "Todo was successfully created."}
      else
        logger.debug "_____________________ In Else: #{@message.errors.full_messages} ________________________"
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@message)}_form", partial: "form", locals: { message: @message }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@message)}_form", partial: "form", locals: { message: @message }) }
        format.html { redirect_to root_path, notice: "Todo was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @message.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream:turbo_stream.remove("#{helpers.dom_id(@message)}")}
      format.html { redirect_to root_path, notice: "Todo was successfully destroyed." }
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body)
    end

end
