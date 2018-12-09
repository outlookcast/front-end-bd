import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { ProfessorComponent } from './pages/professor/professor.component';
import { AlunoComponent } from './pages/aluno/aluno.component';
import { TurmasComponent } from './pages/turmas/turmas.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'professor', component: ProfessorComponent },
  { path: 'aluno', component: AlunoComponent },
  { path: 'turmas', component: TurmasComponent }
];

@NgModule({
  exports: [ RouterModule ],
  imports: [ RouterModule.forRoot(routes) ]
})
export class AppRoutingModule {}