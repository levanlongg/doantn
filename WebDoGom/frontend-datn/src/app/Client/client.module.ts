import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ContentComponent } from './Share/content/content.component';
import { FooterComponent } from './Share/footer/footer.component';
import { HeaderComponent } from './Share/header/header.component';
import { LeftHomeComponent } from './Share/left-home/left-home.component';
import { NewsletterComponent } from './Share/newsletter/newsletter.component';
import { OtherProductComponent } from './Share/other-product/other-product.component';
import { RightHomeComponent } from './Share/right-home/right-home.component';
import { SlideHomeComponent } from './Share/slide-home/slide-home.component';



@NgModule({
  declarations: [HomeComponent, ContentComponent, FooterComponent, HeaderComponent, LeftHomeComponent, NewsletterComponent, OtherProductComponent, RightHomeComponent, SlideHomeComponent,
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
