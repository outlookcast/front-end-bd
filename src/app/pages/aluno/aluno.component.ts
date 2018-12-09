import { Component, OnInit } from '@angular/core';
import { ServicesService } from 'src/app/services/services.service';

@Component({
  selector: 'app-aluno',
  templateUrl: './aluno.component.html',
  styleUrls: ['./aluno.component.css']
})
export class AlunoComponent implements OnInit {

  public alunos:any;

  constructor(private service: ServicesService) { }

  ngOnInit() {
    this.service.getTodosAlunos().subscribe(res =>{
      this.alunos = res;
      console.log("Alunos => ",this.alunos)
    })
  }

}
