import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SalesPerformanceComponent } from './sales/sales-performance/sales-performance.component';
import { StaffDetailsComponent } from './sales/staff-details/staff-details.component';

const routes: Routes = [
  {
    path: 'staff-details/:id/:pageIndex/:pageSize',
    component: StaffDetailsComponent,
  },
  { path: '', component: SalesPerformanceComponent, pathMatch: 'full' },
  {
    path: ':pageIndex/:pageSize',
    component: SalesPerformanceComponent,
    pathMatch: 'full',
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
