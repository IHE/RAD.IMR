### 2:3.Y3.1 Scope

This transaction is used to find DiagnosticReport Resources that satisfy a set of parameters. The result of the query is a FHIR Bundle containing DiagnosticReport Resources that match the query parameters.

### 2:3.Y3.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:3.Y3.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Requester | Request DiagnosticReport that matches a filter         | Report Reader     |
| Responder | Return matching DiagnosticReports in a bundle  | Report Repository |
{: .grid}

### 2:3.Y3.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.Y3.4 Messages

<div>
{%include RAD-Y3-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.Y3.4-1: Interaction Diagram**

#### 2:3.Y3.4.1 Request Multimedia DiagnosticReports Message

The Requester uses the search method parameterized query to obtain DiagnosticReport Resources from the Responder. 

The Responder shall support handling such messages from more than one Requester. The Requester shall support making requests to more than one Responder.

##### 2:3.Y3.4.1.1 Trigger Events

The Requester needs to obtain DiagnosticReport Resources matching various metadata parameters.

##### 2:3.Y3.4.1.2 Message Semantics

This message is a HTTP GET or HTTP POST request. The Requester is the User Agent. The Responder is the Origin Server.

The Requester executes an HTTP search against the Responder DiagnosticReport URL. The search target follows the FHIR HTTP specification, addressing the DiagnosticReport Resource [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html):
```
[base]/DiagnosticReport?<query>
```
This URL is configurable by the Responder and is subject to the following constraints: 

The `[base]` is the [Service Base URL](https://www.hl7.org/fhir/http.html#root), which is the address where all of the resources defined by this interface are found.

The `<query>` contains a series of encoded name-value pairs representing the filter for the query, as specified in Section [Query Search Parameters](#query-parameters), as well as control parameters to modify the behavior of the Responder such as response format, or pagination.

https://www.hl7.org/fhir/search.html#revinclude

> Note: The Requester may use the same search parameters specified below to specify other search criteria beyond what IMR DiagnosticReport is required. For example, DiagnosticReport.basedOn may also reference a CarePlan and the Requester may search for DiagnosticReport that referenced specific CarePlan.

###### 2:3.Y3.4.1.2.1 Query Search Parameters <a name="query-parameters"> </a>

All query parameter values shall be appropriately encoded per RFC3986 “percent” encoding rules. Note that percent encoding does restrict the character set to a subset of ASCII characters which is used for encoding all other characters used in the URL.

The query search parameters supported by the Requester and Responder are defined in Table 2:3.Y3.4.1.2.1-1 below.

Table 2:3.Y3.4.1.2.1-1 Find Multimedia Report Query Search Parameters

| Domain   | Attribute | Search Parameters | Query Type | Requester Optionality | Responder Optionality | Note |
|----------|-----------|-------------------|------------|-----------------------|-----------------------|------|
| Patient | Patient | `subject` | Reference(Patient) | R | R | See Note 1 |
|         | Patient ID | `subject.identifier` | token | R | R | See Note 2 and 3 |
|         | Patient Name | `subject.name.given` <br> `subject.name.family` | string | O | R | See Note 3 |
| ServiceRequest | ServiceRequest | `basedOn` | Reference(ServiceRequest) | R | R | See Note 1 |
|                | Accession Number | `basedOn.identifier` | token | R | R | See Note 2 and 3 |
| Study | Study | `imagingStudy` | Reference(ImagingStudy) | R | R | See Note 1 |
|       | Study Instance UID | `imagingStudy.identifier` | token | R | R | See Note 2 and 3 |
| Report | Status | `status` | token | R | R | See Note 2 |
|        | Category | `category` | token | O | O | See Note 2 |
|        | EffectiveDateTime | `effectiveDateTime` | datetime | O | O | See Note 4 |
|        | Issued | `issued` | instant | O | O | See Note 4 |
|        | Code | `code` | token | O | O | See Note 2 |
|        | Result Interpreter | `resultsInterpreter` | Reference(Practitioner or PractitionerRole) | O | O | See Note 1 |
|        | Result Interpreter ID | `resultsInterpreter.identifier` <br> `resultsInterpreter.practitioner.identifier` | token | O | O | See Note 2 and 3 |
{: .grid}

> Note 1: See FHIR [http://hl7.org/fhir/R4/search.html#reference](http://hl7.org/fhir/R4/search.html#reference) for use of the reference search type.
>
> Note 2: See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.
>
> Note 3: See [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) for search methodology on referenced resources.
>
> Note 4: See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the datetime search type.

###### 2:3.Y3.4.1.2.2 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Responder shall support both message encodings, whilst the Requester shall support one and may support both.

See [ITI TF-2x: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details. 

###### 2:3.Y3.4.1.2.3 Example DiagnosticReport search

For example given:
* FHIR server root is `http://test.fhir.org/R4/fhir`
* Patient reference id is `9876`
* status of final
* with clinical code from LOINC of `1234-5`
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

The Responder shall be capable of processing, all query parameters according to Table 2:3.Y3.4.1.2.1-1 above.

The Responder shall process the query to discover the DiagnosticReport entries that match the search parameters given. 

The Responder shall support both GET and POST-based searches [http://hl7.org/fhir/R4/http.html#search](http://hl7.org/fhir/R4/http.html#search).

The Responder shall implement the parameters described above. The Responder may choose to support additional query parameters beyond the subset listed above. Any additional query parameters supported shall be supported according to the core FHIR specification. Such additional parameters are considered out of scope for this transaction. Any parameters not supported should be ignored. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors).

#### 2:3.Y3.4.2 Return DiagnosticReport Bundle Message

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
