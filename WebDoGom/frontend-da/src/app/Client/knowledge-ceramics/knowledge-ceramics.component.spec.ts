import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KnowledgeCeramicsComponent } from './knowledge-ceramics.component';

describe('KnowledgeCeramicsComponent', () => {
  let component: KnowledgeCeramicsComponent;
  let fixture: ComponentFixture<KnowledgeCeramicsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KnowledgeCeramicsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(KnowledgeCeramicsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
