import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { RouterModule } from '@angular/router';
import { HeaderComponent } from './Share/header/header.component';
import { FooterComponent } from './Share/footer/footer.component';



@NgModule({
  declarations: [
    HomeComponent,
    HeaderComponent,
    FooterComponent
  ],
  imports: [
    CommonModule,
    RouterModule.forChild([
      {
        path: 'home',
        component: HomeComponent,
      },
  ]),
  ]
})
export class ClientModule { }
