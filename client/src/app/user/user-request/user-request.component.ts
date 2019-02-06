import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {ExpressService} from "../../services/express.service";
import swal from "sweetalert2";
import {faInfoCircle} from "@fortawesome/free-solid-svg-icons";
import {Auth} from 'src/app/guards/auth';
import {UserService} from "../../services/user.service";
// import * as $ from 'jquery';
declare var $: any;

@Component({
  selector: 'app-user-request',
  templateUrl: './user-request.component.html',
  styleUrls: ['./user-request.component.css']
})
export class UserRequestComponent implements OnInit {

    userRequest: FormGroup;
    processing = false;
    faInfoCircle = faInfoCircle;
    justifiedPeriod = true;
    reasonList;
    id_user;
    endDateMin;
    countLetter = 0;

    constructor(private formBuilder: FormBuilder,
                private expressService: ExpressService,
                private userService: UserService)
        {
        this.createForm();
        }

    ngOnInit() {
        this.getIdUser();
    }


    // get the id of user connected
    getIdUser() {
        this.userService.getIdUser((id)=> {
            this.id_user = id;
        })
    }

    // get all reason for the selectBox
    getReason() {
        let content = {
            action: 'getReason'
        };
        this.expressService.postExpress('absence', content).subscribe((res:Auth) => {
            if(res.success) {
                this.reasonList = res.list;
            } else {
                swal('Oups !', 'Une erreur est survenue lors de la requête vers la base de données.', 'error');
            }
        })
    }

    // change the require attribut for date input when other toggle is selected
    onJustifiedPeriod() {
        this.justifiedPeriod = !this.justifiedPeriod;
        if(!this.justifiedPeriod) {
            this.userRequest.get('startDate').clearValidators();
            this.userRequest.get('startDate').updateValueAndValidity();
            this.userRequest.get('startDate').setValue(null);
            this.userRequest.get('endDate').clearValidators();
            this.userRequest.get('endDate').updateValueAndValidity();
            this.userRequest.get('endDate').setValue(null);
            this.userRequest.get('dateOnly').setValidators([Validators.required]);
            this.userRequest.get('dateOnly').updateValueAndValidity();
        } else {
            this.userRequest.get('startDate').setValidators([Validators.required]);
            this.userRequest.get('startDate').updateValueAndValidity();
            this.userRequest.get('endDate').setValidators([Validators.required]);
            this.userRequest.get('endDate').updateValueAndValidity();
            this.userRequest.get('dateOnly').clearValidators();
            this.userRequest.get('dateOnly').updateValueAndValidity();
            this.userRequest.get('dateOnly').setValue(null);
        }
    }

    // build the formular
    createForm() {
        this.userRequest = this.formBuilder.group({
            reason: [0, Validators.required],
            startDate: [null, Validators.required],
            endDate: [null, Validators.required],
            dateOnly: [null],
            halfDay: [null],
            comment: [null]
        });
        this.getReason();
    }

    // disable all input in form
    disableForm() {
        this.userRequest.controls['reason'].disable();
        this.userRequest.controls['startDate'].disable();
        this.userRequest.controls['endDate'].disable();
        this.userRequest.controls['dateOnly'].disable();
        this.userRequest.controls['halfDay'].disable();
        this.userRequest.controls['comment'].disable();

    }

    // enable all input in form
    enableForm() {
        this.userRequest.controls['reason'].enable();
        this.userRequest.controls['startDate'].enable();
        this.userRequest.controls['endDate'].enable();
        this.userRequest.controls['dateOnly'].enable();
        this.userRequest.controls['halfDay'].enable();
        this.userRequest.controls['comment'].enable();
    }

    // reset the form
    resetForm() {
        this.enableForm();
        this.processing = false;
        this.userRequest.controls['reason'].setValue(0);
        this.userRequest.controls['startDate'].setValue(null);
        this.userRequest.controls['endDate'].setValue(null);
        this.userRequest.controls['dateOnly'].setValue(null);
        this.userRequest.controls['halfDay'].setValue(null);
        this.userRequest.controls['comment'].setValue(null);

    }

    // on submit action, send the data to backend
    onRequestSubmit() {
        this.processing = true;
        this.disableForm();
        let content = {
            action: 'absenceRequest',
            id_user: this.id_user,
            reason: this.userRequest.get('reason').value,
            startDate: this.userRequest.get('startDate').value,
            endDate: this.userRequest.get('endDate').value,
            dateOnly: this.userRequest.get('dateOnly').value,
            halfDay: this.userRequest.get('halfDay').value,
            comment: this.userRequest.get('comment').value
        };
        this.expressService.postExpress('absence', content).subscribe((res:Auth)=> {
           if(res.success){
               swal('Opération réussie', res.message, 'success');
               setTimeout(()=>{this.resetForm();}, 2000);
           } else {
               swal('Opération échouée', res.message, 'error');
               this.enableForm();
               this.processing = false;
           }
        });
    };

    // limit the date picker for input endDate
    onStartEndChange() {
        this.endDateMin = this.userRequest.get('startDate').value; // get the value
        this.endDateMin = new Date(new Date(this.endDateMin).setDate(new Date(this.endDateMin).getDate()+1)).toISOString(); // add 1 day
        this.endDateMin = this.endDateMin.slice(0,10); // slice on date format
        if(this.userRequest.get('startDate').value >= this.userRequest.get('endDate').value) { // if startDate >= endDate
            this.userRequest.get('endDate').setValue(this.endDateMin); // set endDate > startDate
        }
    }

    // count the character on comment input
    onCommentChange() {
        this.countLetter = this.userRequest.get('comment').value.length;
    }

}
