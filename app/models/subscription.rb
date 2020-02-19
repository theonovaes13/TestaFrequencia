class Subscription < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  validate :subject_cap, :on => :create

  def subject_cap
    if subject.capacidade <= subject.students.length
      errors.add(:base, "Esta turma já alcançou sua capacidade máxima")
    end
  end
end
