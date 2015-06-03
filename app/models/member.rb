class Member < ActiveRecord::Base

  # has_attached_file :img_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :img_url, :content_type => /\Aimage\/.*\Z/
  belongs_to :family
  has_many :events, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :assigned_tasks, foreign_key: :assigned_member_id, class_name: "Task", dependent: :destroy
  has_many :completed_tasks, foreign_key: :completed_member_id, class_name: "Task", dependent: :destroy

  validates :name, :family, :img_url, presence: true
  validates :task_points, numericality: {only_integer: true}

  # validates_attachment_content_type :img_url, :content_type => /\Aimage\/.*\Z/

  def tasks_left_to_do
    self.assigned_tasks - self.completed_tasks.where(complete: true)
  end

  def assign_color
    colors = ["#7E57C2", "#42A5F5", "#26A69A", "#FF9800", "#FFEE58", "#78909C", "#EC407A", "#AB47BC", "#26C6DA", "#8BC34A", "#FFCA28", "#69F0AE"]
    count = self.family.members.length
    self.color = colors[count]
  end

  def pending_rewards
    self.rewards.where(status: 'pending')
  end

  def unassigned_tasks
    Task.where(family_id: self.family.id, assigned_member_id: nil)
  end

end
