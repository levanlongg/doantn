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
export class AuthService {

  public urlAPIrgis = environment.apiUrl + '/register';
  constructor(private _http: HttpClient) { }

  getListUser(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPIrgis).pipe(map(res => {
      return res;
    }));
  }
  
  postItemUser(data: any): Observable<any> {
    //debugger;
    return this._http.post<any>(this.urlAPIrgis, data, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }
}

