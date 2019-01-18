import { Injectable } from '@angular/core';
import {JwtHelperService} from '@auth0/angular-jwt';
import {Router} from "@angular/router";

const helper = new JwtHelperService();

@Injectable({
    providedIn: 'root'
})
export class LoginService {

    private authToken: string;
    private user: string;

    constructor() {
        this.authToken = localStorage.getItem('token');
        this.user = JSON.parse(localStorage.getItem('user'));
    }

    // get the token
    getToken(){
        return this.authToken;
    }

    // We use this method to record the information of the connected user.
     storeUserData (token, user) {
        localStorage.setItem('token', token);
        localStorage.setItem('user', JSON.stringify(user));
        this.authToken = token;
        this.user = user;
    }

    // If is still logged, return false if the time has expired.
    public loggedIn() {
        return !helper.isTokenExpired(this.authToken);
    }

    // We disconnect the user
    logout() {
        this.authToken = null;
        this.user = null;
        localStorage.clear();
    }
}