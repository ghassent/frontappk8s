import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  name: string= "ghasaaaaaaaaaaaaaa";
  title: any;
  constructor(
    public http: Http, private router: Router) {
     this.getContact(this.name).subscribe((user:any) => {
      if(!user){
        return;
      }
      this.title = user._body
      console.log(user._body);
      
      // this.listData = new MatTableDataSource(user.data);
  });

  }
  getContact(x) {
    return this.http.get('http://34.122.195.239:30893/');
  }



}
