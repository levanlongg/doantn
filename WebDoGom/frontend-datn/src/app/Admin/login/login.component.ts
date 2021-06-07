import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from 'src/app/Client/Client-service/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  title = 'Login';
  form: any;
  iSubmited: boolean = false;
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private toastr: ToastrService,
  ) {}

  ngOnInit(): void {
    this.form = this.formBuilder.group({
      email: ['',[Validators.required, Validators.email ]],
      password: ['',[Validators.required ]],
     
    });
  }

  loginSuccess() {
    this.toastr.success('Đăng nhập thành công', 'Thông báo!');
  }

  loginEror() {
    this.toastr.error('Đăng nhập không thành công', 'Thông báo!');
  } 

  onSubmit() {
    this.iSubmited = true;
    if(this.form.invalid) {
      return;
    }

    console.log(this.form.value);
    
    this.authService.login(this.form.value).subscribe((res: any) => {
      localStorage.setItem("jwt", JSON.stringify(res.data));
      this.authService.input(res.data);
      this.loginSuccess();
      this.router.navigate(['/dashboard']);
    }, err => {
      if (err.status != 1) {
        console.log(err.error.message);
        this.loginEror();
      }
    });
  }
}