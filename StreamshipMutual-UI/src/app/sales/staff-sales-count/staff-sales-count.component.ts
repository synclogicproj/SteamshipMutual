import { Component, Input } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-staff-sales-count',
  templateUrl: './staff-sales-count.component.html',
  styleUrls: ['./staff-sales-count.component.css'],
})
export class StaffSalesCountComponent {
  @Input() count;
  @Input() name;

  constructor(public activeModal: NgbActiveModal) {}
}
