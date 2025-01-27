import { Component, OnInit } from '@angular/core';
import { ProductService } from '../product.service';


interface Product{
  id?: number;
  name: string;
  description: string;
  price: number;
}

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
}) 

export class ProductListComponent implements OnInit {

  products: Product[]=[];
  newProduct: Product = { name: '', description: '', price: 0 };

  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.loadProducts();
  }

  loadProducts():void {
    this.productService.getProducts().subscribe((data)=>{this.products = data;});
  }

  addProduct(): void{
    this.productService.addProduct(this.newProduct).subscribe((data)=>{
      this.products.push(data);
      this.newProduct = {name: '', description: '', price: 0};
    });
  }

  updateProduct(product: Product): void {
    this.productService.updateProduct(product.id!, product).subscribe(() => {
      this.loadProducts(); // Reload product list after update
    });
  }
}
