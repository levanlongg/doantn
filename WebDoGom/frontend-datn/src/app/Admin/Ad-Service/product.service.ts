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
export class ProductService {

  public urlAPI = environment.apiUrl + '/product';
  public urlAPIs = environment.apiUrl + '/searchproduct';
  constructor(private _http: HttpClient) 
  { 
    this.getListProduct()
  }


  getListProduct(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI).pipe(map(res => {
      return res;
    }));
  }
  
  public postItemProduct(form)
  {
    return this._http.post(this.urlAPI, form);
  }
  
  GetSingleProduct(id: any): Observable<any> {
    return this._http.get<any>(this.urlAPI + "/" + id).pipe(map(res => {
      return res;
    }));
  }

  editItemProduct(id: string, data: any): Observable<any> {
    //debugger;
    return this._http.put<any>(this.urlAPI + "/" + id, data, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }

  delete(id: string): Observable<any> {
    //debugger;
    return this._http.delete<any>(this.urlAPI + "/" + id, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }

  Search(keyword: string): Observable<any[]> {
    return this._http.get<any>(this.urlAPIs + "/" + keyword, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }
}
