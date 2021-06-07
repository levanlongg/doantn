import { Component, OnInit } from '@angular/core';
import { HomeService } from '../Client-service/home.service';

@Component({
  selector: 'app-introduction',
  templateUrl: './introduction.component.html',
  styleUrls: ['./introduction.component.css']
})
export class IntroductionComponent implements OnInit {

  [x: string]: any;

  public items: any[];
 
  constructor(
    private homeservice: HomeService,
  ) { }

  ngOnInit(): void {
    this.loadData();
  }
  
  loadData() {
    this.homeservice.get_client_introduction().subscribe((res: any) => {
      this.items = res;
      console.log(this.items);
    });
  }
}
