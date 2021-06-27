import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { first } from 'rxjs/operators';
import { CartService } from '../Client-service/cart.service'
import { CheckoutService } from '../Client-service/checkout.service';
import { IPayPalConfig, ICreateOrderRequest } from 'ngx-paypal';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import Swal from 'sweetalert2';
declare var paypal;
@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {
  @ViewChild('paypal', { static: true }) paypalElement: ElementRef;

  public payPalConfig?: IPayPalConfig;
  products: any[] = [];
  totalMoney: number;
  public checkedid: any;
  public entity: any;
  customer_id: string = '';
  order_name: string = '';
  order_address: string = '';
  order_email: string = '';
  order_phone: string = '';
  order_note: string = '';
  payment_status: string = '';
  constructor(
    private cartService: CartService,
    private checkoutService: CheckoutService,
    private router: Router,
    private toastr: ToastrService,
    private http: HttpClient
  ) { }

  createSuccess() {
    this.toastr.success('Đã thêm sản phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
  }
  createEror() {
    this.toastr.error('Chưa thêm sản phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
  }
  createSuccess1() {
    this.toastr.success('Đặt hàng thành công', 'Thông báo!', { timeOut: 2000 });
  }
  createEror1() {
    this.toastr.error('Đặt hàng không thành công , bạn cần đăng ký tài khoản', 'Thông báo!', { timeOut: 2000 });
  }
  updateSuccess() {
    this.toastr.success('Đã cập nhật số lượng sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  updateEror() {
    this.toastr.error('Chưa cập nhật số lượng sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  deleteSuccess() {
    this.toastr.success('Đã xóa sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  deleteEror() {
    this.toastr.error('Chưa xóa sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  clearSuccess() {
    this.toastr.success('Đã xóa sạch sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  clearError() {
    this.toastr.success('Xóa sạch sản phẩm trong giỏ hàng', 'Thông báo!');
  }
  paypal() {
    this.toastr.success('Thanh toán thành công', 'Thông báo!');
  }

  ngOnInit(): void {
    this.cartService.products$.subscribe((res) => {
      this.products = res;
      this.totalMoney = 0;
      for (let p of this.products) {
        this.totalMoney += p.quantity * p.price;
      }
    });

    // this.initConfig();
  }

  product = {
    price: 777.77,
    description: 'used couch, decent condition',
    img: 'assets/couch.jpg'
  };
  paidFor = false;

  deleteProduct(id: number): void {
    this.cartService.deleteProduct(id);
    this.deleteSuccess();
  }

  updateProduct(id: number, quantity: number): void {
    this.cartService.updateProduct(id, quantity);
    this.updateSuccess();
  }

  createImg(path) {
    return environment.urlImg + 'product/' + path;
  }

  clearCart(): void {
    var result = confirm("Bạn muốn xóa bản ghi này?");
    if (result == true) {
      this.cartService.clearCart();
      this.clearCart();
      setTimeout(() => {
        this.router.navigateByUrl('/home');
      }, 1000);
    }
    else {
      this.clearError();
    }
  }

  checkout() {
    var order = {
      customer_id: this.customer_id,
      order_name: this.order_name,
      order_address: this.order_address,
      order_phone: this.order_phone,
      order_email: this.order_email,
      order_note: this.order_note,
      payment_status: this.payment_status,
      totalMoney: this.totalMoney,
      // orderDetails: this.products,
      // orderDetails: JSON.stringify(this.products),
    };
    this.checkedid = 0;
    if (this.checkedid == 0) {
      this.checkoutService.checkout(order).subscribe((res) => {
        // console.log(order);
        if (res) {
          var result = confirm("Bạn muốn đặt hàng?");
          if (result == true) {
            this.cartService.clearCart();
            this.createSuccess1();
            Swal.fire({
                  title: 'Thông báo!',
                  text: res['message'],
                  icon: 'success'
                });
            // this.checkoutService.sendemail().subscribe(data => {
            //   Swal.fire({
            //     title: 'Thông báo!',
            //     text: data['message'],
            //     icon: 'success'
            //   });
            // })
          }
          else {
            this.createEror1();
          }
          // setTimeout(() => {
          //   this.router.navigateByUrl('/home');
          // }, 1000);
        }
      });
    }
  }
}


