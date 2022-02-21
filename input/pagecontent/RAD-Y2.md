### 2:3.Y2.1 Scope

This transaction is used to present the report content to someone, such as a radiologist or a clinicians, in such a way that the user can interact with the embedded multimedia contents.

### 2:3.Y2.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

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

##### 2:3.Y2.4.1.3 Expected Actions (i.e. Display Requirements)

The behaviors in this section are specified as baseline capabilities. Displays may have additional or alternative capabilities that may be invoked or configured.

###### 2:3.Y2.4.1.3.1 General Interactive Multimedia Report Display Requirements

The Display shall present the multimedia report with content in the IMR DiagnosticReport resource and referenced resources that are flagged as Must Support as in Table 2:3.Y2.4.1.2-1.

Table 2:3.Y2.4.1.2-1 Must Support Attributes in IMR DiagnosticReport and Referenced Resources

| Resource | Attribute |
|----------|-----------|
|IMR DiagnosticReport | comparisonStudy <br> indication <br> basedOn <br> effectiveDateTime <br> result <br> imagingStudy <br> presentedForm |
|IMR ServiceRequest | identifier |
|IMR ImagingStudy | identifier <br> started |
|IMR Observation | basedOn <br> category <br> code <br> effectiveDateTime <br> value <br> method <br> derivedFrom <br> component |

The mappings of these attributes can be found in Store Multimedia Report [RAD-Y1].

###### 2:3.Y2.4.1.3.2 Display of Observation

The Display:

- shall display unstructured content in Observation.valueString

- shall display structured content in Observation.value[x] in a clinically meaningful representation

- shall be able to display who, when and how the observations are made as follow:
    - Who made the observation is available in Observation.performer or DiagnosticReport.resultInterpreter
    - When the observation is made is available in Observation.effectiveDateTime or DiagnosticReport.effectiveDateTime
    - How the observation is made may be available in Observation.method

> A user may choose to redo some of the measurements in order to compare the data recorded in the report, for example. If the user decides to save the new measurements, for example, a new report should be created as an addendum instead of updating the existing report.

###### 2:3.Y2.4.1.3.2.1 Display of Image References in Observation

For IMR Observations that have image references using Observation.derivedFrom attribute, the Display

- shall present a hyperlink, with the display text for the hyperlink being the corresponding Observation.value[x]

- the URL for this hyperlink shall be constructed based on the endpoint(s) defined in the referenced [IMR ImagingStudy]((StructureDefinition-imr-imagingstudy.html)) resource.

For inline image references in Observation.valueString, the Display

- shall substitute each `<IMRRef>`...`</IMRRef>` markup with a hyperlink

- the URL for this hyperlink shall be set to the concatenation of the ImagingStudy.endpoint.address with the valueString from the matching Observation.component.id entry. The resulting URL shall be a valid URL according to the contentType

- may adjust the URL to reference the series or study level accordingly to its configuration

> The Display may choose to display the full study or only the referenced series, based on the current usage context or configuration.

- may add additional parameters to the URL to invoke specific functions provided by the Image Manager / Image Archive

> For example, the Display may retrieve a rendered JPEG or a thumbnail of the image instead of the DICOM object.

Note that IMR does not prescribe any technology used for hyperlinking contents.

Note that although the DiagnosticReport resource provides a 'ready to view' HTML version of the report, the links embedded in the HTML are fixed. So it does not provide the Display the control of how and what to retrieve.

### 2:3.Y2.5 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

#### 2:3.Y2.5.1 Security Audit Considerations

The Radiology Audit Trail Option in the ITI Audit Trail and Node Authentication Profile (ITI TF-1:9) defines audit requirements for IHE Radiology transactions. See RAD TF-3: 5.1.

#### 2:3.Y2.5.2 Display Specific Security Considerations

Since this transaction involves the display of PHI, it may be reasonable for Report Readers to implement typical access controls for patient records, such as logins for users and role-based access policies. Since this transaction involves parsing datasets generated by other systems, it may be reasonable for Report Readers to implement basic digital hygiene, such as sanitizing datasets to avoid malicious executable scripts that might be executed by a browser-based viewer.