import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { HttpClient, HttpHandler, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';


const HttpOptionss = {
  headers: new HttpHeaders({ "Content-Type": "application/json" })
}
@Injectable({
  providedIn: 'root'
})
export class NewsTypeService {

  public urlAPI = environment.apiUrl + '/newstype';
  public urlAPIs = environment.apiUrl + '/search';;
  constructor(private _http: HttpClient) { }

  getListnewtype(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI).pipe(map(res => {
      return res;
    }));
  }
  postItem(data: any): Observable<any> {
    //debugger;
    return this._http.post<any>(this.urlAPI, data, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }
  GetSingle(id: any): Observable<any> {
    return this._http.get<any>(this.urlAPI + "/" + id).pipe(map(res => {
      return res;
    }));
  }

  editItem(id: string, data: any): Observable<any> {
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
