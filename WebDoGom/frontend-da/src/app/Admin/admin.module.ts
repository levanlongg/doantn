import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MenuComponent } from './Share/menu/menu.component';
import { FooterComponent } from './Share/footer/footer.component';
import { ProductComponent } from './product/product.component';
import { BillImportComponent } from './bill-import/bill-import.component';
import { CategoryComponent } from './category/category.component';
import { ContactComponent } from './contact/contact.component';
import { CustomerComponent } from './customer/customer.component';
import { IntroductionComponent } from './introduction/introduction.component';
import { NewsComponent } from './news/news.component';
import { NewsTypeComponent } from './news-type/news-type.component';
import { OrderComponent } from './order/order.component';
import { ProducerComponent } from './producer/producer.component';
import { ProductTypeComponent } from './product-type/product-type.component';
import { RoleMasterComponent } from './role-master/role-master.component';
import { ServicesComponent } from './services/services.component';
import { SlideComponent } from './slide/slide.component';
import { UsersComponent } from './users/users.component';
import { LoginComponent } from './login/login.component';
import { ProfileComponent } from './profile/profile.component';
import { ChangePasswordComponent } from './change-password/change-password.component';




@NgModule({
  declarations: [
    DashboardComponent,
    MenuComponent,
    FooterComponent,
    ProductComponent,
    BillImportComponent,
    CategoryComponent,
    ContactComponent,
    CustomerComponent,
    IntroductionComponent,
    NewsComponent,
    NewsTypeComponent,
    OrderComponent,
    ProducerComponent,
    ProductTypeComponent,
    RoleMasterComponent,
    ServicesComponent,
    SlideComponent,
    UsersComponent,
    LoginComponent,
    ProfileComponent,
    ChangePasswordComponent,
  ],
  imports: [
    CommonModule,
    RouterModule.forChild([
      {
        path: 'dashboard',
        component: DashboardComponent,
      },
      {
        path: 'product',
        component: ProductComponent,
      },
      {
        path: 'bill-import',
        component: BillImportComponent,
      },
      {
        path: 'category',
        component: CategoryComponent,
      },
      {
        path: 'contact',
        component: ContactComponent,
      },
      {
        path: 'customer',
        component: CustomerComponent,
      },
      {
        path: 'introduction',
        component: IntroductionComponent,
      },
      {
        path: 'news',
        component: NewsComponent,
      },
      {
        path: 'news-type',
        component: NewsTypeComponent,
      },
      {
        path: 'order',
        component: OrderComponent,
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
        path: 'services',
        component: ServicesComponent,
      },
      {
        path: 'role-master',
        component: RoleMasterComponent,
      },
      {
        path: 'slide',
        component: SlideComponent,
      },
      {
        path: 'user',
        component: UsersComponent,
      },
      {
        path: 'login',
        component: LoginComponent,
      },
      {
        path: 'profile',
        component: ProfileComponent,
      },
  ]),
  ]
})
export class AdminModule { }
