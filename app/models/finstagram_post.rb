class FinstagramPost < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes

  validates_presence_of :user
  validates :photo_url, :user, presence: true

  def humanized_time_ago
    time_ago_in_seconds = Time.now - self.created_at
    time_ago_in_minutes = time_ago_in_seconds / 60
    time_ago_in_hours = time_ago_in_minutes / 60
    
    time_ago_in_days = time_ago_in_hours / 24
    hours_left_over = time_ago_in_hours % 24 
    
    
    if time_ago_in_days >= 1
      days = "#{time_ago_in_days.to_i} days"
      if hours_left_over.to_i != 0
        days += ", #{hours_left_over.to_i} hours"
      end
      days += " ago"
      days
    elsif time_ago_in_hours >= 1
      "#{time_ago_in_hours.to_i} hours ago"
    elsif time_ago_in_minutes >= 1
      "#{time_ago_in_minutes.to_i} minutes ago"
    else
      "less than a minute ago"
    end
  end
  # New Stuff Start 
  def like_count
    self.likes.size
  end

  def comment_count
    self.comments.size
  end
  # New Stuff End
end