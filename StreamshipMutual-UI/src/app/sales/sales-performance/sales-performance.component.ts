import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import {
  SalesPerformanceService,
  Staff,
  StaffResponse,
} from '../sales.service';
import { StaffSalesCountComponent } from '../staff-sales-count/staff-sales-count.component';

@Component({
  selector: 'app-sales-performance',
  templateUrl: './sales-performance.component.html',
  styleUrls: ['./sales-performance.component.css'],
})
export class SalesPerformanceComponent implements OnInit {
  staffPerfomanceList: StaffResponse = null;
  pages: number[] = [];
  start: number;
  size: number;

  constructor(
    private staffService: SalesPerformanceService,
    private route: ActivatedRoute,
    private modalService: NgbModal
  ) {}

  ngOnInit(): void {
    this.route.params.subscribe((param) => {
      this.start = param['pageIndex'] ? +param['pageIndex'] : 1;
      this.size = param['pageSize'] ? +param['pageSize'] : 5;
      this.staffPerformance(this.start, this.size);
    });

    //this.staffPerformance();
  }

  async staffPerformance(start: number = 1, size: number = 5) {
    this.staffPerfomanceList = await this.staffService.getSalesPerformance(
      start,
      size
    );

    this.pages = [];
    for (let i = 1; i <= this.staffPerfomanceList.metaData.totalPages; i++) {
      this.pages.push(i);
    }
  }

  open(item: Staff) {
    const compRef = this.modalService.open(StaffSalesCountComponent);
    compRef.componentInstance.count = item.salesCount;
    compRef.componentInstance.name = item.name;
  }
}
