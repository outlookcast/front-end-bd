import { Component, OnInit } from '@angular/core';
import { ServicesService } from 'src/app/services/services.service';

@Component({
  selector: 'app-turmas',
  templateUrl: './turmas.component.html',
  styleUrls: ['./turmas.component.css']
})
export class TurmasComponent implements OnInit {

  public turmas: any;

  constructor(private service: ServicesService) { }

  ngOnInit() {
    this.getTodasDisciplinasComTurmas();
  }

  getTodasDisciplinasComTurmas(){
    this.service.getTodasDisciplinasComTurmas().subscribe(res => {
      this.turmas = res;
      console.log("Turmas => ",this.turmas)
    });
  }

}
