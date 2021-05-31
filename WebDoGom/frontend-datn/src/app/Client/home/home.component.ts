import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { CartService } from '../Client-service/cart.service';
import { HomeService } from '../Client-service/home.service'
import { ProductListService } from '../Client-service/product-list.service';
import { AuthService } from '../Client-service/auth.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  [x: string]: any;
  @ViewChild('Create', { static: false }) Create: ModalDirective;
 

  public items: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  pictureceramic: any[];
  fengshuiceramic = [];
  decorativeceramic = [];
  p: number = 1;
  i: number;

  constructor(
    private homeceramic: HomeService,
    private productService: ProductListService,
    private toastr: ToastrService,
    private readonly cartService: CartService,
    private activatedRoute: ActivatedRoute,
    private auth:AuthService
  ) { }
  ngOnInit(): void {

    this.loadDataPicture();
    this.loadDataFengShui();
    this.loadDataDecorative();
    this.loadDataHousehold();
  }

  createSuccess1() {
    this.toastr.success('Đăng ký thành công', 'Thông báo!');
  }

  createEror1() {
    this.toastr.error('Đăng ký không thành công', 'Thông báo!');
  }

  createSuccess() {
    this.toastr.success('Đã thêm sẩn phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
  }
  
 

  loadDataPicture() {
    this.homeceramic.get_picture_ceramic().subscribe((res: any) => {
      this.pictureceramic = res;
      console.log(this.pictureceramic);
    });
  }

  loadDataFengShui() {
    this.homeceramic.get_feng_shui_ceramic().subscribe((res: any) => {
      this.fengshuiceramic = res;
      console.log(this.fengshuiceramic);
    });
  }

  loadDataDecorative() {
    this.homeceramic.get_decorative_ceramic().subscribe((res: any) => {
      this.decorativeceramic = res;
      console.log(this.decorativeceramic);
    });
  }

  loadDataHousehold() {
    this.homeceramic.get_household_ceramic().subscribe((res: any) => {
      this.household = res;
      console.log(this.household);
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

