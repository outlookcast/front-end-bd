import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './pages/home/home.component';
import { ProfessorComponent } from './pages/professor/professor.component';
import { AlunoComponent } from './pages/aluno/aluno.component';
import { TurmasComponent } from './pages/turmas/turmas.component';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ProfessorComponent,
    AlunoComponent,
    TurmasComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
