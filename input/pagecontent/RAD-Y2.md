### 2:4.Y2.1 Scope

This transaction is used to present the report content to someone, such as a radiologist or a clinician, in such a way that permits the user to interact with the embedded multimedia contents.

This transaction is not a typical IHE transaction between two devices; the primary focus is on the required behavior of the display rather than messaging between two actors. This can be thought of as an “informational transaction” between a display device and a user.

The specification is about the baseline display behaviors required for multimedia reports. As with many IHE specifications, the display may have behaviors in addition to those required by this transaction.

### 2:4.Y2.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Display | Presents multimedia reports to a user, such as a radiologist    | Report Reader <br> Rendered Report Reader|
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:4.Y2.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:4.Y2.4 Messages

<div>
{%include RAD-Y2-seq.svg%}
</div>
<br clear="all">

**Figure 2:4.Y2.4-1: Interaction Diagram**

#### 2:4.Y2.4.1 Display Multimedia Report Message
The Display presents the multimedia report to the user.

##### 2:4.Y2.4.1.1 Trigger Events

A user or an automated function determines that one or more multimedia reports should be presented.

##### 2:4.Y2.4.1.2 Message Semantics

The report is encoded in a FHIR [IMR DiagnosticReport](StructureDefinition-imr-diagnosticreport.html) resource.

Displays shall present the IMR DiagnosticReport in one of two methods:

- Assemble from Content Elements
    - In this method, Displays examine the attributes available in the DiagnosticReport, assemble a report and present it
- Display Rendered Report
    - In this method, Displays extract the rendered report in DiagnosticReport.presentedForm and present it

This transaction does not depend on how the IMR DiagnosticReport resources were transferred to the Display. If the Display receives the reports by a profiled mechanism such as Find Multimedia Report [RAD-Y3], the messaging protocol is specified in that corresponding transaction. If reports are accessed by being grouped with another actor such as Report Repository, there is no messaging protocol involved.

##### 2:4.Y2.4.1.3 Expected Actions (i.e. Display Requirements)

The behaviors in this section are specified as baseline capabilities. Displays may have additional or alternative capabilities that may be invoked or configured.

Displays shall support the display requirements as defined in Table 2:4.Y2.4.1.3-1 according to the actor.

Table 2:4.Y2.4.1.3-1 Actor Display Requirements

| Actor | Display Requirements |
|-------|----------------------|
| Report Reader | [2:4.Y2.4.1.3.1 Display of Attributes in DiagnosticReport](#23y24131-display-of-attributes-in-diagnosticreport) <br> [2:4.Y2.4.1.3.2 Display of Observation](#23y24132-display-of-observation) |
| Rendered Report Reader | [2:4.Y2.4.1.3.3 Display of Rendered Report in DiagnosticReport.presentedForm](#23y24133-display-of-rendered-report-in-diagnosticreportpresentedform) |
{: .grid}

###### 2:4.Y2.4.1.3.1 Display of Attributes in DiagnosticReport

The Display shall be capable of presenting the attributes in the IMR DiagnosticReport resource and referenced resources as defined in Store Multimedia Report [RAD-Y1] [Table 2:4.Y1.4.1.2-1](RAD-Y1.html#23y1412-1-attributes-in-diagnostic-report).

###### 2:4.Y2.4.1.3.2 Display of Observation

The Display:

- shall group the observations by Observation.code and display each group separately

- shall display narrative content in Observation.valueString

- shall display coded content in Observation.value[x] in a clinically meaningful representation

- shall be able to display the provenance details (who, when and how):
    - Who made the observation is available in Observation.performer or DiagnosticReport.resultInterpreter
    - When the observation is made is available in Observation.effectiveDateTime or DiagnosticReport.effectiveDateTime
    - How the observation is made may be available in Observation.method

- may display any other attributes available in the DiagnosticReport resource and referenced resources

> Note: Some implementations may allow users to modify or supplement observations in a displayed report. For example, the user may re-measure an observed feature. The implementation might allow saving the new measurements as an addendum. Existing report should not be modified.

###### 2:4.Y2.4.1.3.2.1 Display of Image References in Observation

For inline image references in narrative content, the Display

- shall substitute each `<IMRRef>`...`</IMRRef>` element with a hyperlink

- shall use the text enclosed by the `<IMRRef>` element as the display text for the hyperlink

- the URL for this hyperlink shall be set to the concatenation of the Observation.derivedFrom.endpoint.address with the valueString from the matching Observation.component.id entry. The resulting URL shall be a valid URL according to the contentType

- may add additional parameters to the URL to invoke specific functions provided by the Image Manager / Image Archive

> For example, the Display may retrieve a rendered JPEG or a thumbnail of the image instead of the DICOM object.

Refer to [RAD-Y1] [Section 2:4.Y1.4.1.2.2.1](RAD-Y1.html#23y141221-image-references-in-observation) for details about inline image reference encoding.

This transaction does not prescribe any specific presentation when presenting hyperlinks. For example, the Displays may display the hyperlinks as text or as thumbnail images.

Displays that supports the Series/Study Navigation Option shall be capable of adjusting the URL to reference the series or study level accordingly to its configuration

> Note: The Display may choose to display the full study or only the referenced series, based on the current usage context or configuration.

###### 2:4.Y2.4.1.3.3 Display of Rendered Report in DiagnosticReport.presentedForm

The Display:

- shall be capable of presenting the rendered report in DiagnosticReport.presentedForm.data with contentType "text/html"

- shall be capable of retrieving and presenting the rendered report specified in DiagnosticReport.presentedForm.url. See Retrieve Rendered Multimedia Report [RAD-Y4] for details.

- shall be capable of presenting all hyperlinks in the rendered report

> Note: The Display may not be able to access the content referenced by the hyperlinks due to network and content access permission.

Displays that support the PDF Report Option shall be capable of presenting the rendered report with contentType "application/pdf".

Displays may be capable of presenting rendered reports in other contentType.

### 2:4.Y2.5 Security Considerations

This transaction involves presenting diagnostic reports that typically constitute personal health
information (PHI) to human observers who are typically clinicians. Typical access controls and
audit trails in accordance with local policies would be appropriate.

#### 2:4.Y2.5.1 Security Audit Considerations

The Radiology Audit Trail Option in the ITI Audit Trail and Node Authentication Profile (ITI TF-1:9) defines audit requirements for IHE Radiology transactions. See RAD TF-3: 5.1.

#### 2:4.Y2.5.2 Display Specific Security Considerations

Since this transaction involves the display of PHI, it may be reasonable for the actors to implement typical access controls for patient records, such as logins for users and role-based access policies. Since this transaction involves parsing datasets generated by other systems, it may be reasonable for the actors to implement basic digital hygiene, such as sanitizing datasets to avoid malicious executable scripts that might be executed by a browser-based viewer.
