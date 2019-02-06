import { Component, OnInit } from '@angular/core';
import { ExpressService } from '../../services/express.service';
import { Auth } from '../../guards/auth';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Subject } from 'rxjs';
import swal from 'sweetalert2';
import {PdfService} from '../../services/pdf.service';


@Component({
  selector: 'app-hebdo',
  templateUrl: './hebdo.component.html',
  styleUrls: ['./hebdo.component.css']
})
export class HebdoComponent implements OnInit {

  userList;
  userListSubject = new Subject<any[]>();
  startDateTime;
  endDateTime;
  selectWeek = 1;
  form: FormGroup;
  checkbox1 = '';
  checkbox2 = '';
  checkbox3 = '';
  checkbox4 = '';
  filterGroup = '1,2,3';
  cssButton = '';
  disabledButton = false;

  constructor(private expressService: ExpressService,
              private pdfService: PdfService,
              private formBuilder: FormBuilder) {
      this.createForm();
  }

  ngOnInit() {
    this.initDate();
    // document.getElementById("progress").style.display = "none"; // to undisplay
  }

  // emit to graphic the update list
  emitUserListSubject() {
    this.userListSubject.next(this.userList.slice());
  }

  // create the checkbox form
  createForm() {
    this.form = this.formBuilder.group({
        orderBy: ['userName'],
        checkbox1: [true],
        checkbox2: [true],
        checkbox3: [true],
        checkbox4: [false]
    });
  }

  onPrevWeek() {
    this.selectWeek += 1;
    this.initDate();
  }
  onNextWeek() {
    this.selectWeek -= 1;
    this.initDate();
  }

  // initializes the date
  initDate() {
    const currFirst = new Date; // get current date for first
    const currLast = new Date; // get current date for last
    const first = currFirst.getDate() - currFirst.getDay() + 1 - (7 * this.selectWeek); // First day is the day of the month - the day of the week
    const last = first + 6; // last day is the first day + 6

    this.startDateTime = new Date(currFirst.setHours(0, 0, 0, 0)); // set time at start day 00:00
    this.startDateTime = new Date(currFirst.setDate(first)).toISOString(); // set first day of week
    this.endDateTime = new Date(currLast.setHours(23, 59, 59, 0)); // set time at end day 23:00
    this.endDateTime = new Date(currLast.setDate(last)).toISOString(); // set last day of the week

    this.userList = []; // initilizes the userlist
    this.getUserListHebdo();
  }

  // get the user  list to db
  getUserListHebdo() {
    const content = {
      action: 'getUserListHebdo',
      startDate: this.startDateTime,
      endDate: this.endDateTime,
      filterGroup: this.filterGroup,
      orderBy: this.form.get('orderBy').value
    };
    this.expressService.postExpress('hebdo', content).subscribe((res: Auth) => {
      if (!res.success) {
        swal('Oups !', 'Une erreur est survenue lors de la requête vers la base de données.', 'error');
      } else {
        this.userList = res.list;
        this.emitUserListSubject();
      }
    });
  }

  // initializes the group selected
  onInitGroup() {
    if (this.form.get('checkbox1').value) {this.checkbox1 = '1,'; } else {this.checkbox1 = ''; }
    if (this.form.get('checkbox2').value) {this.checkbox2 = '2,'; } else {this.checkbox2 = ''; }
    if (this.form.get('checkbox3').value) {this.checkbox3 = '3,'; } else {this.checkbox3 = ''; }
    if (this.form.get('checkbox4').value) {this.checkbox4 = '4,'; } else {this.checkbox4 = ''; }

    this.filterGroup = this.checkbox1 + this.checkbox2 + this.checkbox3 + this.checkbox4;
    this.filterGroup = this.filterGroup.substring(null, this.filterGroup.length - 1);

    this.getUserListHebdo();
  }

  downloadPDF() {
    this.cssButton = 'progress-bar progress-bar-striped progress-bar-animated';
    this.disabledButton = true;
    this.pdfService.downloadPDF(this.startDateTime, this.endDateTime, (res) => {
      if (res === true) {
        setTimeout(() => {
          this.cssButton = '';
          this.disabledButton = false;
        }, 2000);

      }
    });
  }
}
