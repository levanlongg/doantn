import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { RouterModule } from '@angular/router';
import { HeaderComponent } from './Share/header/header.component';
import { FooterComponent } from './Share/footer/footer.component';
import { SlideHomeComponent } from './Share/slide-home/slide-home.component';
import { LeftHomeComponent } from './Share/left-home/left-home.component';
import { ContentComponent } from './Share/content/content.component';
import { OtherProductComponent } from './Share/other-product/other-product.component';
import { NewsletterComponent } from './Share/newsletter/newsletter.component';
import { ServicesComponent } from './services/services.component';
import { IntroductionComponent } from './introduction/introduction.component';
import { KnowledgeCeramicsComponent } from './knowledge-ceramics/knowledge-ceramics.component';
import { BlogComponent } from './blog/blog.component';
import { ContactComponent } from './contact/contact.component';
import { ListProductComponent } from './list-product/list-product.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { CheckoutComponent } from './checkout/checkout.component';
import { PaymentComponent } from './payment/payment.component';
import { RightHomeComponent } from './Share/right-home/right-home.component';
import { PaymentAtmComponent } from './payment-atm/payment-atm.component';
import { PaymentCreditComponent } from './payment-credit/payment-credit.component';
import { PaymentPaypalComponent } from './payment-paypal/payment-paypal.component';



@NgModule({
  declarations: [
    HomeComponent,
    HeaderComponent,
    FooterComponent,
    SlideHomeComponent,
    LeftHomeComponent,
    ContentComponent,
    OtherProductComponent,
    NewsletterComponent,
    ServicesComponent,
    IntroductionComponent,
    KnowledgeCeramicsComponent,
    BlogComponent,
    ContactComponent,
    ListProductComponent,
    ProductDetailComponent,
    CheckoutComponent,
    PaymentComponent,
    RightHomeComponent,
    PaymentAtmComponent,
    PaymentCreditComponent,
    PaymentPaypalComponent
  ],
  imports: [
    CommonModule,
    
    RouterModule.forChild([
      {
        path: 'home',
        component: HomeComponent,
      },
      {
        path: 'Client-service',
        component: ServicesComponent,
      },
      {
        path: 'Client-introduction',
        component: IntroductionComponent,
      },
      {
        path: 'Knowledge-ceramics',
        component: KnowledgeCeramicsComponent,
      },
      {
        path: 'Blog',
        component: BlogComponent,
      },
      {
        path: 'Client-contact',
        component: ContactComponent,
      },
      {
        path: 'List-product',
        component: ListProductComponent,
      },
      {
        path: 'product-single',
        component: ProductDetailComponent,
      },
      {
        path: 'checkout',
        component: CheckoutComponent,
      },
      {
        path: 'payment',
        component: PaymentComponent,
      },
      {
        path: 'payment-atm',
        component: PaymentAtmComponent,
      },
      {
        path: 'payment-credit',
        component: PaymentCreditComponent,
      },
      {
        path: 'payment-paypal',
        component: PaymentPaypalComponent,
      },
  ]),
  ]
})
export class ClientModule { }
