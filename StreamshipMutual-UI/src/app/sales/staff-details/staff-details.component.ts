import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SalesPerformanceService, Staff } from '../sales.service';

@Component({
  selector: 'app-staff-details',
  templateUrl: './staff-details.component.html',
  styles: [],
})
export class StaffDetailsComponent implements OnInit {
  staff: Staff;
  start: number;
  size: number;

  constructor(
    private staffService: SalesPerformanceService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.params.subscribe(async (param) => {
      this.start = param['pageIndex'] ? +param['pageIndex'] : 1;
      this.size = param['pageSize'] ? +param['pageSize'] : 5;

      this.staff = await this.staffService.getSalesPerformanceByStaff(
        +param['id']
      );
    });
  }
}
