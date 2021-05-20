import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { NotFoundComponent } from './not-found/not-found.component';
import { AdminModule } from './Admin/admin.module';
import { ClientModule } from './Client/client.module'
import { AppComponent } from './app.component';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { BsModalService, ModalModule } from 'ngx-bootstrap/modal';
import { FileUploadModule } from 'primeng/fileupload';


// import { FormsModule } from '@angular/forms';
// import { ModalModule } from 'ngx-bootstrap/modal';

const routes: Routes = [
  {
    path: '',
    redirectTo: '/home',
    pathMatch: 'full',
  },
  {
    path: '',
    loadChildren: () => import('./Client/client.module').then((m) => m.ClientModule),
  },
  {
    path: '',
    loadChildren: () => import('./Admin/admin.module').then((m) => m.AdminModule),
  },
  { path: '**', component: NotFoundComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    NotFoundComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    AdminModule,
    ClientModule,
    HttpClientModule,
    FileUploadModule,
    RouterModule.forChild(routes),
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
