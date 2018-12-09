import { Component, OnInit } from '@angular/core';
import { ServicesService } from 'src/app/services/services.service';

@Component({
  selector: 'app-aluno',
  templateUrl: './aluno.component.html',
  styleUrls: ['./aluno.component.css']
})
export class AlunoComponent implements OnInit {

  public alunos:any;

  //Form
  private id_form;
  private cpf_form;
  private curso_form;
  private matricula_form;
  private nome_form;

  constructor(private service: ServicesService) { }

  ngOnInit() {
    this.baixarDados();
  }

  baixarDados(){
    this.service.getTodosAlunos().subscribe(res =>{
      this.alunos = res;
      console.log("Alunos => ",this.alunos)
    }, err =>{
      alert('Erro: ' + err.message);
    })
  }

  limparCampos(){
    this.id_form = "";
    this.cpf_form = "";
    this.curso_form = "";
    this.matricula_form = "";
    this.nome_form = "";
  }

  criar(){
    console.log(this.id_form, this.cpf_form, this.curso_form, this.matricula_form, this.nome_form);
    this.service.criarAluno(this.id_form,this.matricula_form,this.nome_form,this.cpf_form,this.curso_form).subscribe(res =>{
      if(res == true){
        alert("Sucesso ao criar!");
        this.baixarDados();
      }
      else{
        alert("Usuário não criado!");
      }
      this.limparCampos();
    }, err=> {
      alert('Erro: ' + err.message + 'Tente novamente!');
    })
  }

}
