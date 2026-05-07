class Mission < ApplicationRecord
  belongs_to :agent

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[assigned in_progress completed] }

  def status=(value)
    allowed = %w[assigned in_progress completed]
    raise ArgumentError, "Invalid status: #{value}" unless allowed.include?(value.to_s)
    write_attribute(:status, value.to_s)
  end

  def status
    read_attribute(:status)&.to_s
  end
end
