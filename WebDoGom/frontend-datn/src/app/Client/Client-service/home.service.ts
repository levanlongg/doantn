import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

const baseUrl = environment.apiUrl + "signin";

const HttpOptionss = {
  headers: new HttpHeaders({ "Content-Type": "application/json" })
}
@Injectable({
  providedIn: 'root'
})
export class HomeService {

  private authSubject = new BehaviorSubject(JSON.parse(localStorage.getItem("jwt")));
  private current = this.authSubject.asObservable();
  currentUser = null;


  public urlAPI1 = environment.apiUrl + '/tranh-gom-client';
  public urlAPI2 = environment.apiUrl + '/gom-trang-tri-client';
  public urlAPI3 = environment.apiUrl + '/gom-phong-thuy-client';
  public urlAPI4 = environment.apiUrl + '/gom-gia-dung-client';
  public urlAPI5 = environment.apiUrl + '/client-introduction';
  //public urlAPIs = environment.apiUrl + '/searchca';
  constructor(private _http: HttpClient) { }

  input(data) {
    this.authSubject.next(data);
  }

  output() {
    return this.current;
  }

  get_picture_ceramic(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
      return res;
    }));
  }

  get_decorative_ceramic(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI2).pipe(map(res => {
      return res;
    }));
  }

  get_feng_shui_ceramic(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI3).pipe(map(res => {
      return res;
    }));
  }

  get_household_ceramic(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI4).pipe(map(res => {
      return res;
    }));
  }

  get_client_introduction(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI5).pipe(map(res => {
      return res;
    }));
  }
  // postItem(data: any): Observable<any> {
  //   //debugger;
  //   return this._http.post<any>(this.urlAPI, data, HttpOptionss).pipe(map(res => {
  //     return res;
  //   }));
  // }
  // GetSingle(id: any): Observable<any> {
  //   return this._http.get<any>(this.urlAPI + "/" + id).pipe(map(res => {
  //     return res;
  //   }));
  // }

  // editItem(id: string, data: any): Observable<any> {
  //   //debugger;
  //   return this._http.put<any>(this.urlAPI + "/" + id, data, HttpOptionss).pipe(map(res => {
  //     return res;
  //   }));
  // }

  // delete(id: string): Observable<any> {
  //   //debugger;
  //   return this._http.delete<any>(this.urlAPI + "/" + id, HttpOptionss).pipe(map(res => {
  //     return res;
  //   }));
  // }

  // Search(keyword: string): Observable<any[]> {
  //   return this._http.get<any>(this.urlAPIs + "/" + keyword, HttpOptionss).pipe(map(res => {
  //     return res;
  //   }));
  // }

  
}
