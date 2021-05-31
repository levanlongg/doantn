import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaymentAtmComponent } from './payment-atm.component';

describe('PaymentAtmComponent', () => {
  let component: PaymentAtmComponent;
  let fixture: ComponentFixture<PaymentAtmComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PaymentAtmComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PaymentAtmComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
