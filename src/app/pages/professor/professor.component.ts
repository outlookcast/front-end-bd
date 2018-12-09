import { Component, OnInit } from '@angular/core';
import { ServicesService } from 'src/app/services/services.service';

@Component({
  selector: 'app-professor',
  templateUrl: './professor.component.html',
  styleUrls: ['./professor.component.css']
})
export class ProfessorComponent implements OnInit {

  public professores: any;
  public departamentos: any;

  //Form
  private id_form;
  private cpf_form;
  private departamento_form;
  private siape_form;
  private nome_form;
  private dep_selected = 'Nenhum selecionado';
  constructor(private service: ServicesService) { }

  ngOnInit() {
    this.baixarDados();
  }

  baixarDados(){
    this.service.getTodosProfessores().subscribe(res =>{
      this.professores = res;
      console.log("Professores => ",this.professores)
    }, err =>{
      alert('Erro: ' + err.message);
    })
    this.service.getNomeDeTodosOsDepartamentos().subscribe(res => {
      this.departamentos = res;
    })
  }

  limparCampos(){
    this.id_form = "";
    this.cpf_form = "";
    this.siape_form = "";
    this.departamento_form = "";
    this.nome_form = "";
    this.dep_selected = 'Nenhum selecionado';
  }

  selecionarDep(dep){
    console.log('dep => ',dep)
    this.dep_selected = dep;
  }

  criar(){
    console.log(this.id_form, this.cpf_form, this.dep_selected, this.siape_form, this.nome_form);
    if(this.dep_selected == 'Nenhum selecionado' || this.dep_selected == ''){
      alert('Escolha um departamento!');
    }else{
      this.service.criarProfessor(this.id_form,this.nome_form,this.cpf_form,this.siape_form,this.dep_selected).subscribe(res => {
        if(res == true){
              alert("Sucesso ao criar!");
              this.baixarDados();
            }
            else{
              alert("Professor não criado!");
            }
            this.limparCampos();
      }, err => {
        alert('Erro: ' + err.message + 'Tente novamente!');
      })
    }
  }

}
