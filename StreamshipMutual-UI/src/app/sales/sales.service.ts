import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';

export interface Staff {
  staffId: number;
  name: string;
  manager: string;
  companyName: string;
  salesAmount: number;
  salesCount: number;
}

export interface StaffResponse {
  items: Staff[];
  metaData: {
    totalItems: number;
    itemsPerPage: number;
    totalPages: number;
    currentPage: number;
  };
  links: {
    first: string;
    previous: string;
    next: string;
    last: string;
  };
}

@Injectable({
  providedIn: 'root',
})
export class SalesPerformanceService {
  constructor(private http: HttpClient) {}

  async getSalesPerformance(pageIndex: number, pageSize: number) {
    return await this.http
      .get<StaffResponse>(`${environment.baseUrl}/${pageIndex}/${pageSize}`)
      .pipe(
        catchError((error) => {
          console.log(error);
          return throwError(error);
        })
      )
      .toPromise();
  }

  async getSalesPerformanceByStaff(id: number) {
    return await this.http
      .get<Staff>(`${environment.baseUrl}/${id}`)
      .toPromise();
  }
}
