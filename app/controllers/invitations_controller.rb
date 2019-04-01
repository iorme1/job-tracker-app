class InvitationsController < ApplicationController
  def new
  end

  def create
    @receiving_user = User.find_by_email(params[:invitation][:sent_to])
    if @receiving_user
      @invitation = @receiving_user.invitations.new(sent_to: @receiving_user.email, sent_by: current_user.email)
      if @invitation.save
        flash[:notice] = "Successfully sent invitation."
        redirect_to root_path
      else
        flash[:alert] = "There was an error sending your invitation. Please try again."
        render :new
      end
    else
      flash[:alert] = "No user exists with that email."
      render :new
    end
  end
end
