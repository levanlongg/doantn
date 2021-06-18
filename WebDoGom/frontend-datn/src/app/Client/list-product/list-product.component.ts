import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { first, map, switchMap } from 'rxjs/operators';
import { ProductListService } from '../Client-service/product-list.service';
import { CartService } from '../Client-service/cart.service';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../Client-service/auth.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-list-product',
  templateUrl: './list-product.component.html',
  styleUrls: ['./list-product.component.css']
})
export class ListProductComponent implements OnInit {

  [x: string]: any;
  @ViewChild('Create', { static: false }) Create: ModalDirective;
 
  public product: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  p: number = 1;
  i: number;
  productl:any;
  spkhac = [];

  constructor(
    private productService: ProductListService,
    private toastr: ToastrService,
    private readonly cartService: CartService,
    private auth:AuthService
    
  ) { }
  ngOnInit(): void {

    this.loadDataProduct();
    this.loadsanphamkhac();
    
  }

  createImg(path) {
    return environment.urlImg + 'product/' + path;
  }  
  
  createSuccess() {
    this.toastr.success('Đã thêm sản phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
  }
  
  createSuccess1() {
    this.toastr.success('Đăng ký thành công', 'Thông báo!');
  }

  createEror1() {
    this.toastr.error('Đăng ký không thành công', 'Thông báo!');
  }

  loadDataProduct() {
    this.productService.getlistproduct().subscribe((res: any) => {
      this.product = res;
      console.log(this.product);
    });
  }

  loadsanphamkhac() {
    this.productService.getspkhac().subscribe((res: any) => {
      this.spkhac = res;
      console.log(this.spkhac);
    });
  }

  Search() {
    this.productService.Search(this.keyword).subscribe((res: any) => {
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

  //loc
  under500() {
    this.productService.under500().subscribe((res: any) => {
      this.product = res;
    });
  } 

  from500to1000() {
    this.productService.from500to1000().subscribe((res: any) => {
      this.product = res;
    });
  }

  from1000to1500() {
    this.productService.from1000to1500().subscribe((res: any) => {
      this.product = res;
    });
  }

  from1500to2000() {
    this.productService.from1500to2000().subscribe((res: any) => {
      this.product = res;
    });
  }

  from2000to2500() {
    this.productService.from2000to2500().subscribe((res: any) => {
      this.product = res;
    });
  }

  from2500to3500() {
    this.productService.from2500to3500().subscribe((res: any) => {
      this.product = res;
    });
  }

  from3500to4500() {
    this.productService.from3500to4500().subscribe((res: any) => {
      this.product = res;
    });
  }

  from4500to5500() {
    this.productService.from4500to5500().subscribe((res: any) => {
      this.product = res;
    });
  }

  over5500() {
    this.productService.over5500().subscribe((res: any) => {
      this.product = res;
    });
  }

  //loc loai san pham

  lsptranhgom() {
    this.productService.lsptranhgom().subscribe((res: any) => {
      this.product = res;
    });
  }

  lspgomtrangtri() {
    this.productService.lspgomtrangtri().subscribe((res: any) => {
      this.product = res;
    });
  } 

  lspgomphongthuy() {
    this.productService.lspgomphongthuy().subscribe((res: any) => {
      this.product = res;
    });
  }

  lspgomgiadung() {
    this.productService.lspgomgiadung().subscribe((res: any) => {
      this.product = res;
    });
  }

  lspgomquatang() {
    this.productService.lspgomquatang().subscribe((res: any) => {
      this.product = res;
    });
  }

  lsptuonggomsu() {
    this.productService.lsptuonggomsu().subscribe((res: any) => {
      this.product = res;
    });
  }

  lspdotho() {
    this.productService.lspdotho().subscribe((res: any) => {
      this.product = res;
    });
  }

  lspdoluuniem() {
    this.productService.lspdoluuniem().subscribe((res: any) => {
      this.product = res;
    });
  }
}
