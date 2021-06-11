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
export class DashboardService {
  public urlAPI = environment.apiUrl + '/total-revenue';
  public urlAPI1 = environment.apiUrl + '/total-new-order';
  public urlAPI2 = environment.apiUrl + '/total-product';
  public urlAPI3 = environment.apiUrl + '/static-mounth';
  public urlAPI4 = environment.apiUrl + '/static-year';
  public urlAPI5 = environment.apiUrl + '/total-order-dg';
  public urlAPI6 = environment.apiUrl + '/total-order-vc';

  constructor(private _http: HttpClient) { }

  get_total_revenue(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI).pipe(map(res => {
      return res;
    }));
  }
  get_new_order(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
      return res;
    }));
  }
  get_total_product(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI2).pipe(map(res => {
      return res;
    }));
  }
  get_static_mounth(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI3).pipe(map(res => {
      return res;
    }));
  }
  get_static_year(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI4).pipe(map(res => {
      return res;
    }));
  }
  get_order_dg(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI5).pipe(map(res => {
      return res;
    }));
  }
  get_order_vc(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI6).pipe(map(res => {
      return res;
    }));
  }
}
