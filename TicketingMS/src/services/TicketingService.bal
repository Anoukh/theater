package src.services;
import ballerina.net.http;
import ballerina.time;
import ballerina.io;
import ballerina.data.sql;
import src.serviceImpl as impl;
@http:configuration {
    basePath:"/tickets",
    port:9092
}
service<http> TicketDataService {
    @http:resourceConfig {
        methods:["GET"],
        path:"get/{eventID}"
    }
    resource getTickets (http:Connection conn,http:InRequest req,string eventID) {
        var id,_ = <int>eventID;
        _ = conn.respond(impl:hadleGetTicketsByEventId(id));
    }
    
    @http:resourceConfig {
        methods:["POST"],
        path:"add"
    }
    resource addTickets (http:Connection conn,http:InRequest req) {
        http:OutResponse res = {};
        _ = conn.respond(impl:handleAddTickets(req.getJsonPayload()));
    }
}