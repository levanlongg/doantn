import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { ProductService } from '../Ad-Service/product.service';
import { ProductTypeService } from '../Ad-Service/product-type.service';
import { ProducerService } from '../Ad-Service/producer.service';
import { environment } from 'src/environments/environment';
declare var $
declare var toastr;
declare var Toast;
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  [x: string]: any;

  @ViewChild('Create', { static: false }) Create: ModalDirective;
  @ViewChild('Update', { static: false }) Update: ModalDirective;
  @ViewChild('View', { static: false }) View: ModalDirective;
  @ViewChild('closebutton') closebutton;

  fileUpload: ElementRef; files = [];
  public items: any[];
  public entity: any;
  public id: string;
  public checkedid: any;
  public keyword: string;
  listproducer = [];
  listproducttype = [];
  p: number = 1;
  i: number;
  file: any;

  constructor(
    private newstype: ProductService,
    private toastr: ToastrService,
    private producer : ProducerService,
    private producttype : ProductTypeService,
  ) { }
  selectedImage: File = null;

  createImg(path) {
    return environment.urlImg + 'product/' + path;
  }

  onSelect(event) {
    var tmppath = URL.createObjectURL(event.target.files[0]);
    $("#AddEmpImage").fadeIn("fast").attr("src", tmppath);
    this.selectedImage = <File>event.target.files[0];
  }

  add() {
    const fd = new FormData();
    fd.append('image', this.selectedImage);
    fd.append('name', $("#name").val());
    fd.append('size', $("#size").val());
    fd.append('origin', $("#origin").val());
    fd.append('material', $("#material").val());
    fd.append('note', $("#note").val());
    fd.append('import_prices', $("#import_prices").val());
    fd.append('shipment_number', $("#shipment_number").val());
    fd.append('introduction', $("#introduction").val());
    fd.append('status', $("#status").val());
    fd.append('amountsp', $("#amountsp").val());
    fd.append('product_type_id', $("#product_type_id").val());
    fd.append('producer_id', $("#producer_id").val());
    fd.append('sales_prices', $("#sales_prices").val());
    fd.append('show_home', $("#show_home").val());
    this.newstype.postItemProduct(fd).subscribe(
      res => {
        if (res) {
          var result = confirm("Bạn muốn thêm sản phẩm?");
          if (result == true) {
            this.loadData();
            this.createSuccess();
            this.closebutton.nativeElement.click();
          }
          else {
            this.createEror();
            this.closebutton.nativeElement.click();
          }
        }
      },
    )
  }
  
  ngOnInit(): void {

    this.loadData();

    this.producer.getListProducer().subscribe((res: any) => {
      this.listproducer = res;
    });

    this.producttype.getListproductype().subscribe((res: any) => {
      this.listproducttype = res;
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
    this.newstype.getListProduct().subscribe((res: any) => {
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
    this.newstype.GetSingleProduct(id).subscribe((res) => {
      this.entity = res;
    });
    this.Update.show();
  }

  showView(id: any) {
    this.checkedid = 1;
    this.newstype.GetSingleProduct(id).subscribe((res) => {
      this.entity = res;
    });
    this.View.show();
  }

  // SaveForm(values: any) {
  //   if (this.checkedid == 0) {
  //     this.newstype.postItemProduct(values).subscribe((res) => {
  //       if (res) {
  //         var result = confirm("Bạn muốn thêm san pham?");
  //         if (result == true) {
  //           this.loadData();
  //           this.Create.hide();
  //           this.createSuccess();
  //         }
  //         else {
  //            this.createEror();
  //         }
  //       }
  //     });
  //   }
  // }

  UpdateForm(values: any) {
    if (this.id = values.id) {
      this.newstype.editItemProduct(this.id, values).subscribe((res) => {
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
