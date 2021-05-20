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
export class IntroductionService {

  public urlAPI = environment.apiUrl + '/introduction';
  public urlAPIs = environment.apiUrl + '/searchintroduction';
  constructor(private _http: HttpClient) { }

  getList(): Observable<any[]> {
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

  postFile(uri: string, data?: any) {
    // let newHeader = new Headers();
    return this._http.post(this.urlAPI + uri, data, HttpOptionss).pipe(map(res => {
      return res;
    }));
  }
}


