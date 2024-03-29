class VotesController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    vote = topic.votes.build  
    vote.save!
    Topic.increment_counter(:vote_count,topic.id)
    redirect_to(topics_path)
  end
  def destroy
  	topic = Topic.find(params[:topic_id])
  	#redirect_to(topics_path) and return unless topic.votes.any?
	redirect_to(topics_path) and return if topic.votes.empty?
    
    #if topic.votes.any?
    #	unvote = topic.votes.last
   # 	unvote.destroy
   # end
   	unvote = topic.votes.last
   	unvote.destroy
    Topic.decrement_counter(:vote_count,topic.id)
    redirect_to(topics_path)
  end
end