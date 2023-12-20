import {HttpClient, HttpParams} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';
import {SERVER_API_URL} from '../../app.constants';


@Injectable({providedIn: 'root'})
export class ActivateService {
  constructor(private http: HttpClient) {
  }

  get(key: string): Observable<any> {
    return this.http.get(SERVER_API_URL + 'api/activate', {
      params: new HttpParams().set('key', key)
    });
  }
}
