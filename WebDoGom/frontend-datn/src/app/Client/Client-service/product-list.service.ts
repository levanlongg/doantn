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
  
  constructor(private readonly _http: HttpClient) { }

  getlistproduct(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
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
}

