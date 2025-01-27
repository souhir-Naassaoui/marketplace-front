// src/app/app-routing.module.ts

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductListComponent } from './product-list/product-list.component'; // Assure-toi que le chemin est correct

const routes: Routes = [
  { path: '', component: ProductListComponent },  // Route par défaut
  // D'autres routes si nécessaire
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
