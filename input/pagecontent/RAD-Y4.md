### 2:3.Y4.1 Scope

This transaction is used by the Requester to retrieve a ready-to-present version of the DiagnosticReport from the Responder.

### 2:4.Y4.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:4.Y4.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-------------------|--------------------------|
| Requester | Request to retrieve read-to-present report         | Rendered Report Reader     |
| Responder | Return report  | Report Repository |
{: .grid}

### 2:4.Y4.3 Referenced Standards

**RFC1738**: [Uniform Resource Locators (URL)](http://www.ietf.org/rfc/rfc1738.txt)

**RFC2616**: [HyperText Transfer Protocol HTTP/1.1](http://www.ietf.org/rfc/rfc2616.txt)

**RFC7540**: [Hypertext Transfer Protocol Version 2 (HTTP/2)](https://tools.ietf.org/html/rfc7540)

### 2:3.Y4.4 Messages

<div>
{%include RAD-Y4-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.Y4.4-1: Interaction Diagram**

#### 2:4.Y4.4.1 Retrieve Rendered Report Message

The Requester invokes a HTTP GET request to retrieve the document from the Responder.

##### 2:3.Y4.4.1.1 Trigger Events

The Requester wants to obtain a rendered report.

##### 2:4.Y4.4.1.2 Message Semantics

The Requester sends a HTTP GET request to the Responder. The Requester uses the url attribute from one of the DiagnosticReport.presentedForm entries returned in [RAD-Y3]. The Requester shall use the DiagnosticReport.presentedForm.contentType to determine which one of the available rendered reports to retrieve.

The Requester may provide HTTP Accept header, according to the semantics of the HTTP protocols (see RFC2616, Section 14.1).  This enables the Requester to indicate preferred mime-types such that the Responder could provide the report requested in an encoding other than the encoding indicated in the DiagnosticReport.presentedForm.

The only MIME type assured to be returned is the MIME type indicated in the DiagnosticReport.presentedForm.contentType.

The HTTP If-Unmodified-Since header may be included in the GET request if the Requester caches the retrieved report locally.

##### 2:4.Y4.4.1.3 Expected Actions

The Responder shall provide the rendered report in the requested MIME type or reply with an HTTP status code indicating the error condition. The Responder is not required to transform the document.

#### 2:4.Y4.4.2 Return Rendered Report Message

This is the return message sent by the Responder. 

##### 2:4.Y4.4.2.1 Trigger Events

The HTTP Response message is sent upon completion of the Retrieve rendered Report request. 

##### 2:4.Y4.4.2.2 Message Semantics

This message shall be an HTTP Response, as specified by RFC2616. When the requested rendered report is returned, the Responder shall respond with HTTP Status Code 200. The HTTP message-body shall be the content of the requested document.

Table 2:4.Y4.4.2.2-1 contains error situations and the HTTP Response.

**Table 2:4.Y4.4.2.2-1: HTTP Error Response Codes and Suggested Text**

|Situation	| HTTP Response |
|-----------|---------------|
|URI not known	| 404 Document Not Found |
|Document is not available	| 410 Gone (or 404 when 410 is unacceptable due to security/privacy policy) |
|Responder unable to format document in content types listed the 'Accept' field	| 406 Not Acceptable |
|HTTP request specified is otherwise not a legal value	| 403 Forbidden/Request Type Not Supported |
{: .grid}

The Responder may return other HTTP Status Codes. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

The Responder should complement the returned error code with a human readable description of the error condition.

The Responder may return HTTP redirect responses (responses with HTTP Status Codes 301, 302, 303 or 307) in response to a request. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4). 

##### 2:4.Y4.4.2.3 Expected Actions

If the Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Requester shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The .hash and .size, when populated, represent the content in the MIME type indicated in the DiagnosticReport.presentedForm.contentType.

The Requester shall display the retrieved report, including making available all multimedia content and interactions (e.g. hyperlinks) contained in the report. The Requester is not required to provide additional interaction behavior beyond what is contained in the report.

#### 2:4.Y4.4.3 CapabilityStatement Resource

**TODO**

Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)
* Requirements CapabilityStatement for [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html)

### 2:4.Y4.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

The Responder should not return information that the Requester is not authorized to access. 

#### 2:4.Y4.5.1 Security Audit Considerations

