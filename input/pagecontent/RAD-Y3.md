### 2:3.Y3.1 Scope

This transaction is used to find DiagnosticReport Resources that satisfy a set of parameters. The result of the query is a FHIR Bundle containing DiagnosticReport Resources that match the query parameters.

### 2:3.Y3.2 Actors Roles

The roles in this transaction are defined in the following table and may be palyed by the actors shown here:

**Table 2:3.Y3.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Requester | Request a search for DiagnosticReport         | Report Reader     |
| Responder | Return matching DiagnosticReport in a bundle  | Report Repository |
{: .grid}

### 2:3.Y3.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.Y3.4 Messages

<div>
{%include RAD-Y3-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.Y3.4-1: Interaction Diagram**

#### 2:3.Y3.4.1 Find Multimedia DiagnosticReport

The Requester uses the search method parameterized query to obtain DiagnosticReport Resources from the Responder. 

The Responder shall support handling such messages from more than one Requester. The Requester shall support making requests to more than one Responder.

##### 2:3.Y3.4.1.1 Trigger Events

When the Requester needs to discover DiagnosticReport Resources matching various metadata parameters, it issues a Find Multimedia DiagnosticReport message. 

##### 2:3.Y3.4.1.2 Message Semantics

This message is a HTTP GET or HTTP POST request. The Requester is the User Agent. The Responder is the Origin Server.

The Requester executes an HTTP search against the Responder DiagnosticReport URL. The search target follows the FHIR HTTP specification, addressing the DiagnosticReport Resource [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html):
```
[base]/DiagnositicReport?<query>
```
This URL is configurable by the Responder and is subject to the following constraints: 

The `<query>` represents a series of encoded name-value pairs representing the filter for the query, as specified in Section [Query Search Parameters](#query-parameters), as well as control parameters to modify the behavior of the Responder such as response format, or pagination.

The Requester may use GET or POST based searches. The Responder shall support both GET and POST based searches [http://hl7.org/fhir/R4/http.html#search](http://hl7.org/fhir/R4/http.html#search).


###### 2:3.Y3.4.1.2.1 Query Search Parameters <a name="query-parameters"> </a>

The Requester may supply, and the Responder shall be capable of processing, all query parameters listed below. All query parameter values shall be appropriately encoded per RFC3986 “percent” encoding rules. Note that percent encoding does restrict the character set to a subset of ASCII characters which is used for encoding all other characters used in the URL.

The Requester shall support the following search parameter:
- Patient: `subject` or `subject.identifier`
- Order: `basedOn` or `basedOn.identifier`
- Study: `imagingStudy` or `imagingStudy.identifier`
- Status: `status` 

The other parameters described below are optional. The Responder shall implement the parameters described below. The Responder may choose to support additional query parameters beyond the subset listed below. Any additional query parameters supported shall be supported according to the core FHIR specification. Such additional parameters are considered out of scope for this transaction. Any additional parameters not supported should be ignored. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors). 

**subject**:
This parameter is of type Reference(Patient). The identifier of Patient is a medical record number. When the subject parameter is used, the Patient reference would need to be accessible to both the Requester and the Responder. See FHIR [http://hl7.org/fhir/R4/search.html#reference](http://hl7.org/fhir/R4/search.html#reference) for use of the reference search type.

**subject.identifier**:
This parameter, of type token, specifies a medical record number associated with the patient to which the DiagnosticReport Resource is assigned.  See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. This use of **subject.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**subject.name.given** and **subject.name.family**:
These parameters, of type string, specify the name parts of the patient, which is associated with the DiagnosticReport Resource. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for use of the string data type.  This use of **subject.name.given** and **subject.name.family** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**status**:
This parameter, of type token, specifies the status of the DiagnosticReport Resource. The valid values for status are defined in [IMR DiagnositcReport Status](ValueSet-imr-diagnosticreport-status-vs.html) See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**category**:
This parameter, of type token, specifies the general classification of the DiagnosticReport Resource. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**effectiveDateTime**:
This parameter, of type datetime, specifies the date and time when the report captured in this DiagnosticReport is in effect. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the datetime search type.

**issued**:
This parameter, of type instant, specifies the instance when this DiagnosticReport Resource was created. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the instant search type.

**code**:
This parameter, of type token, specifies the kind of report of this DiagnositcReport Resource. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**basedOn**:
This parameter is of type Reference(ServiceRequest). The identifier of IMRServiceRequest is an accession number. When the basedOn parameter is used, the ServiceRequest reference would need to be accessible to both the Requester and the Responder. See FHIR [http://hl7.org/fhir/R4/search.html#reference](http://hl7.org/fhir/R4/search.html#reference) for use of the reference search type.

**basedOn.identifier**:
This parameter, of type token, specifies an accession number associated with the service request to which the DiagnosticReport Resource is assigned.  See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. This use of **basedOn.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**imagingStudy**:
This parameter is of type Reference(ImagingStudy). The identifier of IMRImagingStudy is the study instance UID. When the imagingStudy parameter is used, the ImagingStudy reference would need to be accessible to both the Requester and the Responder. See FHIR [http://hl7.org/fhir/R4/search.html#reference](http://hl7.org/fhir/R4/search.html#reference) for use of the reference search type.

**imagingStudy.identifier**:
This parameter, of type token, specifies the study instance UID associated with the imaging study to which the DiagnosticReport Resource is assigned.  See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. This use of **imagingStudy.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**resultsInterpreter**:
This parameter is of type Reference(Practitioner or PractitionerRole). When the resultsInterpreter parameter is used, the Practitioner or PractitionerRole reference would need to be accessible to both the Requester and the Responder. See FHIR [http://hl7.org/fhir/R4/search.html#reference](http://hl7.org/fhir/R4/search.html#reference) for use of the reference search type.

**resultsInterpreter.identifier** or **resultsInterpreter.practitioner.identifier**:
This parameter, of type token, specifies an identifier associated with the practitioner to which the DiagnosticReport Resource is interpreted by.  See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. This use of **resultsInterpreter.identifier** or **resultsInterpreter.practitioner.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

###### 2:3.Y3.4.1.2.2 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Responder shall support both message encodings, whilst the Requester shall support one and may support both.

See [ITI TF-2x: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details. 

###### 2:3.Y3.4.1.2.3 Example DiagnosticReport search

For example given:
* FHIR server root is `http://test.fhir.org/R4/fhir`
* Patient reference id is `9876`
* status of final
* with clinical code from loinc of `1234-5`
* examples do not include all http headers such as the security headers

###### 2:3.Y3.4.1.2.3.1 Example GET
```
GET test.fhir.net/R4/fhir/DiagnosticReport?subject=9876&status=final&code=http://loinc.org|1234-5
```

###### 2:3.Y3.4.1.2.3.2 Example POST
```
POST test.fhir.net/R4/fhir/DiagnosticReport/_search?subject=9876&status=final&code=http://loinc.org|1234-5
```

###### 2:3.Y3.4.1.2.3.3 Example POST body
```
POST test.fhir.net/R4/fhir/DiagnosticReport/_search	  
Host test.fhir.net
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0										  

subject=9876&status=final&code=http://loinc.org|1234-5
```

##### 2:3.Y3.4.1.3 Expected Actions

The Responder shall process the query to discover the DiagnosticReport entries that match the search parameters given. 


#### 2:3.Y3.4.2 Return DiagnosticReport Bundle message

The Responder returns a HTTP Status code appropriate to the processing as well as a Bundle of the matching DiagnosticReport Resources.

##### 2:3.Y3.4.2.1 Trigger Events

The Responder completed processing of the Find Multimedia DiagnosticReport Request message. 

##### 2:3.Y3.4.2.2 Message Semantics

Based on the query results, the Responder will either return an error or success. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2x: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations). 

When the Responder needs to report an error, it shall use HTTP error response codes and should include a FHIR OperationOutcome with more details on the failure. See FHIR [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) and [http://hl7.org/fhir/R4/operationoutcome.html](http://hl7.org/fhir/R4/operationoutcome.html).

If the Find Multimedia DiagnosticReport message is processed successfully, whether or not any DiagnosticReport Resources are found, the HTTP status code shall be 200. The Return DiagnosticReport Bundle message shall be a Bundle Resource containing zero or more DiagnosticReport Resources. If the Responder is sending warnings, the Bundle Resource shall also contain an OperationOutcome Resource that contains those warnings.

The response shall adhere to the FHIR Bundle constraints specified in [ITI TF-2x: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

###### 2:3.Y3.4.2.2.1 DiagnosticReport Resource Contents

The DiagnosticReport Resources returned shall be compliant with the [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html) profile.

###### 2:3.Y3.4.2.2.2 Resource Bundling

Resource Bundling shall comply with the guidelines in [ITI TF-2x: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). 

#### 2:3.Y3.4.3 Expected Actions

If the Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Requester shall follow the redirect, but may stop processing if it detects a loop. See RFC7231 Section 6.4 Redirection 3xx.

The Requester shall process the results according to application-defined rules. The Requester should be robust as the response may contain DiagnosticReport Resources that match the query parameters but are not compliant with the DiagnosticReport constraints defined here.

#### 2:3.Y3.4.4 CapabilityStatement Resource

Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

TODO: Create the capability statements

### 2:3.Y3.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

This transaction should not return information that the Requester is not authorized to access. Where authorization here is inclusive of system, app, and user according to local policy, patient consents, and security layering. However, the transaction may return DiagnosticReport resources that have Reference elements that the Requester may not have access to. This is to say that the authorization need only be to the content returned in the Bundle. There may be references (URLs) for which the content is not authorized. This is considered proper as the Requester would need to retrieve the content pointed to by those references, and at that time the proper authorization decision would be made on that context and content. In this way it is possible for a Requester to get DiagnosticReport resources that are pointing at data that the Requester is not authorized to retrieve. Thus, the URLs used must be carefully crafted so as to not expose sensitive data in the URL value.

#### 2:3.Y3.5.1 Security Audit Considerations

This transaction is associated with a Query ATNA Trigger Event on both the Requester and the Responder.
