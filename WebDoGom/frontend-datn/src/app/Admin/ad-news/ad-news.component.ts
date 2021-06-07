import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { NewsTypeService } from '../Ad-Service/news-type.service';
import { NewsService } from '../Ad-Service/news.service';

@Component({
  selector: 'app-ad-news',
  templateUrl: './ad-news.component.html',
  styleUrls: ['./ad-news.component.css']
})
export class AdNewsComponent implements OnInit {

  [x: string]: any;
  @ViewChild('Create', { static: false }) Create: ModalDirective;
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
    private newslist: NewsService,
    private newstype: NewsTypeService,
    private toastr: ToastrService
  ) { }
  ngOnInit(): void {

    this.loadData();

    this.newstype.getListnewtype().subscribe((res: any) => {
      this.listnewstype = res;
      
    });
  }
  createSuccess() {
    this.toastr.success('Thêm thành công', 'Thông báo!', { timeOut: 2000 });
  }
  createEror() {
    this.toastr.error('Chưa thêm loại tin', 'Thông báo!', { timeOut: 2000 });
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
    this.newslist.getListNews().subscribe((res: any) => {
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
    this.newslist.GetSingleNews(id).subscribe((res) => {
      this.entity = res;
    });
    this.Update.show();
  }

  showView(id: any) {
    this.checkedid = 1;
    this.newslist.GetSingleNews(id).subscribe((res) => {
      this.entity = res;
    });
    this.View.show();
  }

  SaveForm(values: any) {
    if (this.checkedid == 0) {
      this.newslist.postNews(values).subscribe((res) => {
        if (res) {
          var result = confirm("Bạn muốn thêm loại tin?");
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
      this.newslist.editItemNews(this.id, values).subscribe((res) => {
        var result = confirm("Bạn muốn cập nhật loại tin?");
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
      this.newslist.delete(id).subscribe((res) => {
        this.loadData();
        this.deleteSuccess();
      });
    }
    else {
      this.deleteEror();
    }
  }

  Search() {
    this.newslist.Search(this.keyword).subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    }, error => {
      console.log(error);
    });
  }
}
