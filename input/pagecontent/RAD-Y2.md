### 2:3.Y2.1 Scope

This transaction is used to present the multimedia report content to someone, such as a radiologist or a clinicians, in such a way that the user can interact with the embedded multimedia contents.

### 2:3.Y2.2 Actors Roles

The roles in this transaction are defined in the following table and may be palyed by the actors shown here:

**Table: Actor Roles**

**Introduce Display role**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Display | Presents multimedia reports to a user, such as a radiologist    | Report Reader |
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:3.Y2.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.Y2.4 Messages

<div>
{%include RAD-Y2-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.Y2.4-1: Interaction Diagram**

#### 2:3.Y2.4.1 Display Multimedia Report Message
The Display presents the multimedia report to the user.

##### 2:3.Y2.4.1.1 Trigger Events

The user determines that one or more multimedia report should be presented.

##### 2:3.Y2.4.1.2 Message Semantics

The report is encoded in a FHIR [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html) resource

This transaction does not depend on how the IMR DiagnosticReport resources were transferred to the Display. If the Display receives the reports by a profiled mechanism such as Find Multimedia Report [RAD-Y3], the messaging protocol is specified in that corresponding transaction. If reports are accessed by being grouped with another actor such as Report Repository, there is no messaging protocol involved.

#### 2:3.Y2.4.1.3 Expected Actions (i.e. Display Requirements)

The behaviors in this section are specified as baseline capabilities. Displays may have additional or alternative capabilities that may be invokved or configured.

The Display shall present the multimedia report with all content in the IMR DiagnosticReport resource and referenced resources that are flagged as Must Support as in Table 2:3.Y2.4.1.2-1.

Table 2:3.Y2.4.1.2-1 Must Support Attributes in IMR DiagnosticReport and Referenced Resources

| Resource | Attribute |
|----------|-----------|
|IMR DiagnosticReport | comparisonStudy <br> indication <br> effectiveDateTime <br> result <br> imagingStudy <br> presentedForm |
|IMR ServiceRequest | identifier <br> category |
|IMR ImagingStudy | identifier <br> started <br> series |
|IMR Observation | basedOn <br> category <br> effectiveDateTime <br> value <br> method <br> derivedFrom <br> component |

**TODO** same structure in Store

Introduce the term 'inline image references' and '... image references' ...

For observations that have image references using Observation.derivedFrom attribute,
- If the image references are not inline of the Observation.value[x], then the Requester shall display a hyperlink with the display text for the hyperlink being the corresponding value[x] in a clinically relevant textual representation. The link value for this hyperlink shall be based on the endpoint(s) defined in the referenced [IMR ImagingStudy](StructureDefinition-imr-imagingstudy.html).
- If the image references are inline of Observation.valueString, then the Requester shall substitute the <IMRRef>...</IMRRef> markup with hyperlinks. The link value for this hyperlink shall be set to the concatenation of the ImagingStudy.endpoint.address with the valueString from the matching Observation.component entry. The resulting URL shall be a valid URL according to the contentType.

The Requester shall display the referenced images (inline or not) as hyperlinks such that the user can interact with. Note that IMR does not prescribe any technology stack used for hyperlinking contents.

**Look at AIR Display transaction**

The Requester shall be able to display who, when and how the observations are made as follow:
- Who made the observation is available in Observation.performer or DiagnosticReport.resultInterpreter
- When the observation is made is available in Observation.effectiveDateTime or DiagnosticReport.effectiveDateTime
- How the observation is made may be available in Observation.method and Observation.device

**Explain why, always get what the user intented, but variations may exist**
The Requester may adjust the link to reference the series or study level accordingly to its configuration.

Note that although the DiagnosticReport resource provides a 'ready to view' HTML version of the report, the links embedded in the HTML are fixed. So it does not provide the Requester the control of how and what to retrieve.

The user may choose to redo some of the measurements in order to compare the data recorded in the report, for example. Note that these actions shall not affect the existing content in the multimedia report recieved. If the user decides to save the new measurements, for example, a new report will be created as an addendum instead of updating the existing report.

**Semantics on DiagnosticReport is immutatble. Add CapabilityStatement.**

### 2:3.Y2.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

#### 2:3.Y2.5.1 Security Audit Considerations

The Radiology Audit Trail Option in the ITI Audit Trail and Node Authentication Profile (ITI TF-1:9) defines audit requirements for IHE Radiology transactions. See RAD TF-3: 5.1.

#### 2:3.Y2.5.2 Display Specific Security Considerations

Since this transaction involves the display of PHI, it may be reasonable for Report Readers to implement typical access controls for patient records, such as logins for users and role-based access policies. Since this transaction involves parsing datasets generated by other systems, it may be reasonable for Report Readers to implement basic digital hygiene, such as sanitizing datasets to avoid malicious executable scripts that might be executed by a browser-based viewer.