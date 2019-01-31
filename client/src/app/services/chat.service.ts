import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs/Rx';
import {WebsocketService} from './websocket.Service';

@Injectable()
export class ChatService {

    messages: Subject<any>;
    private _ws;

    // Our constructor calls our wsService connect method
    constructor(private wsService: WebsocketService) {
        this.messages = <Subject<any>>wsService
            .connect()
            .map((response: any): any => {
                return response;
            })
    }

    // Our simplified interface for sending
    // messages back to our socket.io server
    sendMsg(msg) {
        this.messages.next(msg);
    }

}
