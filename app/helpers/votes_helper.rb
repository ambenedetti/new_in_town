module VotesHelper
  def up_vote_button(tip, user_votes)
    vote = user_votes.find { |vote| vote.tip_id == tip.id }

    btn_classes = ['btn votes-up']
    btn_classes << 'selected' if vote&.up?
    btn_classes << 'disabled' if vote&.down?

    content_tag :button, disabled: vote&.down?, class: btn_classes.join(' ') do
      concat content_tag :i, '', class: "fas fa-caret-up m-1"
      concat tip.votes.count(&:up?)
    end
  end

  def down_vote_button(tip, user_votes)
    vote = user_votes.find { |vote| vote.tip_id == tip.id }

    btn_classes = ['btn votes-down']
    btn_classes << 'selected' if vote&.down?
    btn_classes << 'disabled' if vote&.up?

    content_tag :button, disabled: vote&.up?, class: btn_classes.join(' ') do
      concat content_tag :i, '', class: "fas fa-caret-down m-1"
      concat tip.votes.count(&:down?)
    end
  end
end
