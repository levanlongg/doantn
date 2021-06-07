import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CheckoutService } from '../Client-service/checkout.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  
  [x: string]: any;
  public checkedid: any;
  public entity: any;

  constructor(
    private checkoutService: CheckoutService,
    private router: Router,
    private toastr: ToastrService,
    ) { }

  ngOnInit(): void {
  }
  createSuccess() {
    this.toastr.success('Đã gửi thông tin', 'Thông báo!', { timeOut: 2000 });
  }
  createEror() {
    this.toastr.error('Chưa gửi thông tin', 'Thông báo!', { timeOut: 2000 });
  }

  contact() {
    var contact = {
      subject: this.subject,
      message: this.message,
      email: this.email,
      message1: this.message1,
      create_by: this.create_by,
    };
    this.checkedid = 0;
    if (this.checkedid == 0) {
      this.checkoutService.contact(contact).subscribe((res) => {
        if (res) {
          var result = confirm("Bạn muốn gửi thông tin liên hệ?");
          if (result == true) {
            this.createSuccess();
          }
          else {
            this.createEror();
          }
        }
      });
    }
  }
}
