class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # topicをパラメータの値から探し出し,topicに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @notification = @comment.notifications.build(user_id: @topic.user.id)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        # JS形式でレスポンスを返します。
        format.js { render :index }
        unless @comment.topic.user_id == current_user.id
          Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'comment_created', message: 'あなたの作成したブログにコメントが付きました')
        end
        Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count)
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic), notice: 'コメントを削除しました。' }
      # JS形式でレスポンスを返します。
      format.js { render :index }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to topic_path(@comment.topic), notice: '編集しました！'
  end

  private

  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end
