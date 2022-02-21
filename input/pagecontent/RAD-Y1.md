### 2:3.Y1.1 Scope

This transaction is used to store multimedia report from a Report Creator to a Report Repository.

### 2:3.Y1.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:3.Y1.2-1: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Sender    | Request a Provide Multimedia Report Bundle    | Report Creator    |
| Receiver  | Process a request and store the report bundle | Report Repository |
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:3.Y1.3 Referenced Standards

**FHIR-R4**: [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

**HTML 5**: [HTML Living Standard](https://html.spec.whatwg.org/multipage/)

**PDF/A**: [ISO 19005-1:2005](https://www.iso.org/standard/38920.html)

### 2:3.Y1.4 Messages

<div>
{%include RAD-Y1-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.Y1.4-1: Interaction Diagram**

#### 2:3.Y1.4.1 Provide Multimedia Report Bundle Message
The Sender sends a multimedia report bundle to the Receiver.

The Receiver shall support handling such messages from more than one Sender. The Sender shall support making requests to more than one Receiver.

##### 2:3.Y1.4.1.1 Trigger Events

A radiologist completed a dictation on a study and signed off the report. This trigger is associated with an intention that the Receiver stores the multimedia report contents and makes it available for subsequent query and retrieve requests.

##### 2:3.Y1.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Receiver is the Origin Server.

The Sender shall initiate a FHIR “transaction” using a “create” action by sending an HTTP POST request method composed of a FHIR Bundle Resource containing the following:
- one DiagnosticReport Resource
- one or more ServiceRequest Resources
- one Patient Resource
- one or more Organization Resources
- one or more Practitioner Resources
- one or more Observation Resources
- one or more ImagingStudy Resources

The media type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

See [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction) for complete requirements of a FHIR transaction. See [http://hl7.org/fhir/R4/bundle-transaction.html](http://hl7.org/fhir/R4/bundle-transaction.html) for an example of a transaction bundle.

The Provide Multimedia Report Bundle message is sent to the base URL as defined in FHIR. See [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) for the definition of “HTTP” access methods and “base”.

###### 2:3.Y1.4.1.2-1 Critical Attributes in Radiology Diagnostic Report <a name="CriticalAttributes"> </a>

In radiology reports, there is a common set of values to be included. The following table specifies how the Sender shall map these attributes to FHIR DiagnosticReport resource and other referenced resources. Refer to the StructureDefinition for these resources in the Artifacts page for details.

Table 2:3.Y1.4.1.2-1: Mapping of Critical Attributes in Radiology Diagnostic Report

| Report Attribute | FHIR Resource Mapping | Cardinality | Additional Constraint | Note |
|------------------|-----------------------|-------------|-----------------------|------|
| Organization     | DiagnosticReport.performer | 1..1 | | Deployment applicable Organization Profile should be applied |
| Results Interpreter | DiagnosticReport.resultsInterpreter | 1..* | Can be either Practitioner or PractitionerRole | Deployment applicable Practitioner or PractitionerRole Profile should be applied |
| Patient Name     | DiagnosticReport.subject -> Patient.name | 1..1 -> 0..* |   | Deployment applicable Patient Profile should be applied       |
| Patient MRN      | DiagnosticReport.subject -> Patient.identifier | 1..1 -> 0..* | | Deployment applicable Patient Profile should be applied |
| Accession Number | DiagnosticReport.basedOn -> IMRServiceRequest.identifier | 1..* -> 1..* | identifier.type has a code for Accession Number | |
| Study Date       | DiagnosticReport.imagingStudy -> IMRImagingStudy.started | 1..1 -> 1..1 | | |
| Study Type       | DiagnosticReport.imagingStudy -> IMRImagingStudy.procedureCode | 1..1 -> 0..* | | |
| Report Status    | DiagnosticReport.status | 1..1 | partial, preliminary, final, amended, corrected, appended, cancelled | A subset from what is defined in FHIR |
| Examination      | DiagnosticReport.code | 1..1 | | Code for the diagnostic report, may be the same as the study procedure code |
| Indication       | DiagnosticReport.extension[indication] | 0..* | | Each value can be either a string or a CodeableConcept |
| Technique        | DiagnosticReport.result -> IMRObservation.method | 1..* -> 0..1 | IMRObservation.code = LOINC#59776-5 "Procedure Findings" | |
| Comparison       | DiagnosticReport.extension[comparisonStudy] | 0..* | Can be either an IMRImagingStudy or IMRDiagnosticReport | |
| Findings         | DiagnosticReport.result -> IMRObservation.valueString | 1..* | LOINC#59776-5 "Procedure Findings" | Highly recommended to encode a single finding per observation, but acceptable to encode all findings as a single string to bridge existing applications |
| Impressions      | DiagnosticReport.result -> IMRObservation.valueString | 1..* | IMRObservation.code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)" | Highly recommended to encode a single impression per observation, but acceptable to encode all impressions as a single string to bridge existing application. Also it is highly recommended to use coded values whenever applicable.|
{: .grid}

In addition to the common set above, there are also a number of useful optional attributes that can be used if applicable.

Table XX.4.1.7-2: Useful Optional Attributes in Radiology Diagnostic Report

| Report Attribute | FHIR Resource Mapping | Cardinality | Additional Constraint | Note |
|------------------|-----------------------|-------------|-----------------------|------|
| Referring Physician | DiagnosticReport.imagingStudy -> IMRImagingStudy.referrer | 0..* | |
| Reason For Study | DiagnosticReport.imagingStudy -> IMRImagingStudy.reasonCode | 0..* | |
| Study Description | DiagnosticReport.imagingStudy -> IMRImagingStudy.description | 0..* | |
{: .grid}

###### 2:3.Y1.4.1.2.1 Bundle Resources

For complete information on constructing a FHIR Bundle Resource, see [http://hl7.org/fhir/R4/bundle.html](http://hl7.org/fhir/R4/bundle.html)

The FHIR Bundle.meta.profile shall have the following value: `http://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-bundle`
- The [IMR Bundle](StructureDefinition-imr-bundle.html): 
  - shall be a Transaction Bundle
  - shall create one [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html)
  - may create/update/read one or more [IMR ServiceRequest](StructureDefinition-imr-servicerequest.html)
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)
  - may create/read one or more [Organization](http://hl7.org/fhir/R4/organization.html)
  - may create/read one or more [Practitioner](http://hl7.org/fhir/R4/practitioner.html)
  - may create/read one or more [IMR Observation](StructureDefinition-imr-observation.html)
  - may create/read one or more [IMR ImagingStudy](StructureDefinition-imr-imagingstudy.html)

The Sender may set meta.profile of each resource to be the corresponding IMR profile. This enables the recipients to validate the received resource against the IMR resource profile specification.

> Note that a Sender may choose not to set meta.profile to a specific profile, or may set it to multiple profiles.

Since each resource in the bundle is valuable as standalone resources outside the context of the DiagnosticReport resource (e.g. independently searchable and same resource can be referenced multiple times), the Sender should create corresponding properly identifiable resources unless the proper record keys or absolute identification information is not available.

When resources are `contained`, they shall be contained using the FHIR contained method (see [http://hl7.org/fhir/R4/references.html#contained](http://hl7.org/fhir/R4/references.html#contained) ).

The Sender shall encode the rendered report that is referenced by DiagnosticReport.presentedForm in one of the following ways:
- Encode the report as a base64Binary in DiagnosticReport.presentedForm.data
- Encode the report as a base64Binary in a [Binary Resource](https://www.hl7.org/fhir/binary.html) and this Binary Resource is referenced in DiagnosticReport.presentedForm.url.
  - The Binary Resource shall be in the Bundle. See FHIR Resolving references in Bundles at [http://hl7.org/fhir/R4/bundle.html#references](http://hl7.org/fhir/R4/bundle.html#references). 
- Host the report somewhere and provide the url in DiagnosticReport.presentedForm.url.

The Sender shall populate accurate .hash and .size for the report content in presentedForm: 
* Where the presentedForm is a Binary Resource instance, the .hash and .size measure the raw artifact that has been base64encoded in the Binary.data element.  
* Where the presentedForm is hosted elsewhere, not as a Binary Resource, the .hash and the .size shall represent the report content that would be retrieved using the mime-type specified in contentType element. 

The following subsections describe the details requirements for each referenced resource in the bundle. A complete example of a DiagnosticReport is available in [IMR DiagnosticReport Example](DiagnosticReport-ex-DiagnosticReport.json.html).

###### 2:3.Y1.4.1.2.2 Observation

The Sender shall set the code attribute according to the IMR Observation specification indicating if the observation is a finding or impression or some other types.

The Sender shall encode each impression as a separate [IMR Observation](StructureDefinition-imr-observation.html) resource. See [IMR Observation Examples](StructureDefinition-imr-observation-examples.html) for examples that encode different impression as different IMR Observation resources.

The Sender shall encode all clinical findings using IMR Observation resources. Each finding may be encoded as a separate IMR Observation resource, or all findings may be included in a single IMR Observation resource as an unstructured content in Observation.valueString. See [IMR Observation Examples](StructureDefinition-imr-observation-examples.html) for an example that encodes multiple findings in paragraph form in a single IMR Observation resources.

The Sender shall encode unstructured content in Observation.valueString.

The Sender shall encode structured content using the appropriate data type available in Observation.value[x].

###### 2:3.Y1.4.1.2.2.1 Image References in Observation

The Sender shall encode the study in which this observation is derived from, if available, in Observation.derivedFrom using an [IMR ImagingStudy](StructureDefinition-imr-imagingstudy.html) resource. This attribute shall include the study and series references. This attribute may include image references.

For unstructured content, one or more image references can be directly embedded inline the text. The Sender shall encode an inline image reference as follow:

- Begin with an `<IMRRef>` XML tag. Each `<IMRRef>` tag has two attributes:

| Attribute | Description |
|-----------|-------------|
| type      | Type of multimedia content. Value can be 'image' |
| id        | Maps to component.id in the same Observation resource |
{: .grid}

- End with an `</IMRRef>` XML end tag.

The Sender shall encode the referenced image in `<IMRRef>` using Observation.component as follow:
- Observation.component.id shall match the `id` attribute in the `<IMRRef>` tag
- Observation.component.valueString shall have the value for the series instance UID and SOP Instance UID in the format `/series/{seriesUID}/instance/{sopInstanceUID}`,
- Observation.component.code shall have the coded value (112002, "http://dicom.nema.org/resources/ontology/DCM", "Series Instance UID")

> Note: The current design of Observation only supports a single image reference for each inline reference using the `<IMRRef>` tag. FHIR is working on a new ImageSelection resource which supports multiple key images as well as image region. It is the intention of IMR that when ImageSelection becomes available, IMR will be updated to support it.

> Note: The current design of DiagnosticReport does not define how the different attributes should be presented in what order, except for the presentedForm. FHIR is working on integrating DiagnosticReport with Composition, which enables an explicit control of sections. It is the intention of IMR that when Composition is integrated with DiagnosticReport, IMR will be updated to support it.

Informative examples are available at [IMR Observation Examples](StructureDefinition-imr-observation-examples.html) to demonstrate the possible encoding of different kinds of observations.

###### 2:3.Y1.4.1.2.2 Report Attachment

The Sender shall include a default rendered diagnostic report in HTML format in the DiagnosticReport.presentedForm attribute. The presentedForm.contentType shall have the value "text/html".

For IMR Observations that have image references using Observation.derivedFrom attribute, the Sender shall add a hyperlink using the HTML anchor element (i.e. `<a>`), with the display text for the hyperlink being the corresponding value[x] in a clinically relevant textual representation. The value for href for this hyperlink shall be constructed based on the endpoint(s) defined in the referenced [IMR ImagingStudy]((StructureDefinition-imr-imagingstudy.html)) resource.

For inline image references in Observation.valueString, the Sender shall substitute each `<IMRRef>`...`</IMRRef>` markup with an HTML anchor element. The href attribute shall be set to the concatenation of the ImagingStudy.endpoint.address with the valueString from the matching Observation.component.id entry. The resulting URL shall be a valid URL according to the contentType.

The resulting URLs, upon invocation, shall result in some rendered content rather than contents that will be downloaded. For example, using a WADO-RS link with rendered image is appropriate while a plain WADO-RS link to retrieve DICOM object is not.

The Sender may include additional rendering of the same report (e.g. PDF).

For Senders that claim support of the PDF Report Option, if the PDF Report feature is enabled in the Sender, then in addition to the HTML report, the Sender shall also attach a semantically equivalent diagnostic report in PDF format in the presentedForm attribute. The presentedForm.contentType shall have the value "application/pdf". The Sender shall include in the PDF report all text and hyperlinks as in the HTML report.

The Sender may include other rendered reports in presentedForm. The Sender shall set the presentedForm.contentType with an appropriate value corresponding to the rendered report format.

###### 2:3.Y1.4.1.2.3 Patient, Organization, Practitioner, PractitionerRole

The Patient, Organization, Practitioner or PractitionerRole resources are required resources. However, IMR does not specify any profiles on these resource. The expectation is that these resources are not radiology or imaging specific. Real world deployment may specify profiles on these resources.

##### 2:3.Y1.4.1.3 Expected Actions

The Receiver shall accept both media types `application/fhir+json` and `application/fhir+xml`.

On receipt of the request message, the Receiver shall validate the resources and respond with one of the HTTP codes defined in the response [Message Semantics](#2365412-message-semantics). 

The Receiver shall process the bundle atomically, analogous to the FHIR “transaction” as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

> Note: A Receiver may not allow resources such as Patient, Organization, Practitioner, etc. referenced within the bundle that are unknown to the Receiver. A Receiver may support "conditional create" semantics (currently in trial use as defined in [FHIR RESTful API](https://www.hl7.org/fhir/http.html#create). Therefore the actual behavior is at the discretion of the Receiver actor policy.

The Receiver shall validate the bundle first against the FHIR specification. Guidance on what FHIR considers a valid Resource can be found at [http://hl7.org/fhir/R4/validation.html](http://hl7.org/fhir/R4/validation.html). 

Once the bundle is validated, the Receiver shall store the report and all associated resources.

A Receiver is allowed to be robust for non-compliant resources that violate the the IMR resources requirements. A Receiver is permitted to coerce resource values that violate IMR requirements if possible.

If necessary for processing, the Receiver shall retrieve Resources referenced by absolute URLs in the FHIR Bundle Resource.

The Receiver may extract the embedded rendered report(s) in DiagnosticReport.presentedForm.data, store them and substitute the corresponding DiagnosticReport.presentedForm with a URL (i.e. DiagnosticReport.presentedForm.url) instead. The Receiver shall maintain the integrity of the report if the report is extracted.

If the Receiver encounters any errors or if any validation fails, the Receiver shall return an appropriate error.

#### 2:3.Y1.4.2 Multimedia Report Bundle Response Message

The Receiver returns a HTTP Status code appropriate to the processing outcome, conforming to the transaction specification requirements as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

##### 2:3.Y1.4.2.1 Trigger Events

This message shall be sent when a success or error condition needs to be communicated. Success is only indicated once the multimedia report is received and completely processed and persisted as appropriate to the Receiver configuration. 

##### 2:3.Y1.4.2.2 Message Semantics

The Receiver shall return a Bundle, with `type` set to `transaction-response`, that contains one entry for each entry in the request, in the same order as received, with the `Bundle.entry.response.outcome` indicating the results of processing the entry warnings such as PartialFolderContentNotProcessed. The Receiver shall comply with FHIR [http://hl7.org/fhir/R4/bundle.html#transaction-response](http://hl7.org/fhir/R4/bundle.html#transaction-response) and [http://hl7.org/fhir/R4/http.html#transaction-response](http://hl7.org/fhir/R4/http.html#transaction-response). This enables the Sender to know the outcome of processing the FHIR transaction, and the identities assigned to the resources by the Receiver,

To indicate success the http `200` response is used. The `Bundle.entry.response.status` shall be `201` to indicate the Resource has been created, the `.location` element shall be populated, and the `.etag` element may be populated if the Receiver supports FHIR resource versioning.

An informative StructureDefinition is outlined for [IMR Provide Report Bundle Response Message](StructureDefinition-imr-provide-report-bundle-response.html).

##### 2:3.Y1.4.2.3 Expected Actions

If the Receiver returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Sender shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The Sender processes the results according to application-defined rules.	

#### 2:3.Y1.4.3 CapabilityStatement Resource

Receiver shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the FHIR transaction has been implemented. 

### 2:3.Y1.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

Given that the Sender is responsible for the URL placed into presentedForm.url if external reference is used, care must be taken to assure that manipulation of this URL prior to any retrieval requests does not expose resources the Report Reader should not have access to.

#### 2:3.Y1.5.1 Security Audit Considerations

This transaction is associated with a Patient-Record-event ATNA Trigger Event on both the Sender and the Receiver.