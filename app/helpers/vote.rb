helpers do

  def count_question_upvotes(question)
    question.question_votes.where(updown: true).count
  end

  def count_question_downvotes(question)
    question.question_votes.where(updown: false).count
  end

  def count_answer_upvotes(answer)
    answer.answer_votes.where(updown: true).count
  end

  def count_answer_downvotes(answer)
    answer.answer_votes.where(updown: false).count
  end

  def user_voted?(user_id,answer)
    voted = AnswerVote.find_by(user_id: current_user.id,answer_id: answer.id)
    if voted && voted.updown
      message = "You upvoted"
    elsif voted && !voted.updown
      message = "You downvoted"
    end
  end
end
