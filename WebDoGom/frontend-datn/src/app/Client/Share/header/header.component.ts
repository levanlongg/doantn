import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../../Client-service/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
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
    private toastr: ToastrService,
    private auth:AuthService
  ) { }

  ngOnInit(): void {
  }

  createSuccess1() {
    this.toastr.success('Đăng ký thành công', 'Thông báo!');
  }

  createEror1() {
    this.toastr.error('Đăng ký không thành công', 'Thông báo!');
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
