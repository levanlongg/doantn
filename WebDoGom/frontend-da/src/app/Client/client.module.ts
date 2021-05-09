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
    ContactComponent
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
