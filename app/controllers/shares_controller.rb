class SharesController < ApplicationController
  def new
    @invitation = Invitation.find(params[:invite_id])
    @sender = User.find_by_email(@invitation.sent_by)
    @invitation.accepted = true
    @invitation.save

    @share = current_user.shares.new(authorized_by: @invitation.sent_by)
    if @share.save
      flash[:notice] = "Accepted Invite. You may now view #{@sender.email}'s companies"
      redirect_to root_path
    else
      flash[:alert] = "There was an error. Please try again."
      redirect_to root_path
    end
  end
end
