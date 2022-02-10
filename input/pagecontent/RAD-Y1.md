### 2:3.Y1.1 Scope

This transaction is used to pass a Provide Multimedia Report Bundle Request from a Report Creator to a Report Repository.

### 2:3.Y1.2 Actors Roles

The roles in this transaction are defined in the following table and may be palyed by the actors shown here:

**Table 2:3.Y1.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Sender    | Request a Provide Multimedia Report Bundle    | Report Creator    |
| Receiver  | Process a request and store the report bundle | Report Repository |
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:3.Y1.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

**HTML 5**

**PDF/A**

### 2:3.Y1.4 Messages

<div>
{%include RAD-Y1-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.Y1.4-1: Interaction Diagram**

#### 2:3.Y1.4.1 Provide Multimedia Report Bundle
The Sender sends a multimedia report bundle to the Receiver.

The Receiver shall support handling such messages from more than one Sender. The Sender shall support making requests to more than one Receiver.

##### 2:3.Y1.4.1.1 Trigger Events

When a radiologist completed a dictation on a study and signed off the report. This trigger is associated with an intention that the Receiver stores the multimedia report contents and makes it available for subsequent query and retrieve requests.

##### 2:3.Y1.4.1.2 Message Semantics

This message is a HTTP POST request. The Sender is the User Agent. The Receiver is the Origin Server.

The Sender shall initiate a FHIR “transaction” using a “create” action by sending an HTTP POST request method composed of a FHIR Bundle Resource containing the following:
- one DiagnosticReport Resource
- one or more ServiceRequest Resources
- one Patient Resource
- one or more Organization Resources
- one or more Practitioner Resources
- one or more Observation Resources
- one or more ImagingStudy Resources

The media type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

See [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction) for complete requirements of a transaction. See [http://hl7.org/fhir/R4/bundle-transaction.html](http://hl7.org/fhir/R4/bundle-transaction.html) for example of a transaction bundle.

The Provide Multimedia Report Bundle message is sent to the base URL as defined in FHIR. See [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) for the definition of “HTTP” access methods and “base”.

###### 2:3.Y1.4.1.2.1 Bundle Resources

For complete information on constructing a FHIR Bundle Resource, see [http://hl7.org/fhir/R4/bundle.html](http://hl7.org/fhir/R4/bundle.html)

The FHIR Bundle.meta.profile shall have the following value: 
- [IMR Bundle](StructureDefinition-imr-bundle.html): `http://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-bundle`
  - shall be a Transaction Bundle
  - shall create one [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html)
  - may create/update/read one or more [IMR ServiceRequest](StructureDefinition-imr-servicerequest.html)
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)
  - may create/read one or more [Organization](http://hl7.org/fhir/R4/organization.html)
  - may create/read one or more [Practitioner](http://hl7.org/fhir/R4/practitioner.html)
  - may create/read one or more [IMR Observation](StructureDefinition-imr-observation.html)
  - may create/read one or more [IMR ImagingStudy](StructureDefinition-imr-imagingstudy.html)

Since each resource in the bundle is self-sufficient and are valuable as standalone resources outside the context of the DiagnosticReport resource (e.g. independently searchable and same resource can be referenced multiple times), the Sender should create corresponding properly identifiable resources unless the proper record keys or absolute identification information is not available.

When resources are `contained`, they shall be contained using the FHIR contained method (see [http://hl7.org/fhir/R4/references.html#contained](http://hl7.org/fhir/R4/references.html#contained) ).

For the pre-rendered report referenced by DiagnosticReport.presentedForm, the Sender shall support one the following:
- The report is treated as a base64Binary and set in the DiagnosticReport.presentedForm.data
- The report is conveyed as a [Binary Resource](https://www.hl7.org/fhir/binary.html) and this Binary Resource is referenced in DiagnosticReport.presentedForm.url.
- The report is hosted somewhere else and not as a Binary Resource. It is referenced in DiagnosticReport.presentedForm.url.

When the DiagnosticReport.presentedForm.url points at a Binary Resource, the Binary Resource shall be in the Bundle. See FHIR Resolving references in Bundles at [http://hl7.org/fhir/R4/bundle.html#references](http://hl7.org/fhir/R4/bundle.html#references). 

The Sender shall populate accurate .hash and .size for the report content in presentedForm: 
* Where the presentedForm is a Binary Resource instance, the .hash and .size measure the raw artifact that has been base64encoded in the Binary.data element.  
* Where the presentedForm is hosted elsewhere, not as a Binary Resource, the .hash and the .size shall represent the report content that would be retrieved using the mime-type specified in contentType element. 

Patient would typically only be allowed by the Receiver in PUSH interaction situations, but may be accepted for other reasons at the discretion of the Receiver actor policy.

The following subsections describe the details requirements for each referenced resource in the bundle. A complete example of a DiagnosticReport is available in [IMR DiagnostReport Example](DiagnosticReport-ex-DiagnosticReport.json.html).

###### 2:3.Y1.4.1.2.2 Observation

All clinical findings and impressions shall be encoded using [IMR Observation](StructureDefinition-imr-observation.html).

The Sender shall encode each impression as a separate IMR Observation resource. The Sender may encode each finding as a separate IMR Observation resource, or include all findings in a single IMR Observation resource.

The Observation.valueString shall be used to capture unstructured contents. Structured contents shall use the best data type in Observation.value[x] to capture the content.

If image references are available for the observation, then Observation.derivedFrom shall be used to capture study, series and image references using [IMR ImagingStudy](StructureDefinition-imr-imagingstudy.html) resource. In other words, this IMR ImagingStudy resource used in Observation.derivedFrom captures a subset of the series and images in study where the values in the observation are derived from.

Furthermore, image references can be directly referenced inline the findings or impressions. These image references shall be encoded using <IMRRef></IMRRef> markup. Each IMRRef tag has two attributes:

| Attribute | Description |
|-----------|-------------|
| type      | Type of multimedia content |
| id        | Maps to component.id in the same Observation resource |
{: .grid}

For the corresponding Observation.component that matches the id value,
- the Observation.component.valueString shall have the value for the series and instance reference in the format /series/{seriesUID}/instance/{sopInstanceUID},
- the Observation.component.code shall have the coded value (112002, "http://dicom.nema.org/resources/ontology/DCM", "Series Instance UID")

Since there are many variations of finding types and IMR is designed to be general purpose rather than specific to a particular procedure type, therefore no specific encoding requirements are defined. With this said, informative examples are available at [IMR Observation Examples](StructureDefinition-imr-observation-examples.html) to demonstrate the possible encoding of different kinds of observations.

###### 2:3.Y1.4.1.2.2 Report Attachment

The [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html) resource shall have a default rendered diagnostic report in HTML format in the presentedForm attribute. The presentedForm.contentType shall have the value "text/html". Additional pre-rendered reports may be included.

For observations that have image references using Observation.derivedFrom attribute,
- If the image references are not inline of the Observation.value[x], then the Sender shall add a hyperlink using the HTML anchor element (i.e. <a>), with the display text for the hyperlink being the corresponding value[x]. The value for href for this hyperlink shall be based on the endpoint(s) defined in the referenced [IMR ImagingStudy]((StructureDefinition-imr-imagingstudy.html)).
- If the image references are inline of Observation.valueString, then the Sender shall substitute the <IMRRef>...</IMRRef> markup with the anchor element. The href attribute shall be set to the concatenation of the ImagingStudy.endpoint.address with the valueString from the matching Observation.component entry. The resulting URL shall be a valid URL according to the contentType.

For Senders that claim support of the PDF Report Option, if the PDF Report feature is enabled in the Sender, then the Sender shall also attach another semantically equivalent diagnostic report in PDF format in the presentedForm attribute. The presentedForm.contentType shall have the value "application/pdf". The PDF Report shall include all text and hyperlinks as in the HTML report.

For Senders that claim support of the HL7 Text Report Option, if the HL7 Text Report feature is enabled in the Sender, then the Sender shall also attach another semantically equivalent diagnostic report in Rich Text format in the presentedForm attribute. The presentedForm.contentType shall have the value "application/rtf". The HL7 Text Report shall include all text (excluding the HTML markup) as in the HTML report, without the hyperlinks.

##### 2:3.Y1.4.1.3 Expected Actions

The Receiver shall accept both media types `application/fhir+json` and `application/fhir+xml`.

On receipt of the request, the Receiver shall validate the resources and respond with one of the HTTP codes defined in the response [Message Semantics](#2365412-message-semantics). 

The Receiver shall process the bundle atomically, analogous to the FHIR “transaction” as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

The Receiver shall validate the bundle first against the FHIR specification. Guidance on what FHIR considers a valid Resource can be found at [http://hl7.org/fhir/R4/validation.html](http://hl7.org/fhir/R4/validation.html). 

Once the bundle is validated, the Receiver shall store the report and all associated resources.

A Receiver is allowed to be robust for non-compliant resources that violate the the IMR resources requirements. 

If necessary for processing, the Receiver shall retrieve Resources referenced by absolute URLs in the FHIR Bundle Resource.

The Receiver may extract the embedded pre-rendered report(s) in DiagnosticReport.presentedForm.data, store them and substitute the corresponding DiagnosticReport.presentedForm with a URL (i.e. DiagnosticReport.presentedForm.url) instead. The Receiver shall maintain the integrity of the report if the report is extracted.

If the Receiver encounters any errors or if any validation fails, the Receiver shall return an appropriate error.

#### 2:3.Y1.4.2 Multimedia Report Bundle Response Message

The Receiver returns a HTTP Status code appropriate to the processing outcome, conforming to the transaction specification requirements as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

##### 2:3.Y1.4.2.1 Trigger Events

This message shall be sent when a success or error condition needs to be communicated. Success is only indicated once the multimedia report is received and completely processed and persisted as appropriate to the Receiver configuration. 

##### 2:3.Y1.4.2.2 Message Semantics

To enable the Sender to know the outcome of processing the transaction, and the identities assigned to the resources by the Receiver, the Receiver shall return a Bundle, with `type` set to `transaction-response`, that contains one entry for each entry in the request, in the same order as received, with the `Bundle.entry.response.outcome` indicating the results of processing the entry warnings such as PartialFolderContentNotProcessed. The Receiver shall comply with FHIR [http://hl7.org/fhir/R4/bundle.html#transaction-response](http://hl7.org/fhir/R4/bundle.html#transaction-response) and [http://hl7.org/fhir/R4/http.html#transaction-response](http://hl7.org/fhir/R4/http.html#transaction-response). 

To indicate success the overall http `200` response is used. The `Bundle.entry.response.status` shall be `201` to indicate the Resource has been created, the `.location` element shall be populated, and the `.etag` element may be populated if the Receiver supports FHIR resource versioning.

An informative StructureDefinition is outlined for [IMR Provide Report Bundle Response Message](StructureDefinition-imr-provide-report-bundle-response.html).

##### 2:3.Y1.4.2.3 Expected Actions

If the Receiver returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Sender shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The Sender processes the results according to application-defined rules.	

#### 2:3.Y1.4.3 CapabilityStatement Resource

Document Recipient shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

### 2:3.Y1.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

Given that the Sender is responsible for the URL placed into presentedForm.url if external reference is used, care must be taken to assure that manipulation of this URL prior to any retrieval requests does not expose resources the Report Reader should not have access to.

#### 2:3.Y1.5.1 Security Audit Considerations

This transaction is associated with a Patient-Care-Episode ATNA Trigger Event on both the Sender and the Receiver.