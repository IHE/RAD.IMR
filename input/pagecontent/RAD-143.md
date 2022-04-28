### 2:4.143.1 Scope

This transaction is used to find DiagnosticReport Resources that satisfy a set of parameters.

### 2:4.143.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:4.143.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Requester | Request DiagnosticReports that match a filter         | Report Reader <br> Rendered Report Reader |
| Responder | Return matching DiagnosticReports  | Report Repository |
{: .grid}

### 2:4.143.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

**FHIR-R4 Search** [HL7 FHIR Search](https://www.hl7.org/fhir/search.html)

### 2:3.143.4 Messages

<div>
{%include RAD-143-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.143.4-1: Interaction Diagram**

#### 2:4.143.4.1 Find Multimedia DiagnosticReports Message

The Requester provides a matching filter in a request for matching DiagnosticReport that are available on the Responder. The Requester shall support sending such messages to more than one Responder.

The Responder shall support handling such messages from more than one Requester. 

##### 2:4.143.4.1.1 Trigger Events

The Requester needs to obtain DiagnosticReport Resources matching various metadata parameters.

##### 2:4.143.4.1.2 Message Semantics

This message is an HTTP GET or HTTP POST request. The Requester is the User Agent. The Responder is the Origin Server.

The Responder shall support both HTTP GET and HTTP POST request. The Requester may choose either form of request.

The Requester shall be capable of executing an HTTP search against the Responder DiagnosticReport URL. The search target follows the [FHIR HTTP](http://hl7.org/fhir/http.html) specification, addressing the DiagnosticReport Resource:
```
[base]/DiagnosticReport?<query>
```
The Requester shall construct the URL according to following constraints: 

- The `[base]` shall be the [Service Base URL](https://www.hl7.org/fhir/http.html#root), which is the address where all of the resources defined by this interface are found.

- The `[base]` shall be configurable

- The `<query>` shall contain a series of encoded name-value pairs representing the filter for the query, as specified in Section [Query Search Parameters](#241434121-query-search-parameters)

- The `<query>` may contain additional search result parameters to request modified behavior of the Responder such as response format, pagination, summary, subset of elements, etc.. See [FHIR Search](https://www.hl7.org/fhir/search.html#Summary) for details.

> Note: The Responder may not support any of the additional search result parameters.

> Note: The Requester may use the same search parameters specified below to specify other search criteria beyond what IMR DiagnosticReport is required. For example, DiagnosticReport.basedOn may also reference a CarePlan and the Requester may search for DiagnosticReports that referenced specific CarePlan.

###### 2:4.143.4.1.2.1 Query Search Parameters

All query parameter values shall be encoded per RFC3986 “percent” encoding rules. Note that percent encoding restrict the character set to a subset of ASCII characters. Certain ASCII characters used for URL syntax are not permitted in the query parameter value and need to be escaped.

The Requester shall be capable of providing the parameters attributes and query types as indicated by Requester Optionality 'R' in Table 2:4.143.4.1.2.1-1 below.

The Responder shall support the parameters attributes and query types as indicated by Responder Optionality 'R' in Table 2:4.143.4.1.2.1-1 below.

**Table 2:4.143.4.1.2.1-1 Find Multimedia Report Query Search Parameters**

| Domain   | Attribute | Search Parameters <br> See Note 3 | Query Type <br> See Note 1, 2 and 4 | Requester Optionality | Responder Optionality |
|----------|-----------|-------------------|------------|-----------------------|-----------------------|
| Patient | Patient | `subject` | Reference(Patient) | R | R |
|         | Patient ID | `subject.identifier` | token | R | R |
|         | Patient Name | `subject.name.given` <br> `subject.name.family` | string | O | R |
| ServiceRequest | ServiceRequest | `basedOn` | Reference(ServiceRequest) | R | R |
|                | Accession Number | `basedOn.identifier` | token | R | R |
| Study | Study | `imagingStudy` | Reference(ImagingStudy) | R | R |
|       | Study Instance UID | `imagingStudy.identifier` | token | R | R |
|       | Modality | `imagingStudy.modality` <br> `imagingStudy.series.modality` | token | R | R |
|       | Study Date | `imagingStudy.started` | date | R | R |
| Report | Status | `status` | token | R | R |
|        | Category | `category` | token | O | O |
|        | Code | `code` | token | O | O |
|        | Result Interpreter | `resultsInterpreter` | Reference(Practitioner or PractitionerRole) | O | O |
|        | Result Interpreter ID | `resultsInterpreter.identifier` <br> `resultsInterpreter.practitioner.identifier` | token | O | O |
| All | *Any other attributes* | *Other attributes in DiagnosticReport* | *varies* | O | O |
{: .grid}

> Note 1: See FHIR [http://hl7.org/fhir/search.html#reference](http://hl7.org/fhir/search.html#reference) for use of the reference search type.
>
> Note 2: See [ITI TF-2: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.
>
> Note 3: See [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) for search methodology on referenced resources.
>
> Note 4: See FHIR [http://hl7.org/fhir/search.html#date](http://hl7.org/fhir/search.html#date) for use of the date search type.

###### 2:4.143.4.1.2.2 Example DiagnosticReport search

For example given:
* FHIR server root is `http://test.fhir.org/fhir`
* desired Patient reference id is `9876`
* status of desired report to be final
* with clinical code `1234-5` from LOINC

The examples belows omitted some http headers such as the security headers for simplicity.

###### 2:4.143.4.1.2.2.1 Example GET
```
GET test.fhir.net/fhir/DiagnosticReport?subject=Patient/9876&status=final&code=http://loinc.org|1234-5
```

###### 2:4.143.4.1.2.2.2 Example POST
```
POST test.fhir.net/fhir/DiagnosticReport/_search?subject=Patient/9876&status=final&code=http://loinc.org|1234-5
```

###### 2:4.143.4.1.2.2.3 Example POST body
```
POST test.fhir.net/fhir/DiagnosticReport/_search	  
Host test.fhir.net
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0										  

subject=Patient/9876&status=final&code=http://loinc.org|1234-5
```

##### 2:4.143.4.1.3 Expected Actions

The Responder shall process the query to discover the DiagnosticReport entries that match the search parameters given. 

The Responder shall support both GET and POST-based searches [http://hl7.org/fhir/http.html#search](http://hl7.org/fhir/http.html#search).

The Responder shall be capable of processing all query parameters according to Table 2:4.143.4.1.2.1-1.

The Responder may choose to support additional query parameters. Any additional query parameters supported shall be supported according to the core FHIR specification. See [http://hl7.org/fhir/search.html#errors](http://hl7.org/fhir/search.html#errors).

###### 2:4.143.4.1.3.1 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Responder shall support both message encodings; the Requester shall support one and may support both.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details.

#### 2:4.143.4.2 Return DiagnosticReports Bundle Message

The Responder sends matching entries back to the Requester.

##### 2:4.143.4.2.1 Trigger Events

The Responder completed processing of the Find Multimedia DiagnosticReport Request message. 

##### 2:4.143.4.2.2 Message Semantics

The message is an HTTP GET or HTTP POST response. The Requester is the User Agent. The Responder is the Origin Server.

The Responder returns an HTTP Status code appropriate to the processing as well as a Bundle of the matching DiagnosticReport Resources.

The Responder may refuse or impose reasonable limits if a query is overly broad. The Responder may restrict results based on the authorization of the Requester, or based on other server implementation decisions.

Based on the query results, the Responder shall either return an error or success. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations). 

When the Responder needs to report an error, it shall use HTTP error response codes and should include a FHIR OperationOutcome with more details on the failure. See FHIR [http://hl7.org/fhir/http.html](http://hl7.org/fhir/http.html) and [http://hl7.org/fhir/operationoutcome.html](http://hl7.org/fhir/operationoutcome.html).

If the Find Multimedia DiagnosticReport message is processed successfully, whether or not any DiagnosticReport Resources are found, the HTTP status code shall be 200. The Return DiagnosticReport Bundle message shall be a Bundle Resource containing zero or more DiagnosticReport Resources. If the Responder is sending warnings, the Bundle Resource shall also contain an OperationOutcome Resource that contains those warnings.

The Responder shall return the query results in the encoding (XML or JSON) specified by the Requester.

The response shall adhere to any FHIR Bundle constraints specified in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

The Responder shall return the full content of matching DiagnosticReport resources in the returned bundle. The Responder may support additional search result parameters (e.g., _summary, _elements, _include, etc.) and return the modified results accordingly.

###### 2:4.143.4.2.2.1 DiagnosticReport Resource Contents

The DiagnosticReport Resources returned shall be compliant with the [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html) profile.

###### 2:4.143.4.2.2.2 Resource Bundling

Resource Bundling shall comply with the guidelines in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). 

#### 2:3.144.4.3 Expected Actions

If the Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Requester shall follow the redirect, but may stop processing if it detects a loop. See RFC7231 Section 6.4 Redirection 352.

The Requester shall process the results according to application-defined rules.

The Requester may show the attributes in the query response to the user.

#### 2:4.143.4.4 CapabilityStatement Resource

Requesters and Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

- Requirements CapabilityStatement for the [Requester](CapabilityStatement-IHE.IMR.ReportReader.html).

### 2:4.143.5 Security Considerations

This transaction should not return information that the Requester is not authorized to access. Where authorization here is inclusive of system, app, and user according to local policy, patient consents, and security layering. However, the transaction may return DiagnosticReport resources that have Reference elements that the Requester may not have access to. This is to say that the authorization need only be to the content returned in the Bundle. There may be references (URLs) for which the Requester is not authorized to access the content. This is considered proper as the Requester would need to retrieve the content pointed to by those references, and at that time the proper authorization decision would be made on that context and content. In this way it is possible for a Requester to get DiagnosticReport resources that are pointing at data that the Requester is not authorized to retrieve. Thus, the URLs used must be carefully crafted so as to not expose sensitive data in the URL value.

Search using GET may include sensitive information in the search parameters. Therefore, secure communications and endpoint management are recommended.

#### 2:4.143.5.1 Security Audit Considerations

This transaction is associated with a 'Query Information' ATNA Trigger Event on both the Requester and the Responder.  See [ITI TF-2: 3.20.4.1.1.1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html#3.20.4.1.1.1).
