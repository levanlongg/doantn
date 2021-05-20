import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewsTypeComponent } from './news-type/news-type.component';
import { CategoryComponent } from './category/category.component';
import { MenuComponent } from './Share/menu/menu.component';
import { FooterComponent } from './Share/footer/footer.component';
import { HttpClientModule } from '@angular/common/http';
import { ModalModule } from 'ngx-bootstrap/modal';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgxPaginationModule } from 'ngx-pagination';
import { ContactComponent } from './contact/contact.component';
import { ProducerComponent } from './producer/producer.component';
import { ProductTypeComponent } from './product-type/product-type.component';
import { IntroductionComponent } from './introduction/introduction.component';
import { FileUploadModule } from 'primeng/fileupload';
import {AccordionModule} from 'primeng/accordion';     //accordion and accordion tab
import {BrowserModule} from '@angular/platform-browser';
import {UploadService} from '../Admin/lib/upload.service';
import { RolemasterComponent } from './rolemaster/rolemaster.component';
import { UserComponent } from './user/user.component';
import { ProductComponent } from './product/product.component';
import { AdNewsComponent } from './ad-news/ad-news.component';
import { LoginComponent } from './login/login.component';


@NgModule({
  declarations: [NewsTypeComponent, MenuComponent, FooterComponent,
    NewsTypeComponent,CategoryComponent, ContactComponent, ProducerComponent, ProductTypeComponent,
    IntroductionComponent, RolemasterComponent, UserComponent, 
    ProductComponent,AdNewsComponent, LoginComponent, 
  ],
  imports: [
    CommonModule,
    AccordionModule,
    FileUploadModule,
    HttpClientModule,
    ModalModule.forRoot(),
    FormsModule,
    ReactiveFormsModule,
    BrowserModule,
    BrowserAnimationsModule,
    NgxPaginationModule,
    ToastrModule.forRoot(),
    RouterModule.forChild([
      {
        path: 'category',
        component: CategoryComponent,
      },
      {
        path: 'news-type',
        component: NewsTypeComponent,
      },
      {
        path: 'contact',
        component: ContactComponent,
      },
      {
        path: 'producer',
        component: ProducerComponent,
      },
      {
        path: 'product-type',
        component: ProductTypeComponent,
      },
      {
        path: 'introduction',
        component: IntroductionComponent,
      },
      {
        path: 'role-master',
        component: RolemasterComponent,
      },
      {
        path: 'admin-user',
        component: UserComponent,
      },
      {
        path: 'product',
        component: ProductComponent,
      },
      {
        path: 'admin-news',
        component: AdNewsComponent,
      },
      {
        path: 'login',
        component: LoginComponent,
      },
  ]),
  ],
})
export class AdminModule { }


