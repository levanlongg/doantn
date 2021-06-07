import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

const baseUrl = environment.apiUrl + "/login";

const HttpOptionss = {
  headers: new HttpHeaders({ "Content-Type": "application/json" })
}
@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public urlAPIrgis = environment.apiUrl + '/register';
  constructor(private _http: HttpClient) { }

  private authSubject = new BehaviorSubject(JSON.parse(localStorage.getItem("jwt")));
  private current = this.authSubject.asObservable();

  get currentUser() {
    return this.authSubject.value;
  }

  input(data) {
    this.authSubject.next(data);
  }

  output() {
    return this.current;
  }

  login(user) {
    return this._http.post(baseUrl, user);
  }

  // changepass(user) {
  //   return this._http.post(baseUrl + "change-pass", user);
  // }

  // editprofile(user) {
  //   return this._http.put(baseUrl + "update", user);
  // }

  logout(user) {
    localStorage.removeItem(user);
  }  

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

