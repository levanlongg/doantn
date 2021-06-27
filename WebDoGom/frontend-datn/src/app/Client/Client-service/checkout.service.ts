import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';


const HttpOptionss = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
  }),
};
@Injectable({
  providedIn: 'root'
})
export class CheckoutService {

  public API_URL = environment.apiUrl + '/orders';
  public API_URL1 = environment.apiUrl + '/contact';
  public API_URL2 = environment.apiUrl + '/sendmail';

  constructor(private readonly _http: HttpClient) {}
  checkout(order: any): Observable<any> {
    // const url = `${this.API_URL}/orders`;
    var orderString = JSON.stringify(order);
    return this._http.post<any>(this.API_URL, orderString, HttpOptionss);
  }
  // checkout(data: any): Observable<any> {
  //   //debugger;
  //   var orderString = JSON.stringify(data);
  //   return this._http.post<any>(this.API_URL, orderString, HttpOptionss).pipe(map(res => {
  //     return res;
  //   }));
  // }
  contact(data: any): Observable<any> {
    //debugger;
    return this._http.post<any>(this.API_URL1, data, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }

  sendemail(): Observable<any[]> {
    return this._http.get<any[]>(this.API_URL2).pipe(map(res => {
      return res;
    }));
  }
}
