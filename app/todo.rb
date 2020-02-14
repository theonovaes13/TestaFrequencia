=begin

 1: O sistema deve permitir o cadastro de usuários. - P1
 2: Os usuários poderão ter os determinados papéis: Administrador, Secretaria, Professor. - P1
 3: Um usuário só pode ter um papel. - P1
 4: Um usuário deve possuir nome, matricula, email. Sendo o nome e matricula únicos e o email, um email válido. - P2
5: Um usuário deve autenticar-se no sistema utilizando matricula e senha. O email será utilizado para recuperação de senha. - P3
6: Qualquer usuário pode alterar seu próprio email. - P4
 7: Apenas usuários administradores podem cadastrar ou atualizar usuários com papel administrador ou secretaria. - P4
 8: Usuário com papel administrador pode ler todos os usuários. - P4
 9: Usuário com papel secretaria pode cadastrar, atualizar ou ler usuários com papel professor. - P4
##### Aluno #####
10: O sistema deve permitir o gerenciamento de alunos do curso. - P2
TODO 11: Um aluno deve possuir nome, matrícula e email. O nome e a matrícula devem ser únicos. O email deve ser válido. - P2
##### Turma #####
TODO 12: Uma turma deve ter nome, dias de semana, horário de início, horário de término, carga horária mínima, carga horária máxima e capacidade. Deve estar associada a 1 professor e a n alunos. O número de alunos não deve ser maior que a capacidade da turma. - P3
TODO 13: Uma turma deve ser gerenciada por usuários com papel secretaria. - P4
##### Professor #####
TODO 14: Um professor deve estar associado a uma ou mais turmas. Um professor não pode estar associado a duas ou mais turmas com sobrepossição de horário. - P4
TODO 15: LIMITAR NUMERO DE ALUNOS NUMA TURMA DE ACORDO COM A CAPACIDADE DESTA (primeiro fazer escopo que conte quantos alunos estao escritos em turma X, depois comparar esse .count com o campo de CAPACIDADE da matéria)
TODO 16: OS ALUNOS DEVEM POSSUIR NOME E MATRICULA UNICOS

=end
