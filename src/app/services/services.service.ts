import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServicesService {

  private URL_API: string = "http://localhost:50000/api";

  constructor(private http: HttpClient) { }

  getTodosAlunos() {
    return this.http.get(this.URL_API + "/aluno");
  }

  criarAluno(id, matricula, nome, cpf, curso) {
    var aluno = {
      id: id,
      matricula: matricula,
      nome: nome,
      cpf: cpf,
      curso: curso
    }
    return this.http.post(this.URL_API + "/aluno", aluno);
  }

  getTodosProfessores() {
    return this.http.get(this.URL_API + "/professor");
  }

  getNomeDeTodosOsDepartamentos() {
    return this.http.get(this.URL_API + "/professor/departamento");
  }

  criarProfessor(id, nome, cpf, siape, departamento) {
    var professor = {
      id: id,
      nome: nome,
      cpf: cpf,
      siape: siape,
      departamento: departamento
    }
    return this.http.post(this.URL_API + "/professor", professor);
  }

  getTodasDisciplinasComTurmas(){
    return this.http.get(this.URL_API + "/disciplina");
  }
}
