class AppliesController < ApplicationController
  def create
    apply = current_user.applies.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{apply.event.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    apply = current_user.applies.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "#{apply.event.user.name}さんのブログをお気に入り解除しました"
  end
  def toggle_status
    apply = Apply.find(params[:apply_id])
    apply.toggle_status!(status: apply.status)
    redirect_to apply_members_event_path(id: apply.event_id), notice: 'selected was successfully updated.'
  end
end
