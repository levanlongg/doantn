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
export class ClientNewsService {
  public urlAPIs = environment.apiUrl + '/search-news-client';
  public urlAPI1 = environment.apiUrl + '/news-list';
  public urlAPI2 = environment.apiUrl + '/news-detail';
  public urlAPI3 = environment.apiUrl + '/list-ceramics';

  constructor(private readonly _http: HttpClient) { }

  getNewsList(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI1).pipe(map(res => {
      return res;
    }));
  }

  getKnCeramicList(): Observable<any[]> {
    return this._http.get<any[]>(this.urlAPI3).pipe(map(res => {
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