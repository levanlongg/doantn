import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { first, map, switchMap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { ClientNewsService } from '../Client-service/client-news.service';

@Component({
  selector: 'app-blog-detail',
  templateUrl: './blog-detail.component.html',
  styleUrls: ['./blog-detail.component.css']
})
export class BlogDetailComponent implements OnInit {

  news_client: any; 

  constructor(
    private ClientNewService: ClientNewsService,
    private activatedRoute: ActivatedRoute,
  ) { }
  ngOnInit(): void {
    this.activatedRoute.paramMap
      .pipe(
        map((params) => params.get('id')),
        switchMap((id) => this.ClientNewService.GetById(id).pipe(first()))
      )
      .subscribe((news_client) => (this.news_client = news_client));
  }

  createImg(path) {
    return environment.urlImg + 'image/' + path;
  } 
}
