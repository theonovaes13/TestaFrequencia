class ChangeColumnMatriculaUniquenessTrue < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :matricula, :string, uniqueness: true)
  end
end
