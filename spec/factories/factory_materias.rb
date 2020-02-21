FactoryBot.define do
  factory :subject do
    sequence(:nome) { |v| "Miçanga #{v}"}
    capacidade {1}
    dias_semana {["ter - qui", "seg - qua"].sample}
    hora_inicio {[Time.new(2000, 1, 1, 14, 30, 0).strftime("%H:%M"),Time.new(2000, 1, 1, 15, 30, 0).strftime("%H:%M")].sample}
    hora_termino {[Time.new(2000, 1, 1, 16, 30, 0).strftime("%H:%M"),Time.new(2000, 1, 1, 18, 30, 0).strftime("%H:%M")].sample}
    transient do
      usuario {
        create :user, :professor
      }
    end

    before(:create) do |subject|
      subject.user_id = evaluator.usuario.id
    end
  end
end
