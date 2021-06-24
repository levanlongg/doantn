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
export class OrderService {

  public urlAPI = environment.apiUrl + '/order';
  public urlAPIs = environment.apiUrl + '/search-order-admin';
  public urlAPI1 = environment.apiUrl + '/donmoi';
  public urlAPI2 = environment.apiUrl + '/dondonggoi';
  public urlAPI3 = environment.apiUrl + '/donvanchuyen';
  public urlAPI4 = environment.apiUrl + '/dondagiao';
  constructor(private _http: HttpClient) { }

  getOrder(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI).pipe(map(res => {
      return res;
    }));
  }

  getdonhangmoi(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
      return res;
    }));
  }

  getdondonggoi(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI2).pipe(map(res => {
      return res;
    }));
  }

  getdonvanchuyen(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI3).pipe(map(res => {
      return res;
    }));
  }

  getdondagiao(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI4).pipe(map(res => {
      return res;
    }));
  }
  
  GetSingleOrder(id: any): Observable<any> {
    return this._http.get<any>(this.urlAPI + "/" + id).pipe(map(res => {
      return res;
    }));
  }

  editOrder(id: string, data: any): Observable<any> {
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

