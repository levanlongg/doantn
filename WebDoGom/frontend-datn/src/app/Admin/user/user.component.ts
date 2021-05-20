import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { UserService } from '../Ad-Service/user.service';
import { RolemasterService } from '../Ad-Service/rolemaster.service';


@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  [x: string]: any;

  @ViewChild('Create', { static: false }) Create: ModalDirective;
  @ViewChild('Update', { static: false }) Update: ModalDirective;



  public items: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  listrole = [];
  p: number = 1;
  i: number;

  constructor(
    private newstype: UserService,
    private toastr: ToastrService,
    private rolelist : RolemasterService
  ) { }
  ngOnInit(): void {
    this.loadData();

    this.rolelist.getListrole().subscribe((res: any) => {
      this.listrole = res;
    });
  }

  createSuccess() {
    this.toastr.success('Thêm thành công', 'Thông báo!');
  }
  createEror() {
    this.toastr.error('Chưa thêm quyền người dùng', 'Thông báo!');
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

  loadData() {
    this.newstype.getListUser().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }

  showCreate() {
    this.entity = {};
    this.checkedid = 0;
    this.Create.show();
  }

  showEdit(id: any) {
    this.checkedid = 1;
    this.newstype.GetSingleUser(id).subscribe((res) => {
      this.entity = res;
    });
    this.Update.show();
  }


  SaveForm(values: any) {
    if (this.checkedid == 0) {
      this.newstype.postItemUser(values).subscribe((res) => {
        if (res) {
          var result = confirm("Bạn muốn thêm người dùng?");
          if (result == true) {
            this.loadData();
            this.Create.hide();
            this.createSuccess();
          }
          else {
            this.createEror();
          }
        }
      });
    }
  }

  UpdateForm(values: any) {
    if (this.id = values.id) {
      this.newstype.editItemUser(this.id, values).subscribe((res) => {
        var result = confirm("Bạn muốn cập nhật người dùng?");
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
      this.newstype.delete(id).subscribe((res) => {
        this.loadData();
        this.deleteSuccess();
      });
    }
    else {
      this.deleteEror();
    }
  }

  Search() {
    this.newstype.Search(this.keyword).subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    }, error => {
      console.log(error);
    });
  }
}
