import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { environment } from 'src/environments/environment';
import { ClientNewsService } from '../Client-service/client-news.service';

@Component({
  selector: 'app-knowledge-ceramics',
  templateUrl: './knowledge-ceramics.component.html',
  styleUrls: ['./knowledge-ceramics.component.css']
})
export class KnowledgeCeramicsComponent implements OnInit {

  [x: string]: any;
 
  public blog: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  p: number = 1;
  i: number;
  productl:any;
 
  constructor(
    private toastr: ToastrService,
    private listblog: ClientNewsService
    
  ) { }

  ngOnInit(): void {
    this.loadKnCeramics();
  }

  createImg(path) {
    return environment.urlImg + 'image/' + path;
  }
  
  loadKnCeramics() {
    this.listblog.getKnCeramicList().subscribe((res: any) => {
      this.blog = res;
      console.log(this.blog);
    });
  }

  Search() {
    this.listblog.Search(this.keyword).subscribe((res: any) => {
      this.product = res;
      console.log(this.product);
    }, error => {
      console.log(error);
    });
  }

  addToCart(product: any, quantity: any) {
    var pro = {
      id: product.id,
      image: product.image,
      name: product.name,
      price: product.sales_prices,
    };
    this.cartService.addToCart(pro, parseInt(quantity));
    this.createSuccess();
  }

  showCreate() {
    this.entity = {};
    this.checkedid = 0;
    this.Create.show();
  }

  SaveForm(values: any) {
    if (this.checkedid == 0) {
      this.auth.postItemUser(values).subscribe((res) => {
        if (res) {
          var result = confirm("Bạn muốn đăng ký?");
          if (result == true) {
            this.Create.hide();
            this.createSuccess1();
          }
          else {
            this.createEror1();
          }
        }
      });
    }
  }
}
