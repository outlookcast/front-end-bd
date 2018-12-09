import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServicesService {

  private URL_API:string = "http://localhost:50000/api";

  constructor(private http: HttpClient) { }

  getTodosAlunos(){
    return this.http.get(this.URL_API + "/aluno");
  }
}
