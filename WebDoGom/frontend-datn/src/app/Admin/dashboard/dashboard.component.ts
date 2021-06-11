import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { DashboardService } from '../Ad-Service/dashboard.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  public items: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  totalproduct = [];
  neworder = [];
  orderdg = [];
  ordervc = [];
  p: number = 1;
  i: number;
  constructor(
    private dashboard: DashboardService,
    private toastr: ToastrService
  ) { }

  ngOnInit(): void {
    this.total_revenue();
    this. total_product();
    this.total_new_order();
    this. total_order_dg();
    this.total_order_vc();
  }
  total_revenue() {
    this.dashboard.get_total_revenue().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  total_product() {
    this.dashboard.get_total_product().subscribe((res: any) => {
      this.totalproduct = res;
      console.log(this.totalproduct);
    });
  }

  total_new_order() {
    this.dashboard.get_new_order().subscribe((res: any) => {
      this.neworder = res;
      console.log(this.neworder);
    });
  }
  total_order_dg() {
    this.dashboard.get_order_dg().subscribe((res: any) => {
      this.orderdg = res;
      console.log(this.orderdg);
    });
  }
  total_order_vc() {
    this.dashboard.get_order_vc().subscribe((res: any) => {
      this.ordervc = res;
      console.log(this.ordervc);
    });
  }
}
