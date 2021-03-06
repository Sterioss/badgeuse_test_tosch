import {Injectable} from '@angular/core';
import * as io from 'socket.io-client';
import {Observable, Subject} from 'rxjs';
import * as Rx from 'rxjs/Rx';
import {ExpressService} from './express.service';

@Injectable()
export class WebsocketService {

    private socket;
    onListenPresence: Subject<any>;
    onListenAbsenceList: Subject<any>;

    constructor(private expressService: ExpressService) {
    }

    /**
     * Listen the backend
     */
    listenSocket() {
        // subject variable for user list presence
        this.onListenPresence = <Subject<any>>this
            .connect('presence')
            .map((response: any): any => {
                return response;
            });
        // subject varaible for number of absence in wait
        this.onListenAbsenceList = <Subject<any>>this
            .connect('absenceList')
            .map((response: any): any => {
                return response;
            });
    }

    /**
     * Emit to backend
     * @param content
     */
    sendSocket(content) {
        this.onListenPresence.next(content);
    }

    /**
     * Principal function for listen and emit
     * @param action
     */
    connect(action): Rx.Subject<MessageEvent> {
        // server path
        this.socket = io(window.location.href + this.expressService.getDomain()); // io does not pass through express ; then the host must be appened manualy to get the local url

        // listen
        const observable = new Observable(observer => {
            this.socket.on(action, (data) => {
                observer.next(data);
            });
            return () => {
                 this.socket.disconnect();
            };
        });

        // emit
        const observer = {
            next: (data) => {
                this.socket.emit(data.action, data);
            },
        };

        return Rx.Subject.create(observer, observable);
    }


}
