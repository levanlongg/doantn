import { Component, Injector, OnInit } from '@angular/core';
import { ProductListService } from '../Client-service/product-list.service';
import { ActivatedRoute } from '@angular/router';
import { first, map, switchMap } from 'rxjs/operators';
import { ToastrService } from 'ngx-toastr';
import { CartService } from '../Client-service/cart.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css']
})
export class ProductDetailComponent implements OnInit {
  product: any; 

  constructor(
    private productService: ProductListService,
    private activatedRoute: ActivatedRoute,
    private toastr: ToastrService,
    private readonly cartService: CartService,
  ) { }
  ngOnInit(): void {
    this.activatedRoute.paramMap
      .pipe(
        map((params) => params.get('id')),
        switchMap((id) => this.productService.GetById(id).pipe(first()))
      )
      .subscribe((product) => (this.product = product));
  }

  createImg(path) {
    return environment.urlImg + 'product/' + path;
  }  
  
  createSuccess() {
    this.toastr.success('Đã thêm thành công', 'Thông báo!', { timeOut: 3000 });
  }
  createEror() {
    this.toastr.error('Chưa thêm vào giỏ hàng', 'Thông báo!', { timeOut: 3000 });
  }
  updateSuccess() {
    this.toastr.success('Cập nhật thành công', 'Thông báo!');
  }
  updateEror() {
    this.toastr.error('Cập nhật không thành công', 'Thông báo!');
  }
  deleteSuccess() {
    this.toastr.success('Xóa thành công', 'Thông báo!');
  }
  deleteEror() {
    this.toastr.error('Chưa xóa quyền người dùng', 'Thông báo!');
  }

  addToCart(product: any, quantity: any) {
    var pro = {
      id: product.id,
      image: product.image,
      name: product.name,
      price: product.sales_prices,
      // promotionPrice: product.promotionPrice,
    };
    this.cartService.addToCart(pro, parseInt(quantity));
    this.createSuccess();
  }
}
