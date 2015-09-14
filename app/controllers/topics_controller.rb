class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.all.page params[:page]
    @topic = Topic.new
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(:topic_id => @topic.id, :reply_to => nil).page params[:page]
  end
  
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to "/", notice: 'Tópico criado com sucesso!' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
