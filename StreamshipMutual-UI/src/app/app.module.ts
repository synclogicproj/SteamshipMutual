import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SalesPerformanceComponent } from './sales/sales-performance/sales-performance.component';
import { StaffDetailsComponent } from './sales/staff-details/staff-details.component';
import { StaffSalesCountComponent } from './sales/staff-sales-count/staff-sales-count.component';

@NgModule({
  declarations: [
    AppComponent,
    SalesPerformanceComponent,
    StaffDetailsComponent,
    StaffSalesCountComponent,
  ],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
