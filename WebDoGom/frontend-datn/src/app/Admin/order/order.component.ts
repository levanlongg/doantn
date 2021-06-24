import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { OrderService } from '../Ad-Service/order.service';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  [x: string]: any;
  @ViewChild('Update', { static: false }) Update: ModalDirective;
  @ViewChild('View', { static: false }) View: ModalDirective;

  public items: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  listnewstype = [];
  p: number = 1;
  i: number;
  constructor(
    private OrderService: OrderService,
    private toastr: ToastrService
  ) { }

  ngOnInit(): void {
    this.loadData();
  }
  
  updateSuccess() {
    this.toastr.success('Cập nhật thành công', 'Thông báo!', { timeOut: 2000 });
  }
  updateEror() {
    this.toastr.error('Cập nhật không thành công', 'Thông báo!', { timeOut: 2000 });
  }
  deleteSuccess() {
    this.toastr.success('Xóa thành công', 'Thông báo!', { timeOut: 2000 });
  }
  deleteEror() {
    this.toastr.error('Chưa xóa loại tin tức', 'Thông báo!', { timeOut: 2000 });
  }

  loadData() {
    this.OrderService.getOrder().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  loadDatadhm() {
    this.OrderService.getdonhangmoi().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  loadDatadhdg() {
    this.OrderService.getdondonggoi().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  loadDatadhdvc() {
    this.OrderService.getdonvanchuyen().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  loadDatadhtt() {
    this.OrderService.getdondagiao().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  showEdit(id: any) {
    this.checkedid = 1;
    this.OrderService.GetSingleOrder(id).subscribe((res) => {
      this.entity = res;
    });
    this.Update.show();
  }

  showView(id: any) {
    this.checkedid = 1;
    this.OrderService.GetSingleOrder(id).subscribe((res) => {
      this.entity = res;
    });
    this.View.show();
  }

  UpdateForm(values: any) {
    if (this.id = values.id) {
      this.OrderService.editOrder(this.id, values).subscribe((res) => {
        var result = confirm("Bạn muốn cập nhật đơn hàng?");
        if (result == true) {
          this.loadData();
          this.Update.hide();
          this.updateSuccess();
        }
        else {
          this.updateEror();
        }
      });
    }
  }

  delete(id: string) {
    var result = confirm("Bạn muốn xóa bản ghi này?");
    if (result == true) {
      this.OrderService.delete(id).subscribe((res) => {
        this.loadData();
        this.deleteSuccess();
      });
    }
    else {
      this.deleteEror();
    }
  }

  Search() {
    this.OrderService.Search(this.keyword).subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    }, error => {
      console.log(error);
    });
  }
}



