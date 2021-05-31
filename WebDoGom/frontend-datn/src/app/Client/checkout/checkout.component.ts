import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { first } from 'rxjs/operators';
import { CartService } from '../Client-service/cart.service'
import { CheckoutService } from '../Client-service/checkout.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  products: any[] = [];
  totalMoney: number;
  firstName: string = '';
  lastName: string = '';
  orderAddress: string = '';
  orderPhone: string = '';
  orderEmail: string = '';
  orderNote: string = '';
  constructor(
    private cartService: CartService,
    private checkoutService: CheckoutService,
    private router: Router,
    private toastr: ToastrService,
  ) {}

  createSuccess() {
    this.toastr.success('Đã thêm sản phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
  }
  createEror() {
    this.toastr.error('Chưa thêm sản phẩm vào giỏ hàng', 'Thông báo!', { timeOut: 2000 });
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

  ngOnInit(): void {
    this.cartService.products$.subscribe((res) => {
      this.products = res;
      this.totalMoney = 0;
      for (let p of this.products) {
        this.totalMoney += p.quantity * p.price;
      }
    });
  }

  deleteProduct(id: number): void {
    this.cartService.deleteProduct(id);
    this.deleteSuccess();
  }

  updateProduct(id: number, quantity: number): void {
    this.cartService.updateProduct(id, quantity);
    this.updateSuccess();
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
    else{
      this.clearError();
    }
  }

  checkout(): void {
    var order = {
      orderName: this.firstName + ' ' + this.lastName,
      orderAddress: this.orderAddress,
      orderEmail: this.orderEmail,
      orderPhone: this.orderPhone,
      orderNote: this.orderNote,
      totalMoney: this.totalMoney,
      orderDetails: JSON.stringify(this.products),
    };
    this.checkoutService
      .checkout(order)
      .pipe(first())
      .subscribe((res) => {
        //console.log(res);
        if (res > 0) {
          this.cartService.clearCart();
          this.createSuccess();
          setTimeout(() => {
            this.router.navigateByUrl('/home');
          }, 1000);
        }
      });
  }
}


