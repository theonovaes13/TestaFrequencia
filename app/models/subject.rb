class Subject < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :students, join_table: :subscriptions
  # validate :professor_horario_ocupado, :on => [:create, :update]
  validate :testa_formato_semana, :on => [:create, :update]

  scope :sobresposto, ->(hora_inicio, hora_termino, id) do
    where(":hora_inicio BETWEEN hora_inicio AND hora_termino",
          hora_inicio: hora_inicio.change(year: 2000, day: 1, month: 1)).where("id != ?", id)
        .or(where(":hora_termino BETWEEN hora_inicio AND hora_termino",
                                     hora_termino: hora_termino.change(year: 2000, day: 1, month: 1))).where("id != ?", id)
          .or(where(":hora_inicio < hora_inicio", hora_inicio: hora_inicio.change(year: 2000, day: 1, month: 1))
                  .where(":hora_termino > hora_termino", hora_termino: hora_termino.change(year: 2000, day: 1, month: 1)).where("id != ?", id))
  end

  def professor_horario_ocupado
    if user.subjects.where("dias_semana = ?", dias_semana).sobresposto(hora_inicio, hora_termino, id).any?
      errors.add(:base, "Este professor já dá uma aula neste horário")
    end
  end

  def testa_formato_semana
    errors.add(:base, "Insira apenas no formato XXX - XXX") unless dias_semana.match(/\A[a-zA-Z]{3}\s-\s[a-zA-Z]{3}\Z/)
  end
end


