### 2:4.144.1 Scope

This transaction is used by the Requester to retrieve a rendered report from the Responder.

### 2:4.144.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:4.144.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-------------------|--------------------------|
| Requester | Request to retrieve rendered report         | Rendered Report Reader    |
| Responder | Return rendered report  | Report Repository |
{: .grid}

### 2:4.144.3 Referenced Standards

**RFC1738**: [Uniform Resource Locators (URL)](http://www.ietf.org/rfc/rfc1738.txt)

**RFC2616**: [HyperText Transfer Protocol HTTP/1.1](http://www.ietf.org/rfc/rfc2616.txt)

**RFC7540**: [Hypertext Transfer Protocol Version 2 (HTTP/2)](https://tools.ietf.org/html/rfc7540)

### 2:4.144.4 Messages

<div>
{%include RAD-144-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.144.4-1: Interaction Diagram**

#### 2:4.144.4.1 Retrieve Rendered Report Message

The Requester retrieves a rendered report from the Responder.

The Responder shall support handling such messages from more than one Sender. 

##### 2:4.144.4.1.1 Trigger Events

The Requester wants to retrieve a rendered report identified in the response to an Find Multimedia Report [RAD-143] search request.

##### 2:4.144.4.1.2 Message Semantics

The message is an HTTP GET request. The Requester is the User Agent. The Responder is the Original Server.

The Requester shall select one or more rendered reports to retrieve based on the DiagnosticReport.presentedForm.contentType returned in the query response [RAD-143].

The Requester shall obtain the URL of the selected rendered report(s) in DiagnosticReport.presentedForm.url.

The Requester shall execute an HTTP GET request to the Responder for each URL of the selected rendered report(s).

The Requester may provide HTTP Accept header, according to the semantics of the HTTP protocols (see RFC2616, Section 14.1).  This enables the Requester to indicate preferred mime-types such that the Responder could provide the report requested in an encoding other than the encoding indicated in the DiagnosticReport.presentedForm.

The only MIME type assured to be returned is the MIME type indicated in the DiagnosticReport.presentedForm.contentType.

The HTTP If-Unmodified-Since header may be included in the GET request if the Requester caches the retrieved report locally.

##### 2:4.144.4.1.3 Expected Actions

The Responder shall provide the rendered report in the requested MIME type or reply with an HTTP status code indicating the error condition. The Responder is not required to transform the document.

#### 2:4.144.4.2 Return Rendered Report Message

The Responder sends the requested rendered report back to the Requester.

##### 2:4.144.4.2.1 Trigger Events

The Responder receives a Retrieve Rendered Report request from the Requester.

##### 2:4.144.4.2.2 Message Semantics

The message is an HTTP GET response. The Requester is the User Agent. The Responder is the Origin Server.

The Responder shall return an HTTP GET response as specified by RFC2616.

The Responder shall respond with an HTTP Status Code 200 when it successfully returns the requested rendered report to the Requester. The HTTP message-body shall be the content of the requested document.

The Responder may return HTTP redirect responses (responses with HTTP Status Codes 301, 302, 303 or 307) in response to a request. See RFC7231 Section 6.4 Redirection 352.

In case of an error, the Responder shall return an HTTP Error Response Code for different failure situations according to Table 2:4.144.4.2.2-1.

**Table 2:4.144.4.2.2-1: Failure Situations and corresponding HTTP Error Response Codes**

|Failure Situation	| HTTP Response |
|-----------|---------------|
|URI not known	| 404 Document Not Found |
|Document is not available	| 404 Document Not Found |
|Responder unable to format document in content types listed the 'Accept' field	| 406 Not Acceptable |
|HTTP request specified is otherwise not a legal value	| 403 Forbidden/Request Type Not Supported |
{: .grid}

The Responder may return other HTTP Status Codes. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2x: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

When the Responder needs to report an error, it shall use HTTP error response codes and should include a FHIR OperationOutcome with more details on the failure. See FHIR [http://hl7.org/fhir/http.html](http://hl7.org/fhir/http.html) and [http://hl7.org/fhir/operationoutcome.html](http://hl7.org/fhir/operationoutcome.html). 

##### 2:4.144.4.2.3 Expected Actions

If the Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Requester shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 352](https://tools.ietf.org/html/rfc7231#section-6.4).

The Requester shall process the results according to application-defined rules.

In the DiagnosticReport.presentedForm, the .hash and .size, when populated, represent the hash and size of the corresponding rendered report. The Requester should verify the integrity of the received rendered report using the hash and size attributes.

#### 2:4.144.4.3 CapabilityStatement Resource

Requesters and Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

- Requirements CapabilityStatement for the [Requester](CapabilityStatement-IHE.IMR.ReportReader.html).
- Requirements CapabilityStatement for the [Responder](CapabilityStatement-IHE.IMR.ReportRepository.html).

### 2:4.144.5 Security Considerations

The rendered report is available via an external URLs in presentedForm.url. The Requester should consider validating the URL to ensure that it is a valid URL referencing a known legitimate host to avoid phishing attack.

#### 2:4.144.5.1 Security Audit Considerations

This transaction is associated with a 'Patient-record-event' ATNA Trigger Event on both the Requester and the Responder. See [ITI TF-2: 3.20.4.1.1.1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html#3.20.4.1.1.1).
