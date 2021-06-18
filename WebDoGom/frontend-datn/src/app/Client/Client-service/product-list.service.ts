import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

const HttpOptionss = {
  headers: new HttpHeaders({ "Content-Type": "application/json" })
}
@Injectable({
  providedIn: 'root'
})
export class ProductListService {

  public urlAPIs = environment.apiUrl + '/search-pro-client';
  public urlAPI1 = environment.apiUrl + '/danh-sach-san-pham';
  public urlAPI2 = environment.apiUrl + '/chi-tiet-san-pham';
  //api loc khoang gia
  public urlAPI3 = environment.apiUrl + '/under500';
  public urlAPI4 = environment.apiUrl + '/from500to1000';
  public urlAPI5 = environment.apiUrl + '/from1000to1500';
  public urlAPI6 = environment.apiUrl + '/from1500to2000';
  public urlAPI7 = environment.apiUrl + '/from2000to2500';
  public urlAPI8 = environment.apiUrl + '/from2500to3500';
  public urlAPI9 = environment.apiUrl + '/from3500to4500';
  public urlAPI10 = environment.apiUrl + '/from4500to5500';
  public urlAPI11 = environment.apiUrl + '/over5500';
  //api hien thi theo laoi san pham
  public urlAPI12 = environment.apiUrl + '/lsptranhgom';
  public urlAPI13 = environment.apiUrl + '/lspgomtrangtri';
  public urlAPI14 = environment.apiUrl + '/lspgomphongthuy';
  public urlAPI15 = environment.apiUrl + '/lspgomgiadung';
  public urlAPI16 = environment.apiUrl + '/lspgomquatang';
  public urlAPI17 = environment.apiUrl + '/lsptuonggomsu';
  public urlAPI18 = environment.apiUrl + '/lspdotho';
  public urlAPI19 = environment.apiUrl + '/lspdoluuniem';
  public urlAPI20 = environment.apiUrl + '/sanphamkhac';
  
  constructor(private readonly _http: HttpClient) { }

  getlistproduct(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
      return res;
    }));
  }

  getspkhac(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI20).pipe(map(res => {
      return res;
    }));
  }
  
  GetById(id: string) {
    const url = `${this.urlAPI2}/${id}`;
    return this._http.get(url);
  }

  Search(keyword: string): Observable<any[]> {
    return this._http.get<any>(this.urlAPIs + "/" + keyword, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }

  //loc loai san pham
  lsptranhgom(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI12).pipe(map(res => {
      return res;
    }));
  }

  lspgomtrangtri(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI13).pipe(map(res => {
      return res;
    }));
  }

  lspgomphongthuy(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI14).pipe(map(res => {
      return res;
    }));
  }

  lspgomgiadung(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI15).pipe(map(res => {
      return res;
    }));
  }

  lspgomquatang(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI16).pipe(map(res => {
      return res;
    }));
  }

  lsptuonggomsu(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI17).pipe(map(res => {
      return res;
    }));
  }

  lspdotho(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI18).pipe(map(res => {
      return res;
    }));
  }

  lspdoluuniem(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI19).pipe(map(res => {
      return res;
    }));
  }
  //loc khoang gia
  under500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI3).pipe(map(res => {
      return res;
    }));
  }

  from500to1000(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI4).pipe(map(res => {
      return res;
    }));
  }
   
  from1000to1500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI5).pipe(map(res => {
      return res;
    }));
  }

  from1500to2000(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI6).pipe(map(res => {
      return res;
    }));
  }

  from2000to2500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI7).pipe(map(res => {
      return res;
    }));
  }

  from2500to3500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI8).pipe(map(res => {
      return res;
    }));
  }

  from3500to4500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI9).pipe(map(res => {
      return res;
    }));
  }

  from4500to5500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI10).pipe(map(res => {
      return res;
    }));
  }

  over5500(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI11).pipe(map(res => {
      return res;
    }));
  }
}

