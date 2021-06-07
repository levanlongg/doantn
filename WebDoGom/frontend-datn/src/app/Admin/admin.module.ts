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
import { DashboardComponent } from './dashboard/dashboard.component';
import { LoginGuard } from '../Client/_guards/login-guards';
import { AuthGuard } from '../Client/_guards/auth-guards.service';
import { JwtModule } from '@auth0/angular-jwt';
import { environment } from 'src/environments/environment';
import { OrderComponent } from './order/order.component';

export function tokenGetter() {
  let user = JSON.parse(localStorage.getItem("jwt"));

  return user ? user.token : null;
} 

@NgModule({
  declarations: [NewsTypeComponent, MenuComponent, FooterComponent,
    NewsTypeComponent,CategoryComponent, ContactComponent, ProducerComponent, ProductTypeComponent,
    IntroductionComponent, RolemasterComponent, UserComponent, 
    ProductComponent,AdNewsComponent, LoginComponent, DashboardComponent, OrderComponent, 
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
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        whitelistedDomains: [environment.domain],
        blacklistedRoutes: []
      }
    }),
    RouterModule.forChild([
      {
        path: 'login',
        canActivate: [LoginGuard],
        component: LoginComponent,
      },
      {
        path: 'dashboard',
        canActivate: [AuthGuard],
        component: DashboardComponent,
      },
      {
        path: 'category',
        canActivate: [AuthGuard],
        component: CategoryComponent,
      },
      {
        path: 'news-type',
        canActivate: [AuthGuard],
        component: NewsTypeComponent,
      },
      {
        path: 'contact',
        canActivate: [AuthGuard],
        component: ContactComponent,
      },
      {
        path: 'producer',
        canActivate: [AuthGuard],
        component: ProducerComponent,
      },
      {
        path: 'product-type',
        canActivate: [AuthGuard],
        component: ProductTypeComponent,
      },
      {
        path: 'introduction',
        canActivate: [AuthGuard],
        component: IntroductionComponent,
      },
      {
        path: 'role-master',
        canActivate: [AuthGuard],
        component: RolemasterComponent,
      },
      {
        path: 'admin-user',
        canActivate: [AuthGuard],
        component: UserComponent,
      },
      {
        path: 'product',
        canActivate: [AuthGuard],
        component: ProductComponent,
      },
      {
        path: 'admin-news',
        canActivate: [AuthGuard],
        component: AdNewsComponent,
      },
      {
        path: 'admin-order',
        canActivate: [AuthGuard],
        component: OrderComponent,
      },
  ]),
  ],
  providers: [AuthGuard],
})
export class AdminModule { }


