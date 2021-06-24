import { Component, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';
import { ProductListService } from '../../Client-service/product-list.service';

@Component({
  selector: 'app-left-home',
  templateUrl: './left-home.component.html',
  styleUrls: ['./left-home.component.css']
})
export class LeftHomeComponent implements OnInit {
  [x: string]: any;

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
  ) { }

  ngOnInit(): void {
    this.loadsanphamkhac();
  }

  createImg(path) {
    return environment.urlImg + 'product/' + path;
  }  
  
  loadsanphamkhac() {
    this.productService.getspkhac().subscribe((res: any) => {
      this.spkhac = res;
      console.log(this.spkhac);
    });
  }
}
