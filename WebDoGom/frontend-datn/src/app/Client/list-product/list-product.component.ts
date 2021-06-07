import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { first, map, switchMap } from 'rxjs/operators';
import { ProductListService } from '../Client-service/product-list.service';
import { CartService } from '../Client-service/cart.service';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../Client-service/auth.service';

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

  constructor(
    private productService: ProductListService,
    private toastr: ToastrService,
    private readonly cartService: CartService,
    private auth:AuthService
    
  ) { }
  ngOnInit(): void {

    this.loadDataProduct();
    
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
}
