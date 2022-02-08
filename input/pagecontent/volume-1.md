
# 1:XX Interactive Multimedia Report (IMR)
The Interactive Multimedia Report (IMR) Profile specifies how a diagnostic report with interactive multimedia content can be reliably encoded, communicated and presented.

This profile defines content for data encoding, transactions for communicating the content between systems, and behaviors for displaying the content.


## 1:X.1 IMR Actors, Transactions, and Content Modules <a name="actors-and-transactions"> </a>

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction Appendix A.
IHE Transactions can be found in the Technical Frameworks General Introduction Appendix B.
Both appendices are located at <http://ihe.net/Technical_Frameworks/#GenIntro>.

Figure XX.1-1 shows the actors directly involved in the IMR Profile and the relevant transactions
between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines. Actors which have a required
grouping are shown in conjoined boxes (see Section XX.3).

<div>
    <img src="IHE_IMR_actor_3_readers.png">
</div>
<br clear="all">

**Figure XX.1-1: IMR Actor Diagram**

Table XX.1-1: IMR Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality     | Reference                         |
|---------|---------------|------------------------|-----------------|-----------------------------------|
| Report Creator | \[RAD-Y1\] Store Multimedia Report | Initiator                       | R               | RAD TF-2: 3.Y1 |
| Report Repository       | \[RAD-Y1\] Store Multimedia Report | Responder                        | R               | RAD TF-2: 3.Y1 |
| Report Reader          | \[RAD-Y2\] Display Multimedia Report | Initiator + Responder                      | R               | RAD TF-2: 3.Y2 |
| Report Reader with <br> integrated Image Display Invoker        | \[RAD-Y2\] Display Multimedia Report | Initiator + Responder                      | R               | RAD TF-2: 3.Y2 |
| Report Reader with <br> integrated Image Display         | \[RAD-Y2\] Display Multimedia Report | Initiator + Responder                      | R               | RAD TF-2: 3.Y2 |
| Imaging Document Source | \[RAD-107\] WADO-RS Retrieve | Responder | R | RAD TF-2: 3.107
{: .grid}

### XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on profile's actors.

#### XX.1.1.1 Report Creator <a name="Report Creator"> </a>

Report Creators encode diagnostic reports with multimedia content for a service request.

Note that how the Report Creator receives the multimedia content is out of scope for this release of IMR.

#### XX.1.1.2 Report Repository <a name="Report Repository"> </a>

Report Repositories store multimedia reports and return them to Report Reader upon requests.

#### XX.1.1.3 Report Reader <a name="Report Reader"> </a>

Report Readers retrieve multimedia reports from Report Repositories, present the reports to the user and enable the user to interact with the multimedia contents in the reports.

#### XX.1.1.4 Report Reader with Integrated Invoke Image Display <a name="Report Reader with IID"> </a>

Report Readers retrieve multimedia report from Report Repositories and present the reports to the user. When interacting with the multimedia contents in the reports, the Report Readers launch the integrated Invoke Image Display actors to access the corresponding multimedia contents in the reports.

#### XX.1.1.5 Report Reader with Integrated Image Display <a name="Report Reader with SWF"> </a>

Report Readers retrieve multimedia report from Report Repositories and present the reports to the user. When interacting with the multimedia contents in the reports, the Report Readers launch the integrated Image Display actors to access the corresponding multimedia contents in the reports.

#### XX.1.1.6 Imaging Document Source <a name="Imaging Document Source"> </a>

Imaging Document Source provides the images and related objects to the Report Readers.

Imaging Document Source supports WADO-RS Retrieve [RAD-107].

Imaging Document Source that supports the Image Manager Integration Option also supports returning the objects vis DICOM C-Move. This is necessary to integrate with Image Display access.

## XX.2 IMR Actor Options <a name="actor-options"> </a>

Options that may be selected for each actor in this implementation guide, are listed in Table XX.2-1 below. Dependencies 
between options when applicable are specified in notes.

Table XX.2-1: IMR - Actors and Options

| Actor   | Option Name | Reference |
|---------|-------------|-----------|
| Report Creator | PDF Report Option  | ??? | 
|                | HL7 Text Report Option | ??? |
| Report Repository | No options defined | -- |
| Report Reader | Series/Study Navigation Option | ??? |
| Report Reader with <br> Integrated Invoke Image Display | No options defined | ??? |
| Report Reader with <br> Integrated Image Display | No options defined | -- |
| Imaging Document Source | Image Manager Integration Option | ??? |
{: .grid}

### XX.2.1 IMR - Actors and Options

**TODO: describe this option and the Volume 1 requirements for this option

## XX.3 IMR Required Actor Groupings <a name="required-groupings"> </a>

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 2).

Section XX.5 describes some optional groupings that may be of interest for security
considerations and Section XX.6 describes some optional groupings in other related profiles.

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>IMR Actor</th>
<th>Grouping Condition</th>
<th>Actor(s) to be grouped with</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Report Creator</td>
<td>Required</td>
<td>ITI CT / Time Client</td>
<td>ITI-TF-1: 7.1</td>
</tr>
<tr class="even">
<td>Report Repository</td>
<td>--</td>
<td>None</td>
<td>--</td>
</tr>
<tr class="odd">
<td>Report Reader</td>
<td>--</td>
<td>None</td>
<td>--</td>
</tr>
<tr class="even">
<td>Report Reader with<br>Integrated Image Display Invoker</td>
<td>Required</td>
<td>RAD IID/Image Display Invoker <br> See Note 1</td>
<td>RAD-TF-1: ???</td>
</tr>
<tr class="odd">
<td>Report Reader with<br>Integrated Image Display</td>
<td>Required</td>
<td>RAD SWF.b/Image Display <br> See Note 1</td>
<td>RAD-TF-1: ???</td>
</tr>
<tr class="even">
<td>Imaging Document Source</td>
<td>If Image Manager Integration Option is supported</td>
<td>RAD SWF.b/Image Manager / Image Archive</td>
<td>RAD-TF-1: ???</td>
</tr>
</tbody>
</table>

Note 1: These grouped actors require IMR Imaging Document Sources that support the Image Manager Integration Option.


## XX.4 Interactive multimedia Report Overview <a name="overview"> </a>

### XX.4.1 Concepts



### XX.4.2 Use Cases

This profile is focusd on encoding multimedia contents in diagnostic reports such that later the user can interact with the embedded multimedia contents in the reports.

Note that the IMR profile is currently focused on intra-enterprise use cases. Other inter-enterprise use cases may be supported in future updates. With this said, the design of the current IMR should not prohibit extending the use cases to inter-enterprise in the future.

#### XX.4.2.1 Use Case 1: Encode and Transmit Multimedia Report

##### XX.4.2.1.1 Encode and Transmit Multimedia Report Use Case Description

During a report dictation session, the Evidence Creator (not part of IMR) conveys multimedia contents to the Report Creator on demand as instructed by the user. (Note that the interaction between the Evidence Creator and Report Creator is out of scope for IMR) When a dictation session ended, the Report Creator encodes the diagnostic report along with the collected multimedia content. Once completed, the Report Creator stores the multimedia report to the Report Repository.

##### XX.4.2.1.2 Encode and Transmit Multimedia Report Process Flow

Figure XX.4.2.1.2-1 shows the dictation session as background context, and the eventual encoding and transmission of the multimedia report by the Report Creator to the Report Repository.

<div>
{%include uc1-authoring-report.svg%}
</div>
<br clear="all">

Figure XX.4.2.1.2-1: Encode and Transmit Process Flow in IMR Profile

#### XX.4.2.2 Use Case 2: Consume and Interact with Multimedia Report by Standalone Report Reader

##### XX.4.2.2.1 Consume and Interact with Multimedia Report by Standalone Report Reader Use Case Description

Upon reviewing reports for a patient in the EMR which natively supports as an IMR Report Reader, the EMR encounters an IMR multimedia report. It displays the reports with interactive links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader retrieves the images from the Imaging Document Source and displays the images with interactive tools. The Clinicans can navigate the series and see the measurements with annotations as described in the report.

##### XX.4.2.2.2 Consume and Interact with Multimedia Report by Standalone Report Reader Process Flow

Figure XX.4.2.2.2-1 shows how the Clinician can use the EMR with native IMR Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-standalone.svg%}
</div>
<br clear="all">

Figure XX.4.2.2.2-1: Consume and Interact with Multimedia Report by Standalone Report Reader Process Flow in IMR Profile

#### XX.4.2.3 Use Case 3: Consume and Interact with Multimedia Report by Report Reader with Integrated Invoker Image Display

##### XX.4.2.3.1 Consume and Interact with Multimedia Report by Report Reader with Integrated  Image Display Invoker Use Case Description

Upon reviewing reports for a patient in the EMR which supports as an IMR Report Reader with integrated Image Display Invoker, the EMR encounters an IMR multimedia report. It displays the reports with interative links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader launches the integrated Image Display Invoker which in turn invokes the confgured Image Display in context based on the information in the link. The Image Display retrieves and displays the images with interactive tools. The Clinicans can navigate the series and see the measurements with annotations as described in the report.

##### XX.4.2.3.2 Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Invoker Process Flow

Figure XX.4.2.3.2-1 shows how the Clinician can use the EMR that supports IMR Report Reader with integrated Image Display Invoker to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-EMR.svg%}
</div>
<br clear="all">

Figure XX.4.2.3.2-1: Consume and Interact with Multimedia Report by Report Reader with Integrated Invoke Image Display Process Flow in IMR Profile

#### XX.4.2.4 Use Case 4: Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display

##### XX.4.2.4.1 Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Use Case Description

A clinican is reviewing studies for a patient in the EMR which supports as an Image Display Invoker. The clinican clicks on a study, which triggers the Image Display Invoker to launch the configured Image Display in context. The Image Display is also integrated with an IMR Report Reader. It identifies that the study has an associated multimedia report. It displays the study along with the report with interative links to the multimedia content. The Clinician clicks on the interactive links. The integrated Report Reader retrieves the corresponding images to which the measurements are derived from and display them in the Image Display. The clinician can interact with the images to see the annotation.

##### XX.4.2.4.2 Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Process Flow

Figure XX.4.2.4.2-1 shows how the Clinician can use the EMR that supports IMR Report Reader with integrated Image Display to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-EMR-use-IID.svg%}
</div>
<br clear="all">

Figure XX.4.2.4.2-1: Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Process Flow in IMR Profile

#### XX.4.2.5 Use Case 5: Consume and Interact with Multimedia Report for Prior Study by Radiologist

##### XX.4.2.5.1 Consume and Interact with Multimedia Report for Prior Study by Radiologist Use Case Description

A radiologist is in the process of dictating a study. Relevant prior studies are displayed along with the current study. The prior studies have associated multimedia reports. The Report Reader integrated with the Image Display displays the multimedia reports to the radiologist with interactive links. When the Radiologist clicks on the links, the Report Reader triggers the viewport in the Image Display currently showing the prior study to show the specific image in which the measurements are derived from. The Radiologist can continue and re-measure to confirm the data submitted by the residence.

##### XX.4.2.5.2 Consume and Interact with Multimedia Report for Prior Study by Radiologist Process Flow

Figure XX.4.2.5.2-1 shows how the Radiologist can use the PACS workstation (Image Display) that is integrated with IMR Report Reader to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-PACS.svg%}
</div>
<br clear="all">

Figure XX.4.2.5.2-1: Consume and Interact with Multimedia Report for Prior Study by Radiologist Process Flow in IMR Profile

## XX.5 IMR Security Considerations <a name="security-considerations"> </a>

Refer to RAD TF-1x: Appendix F “Security Environment Considerations”.

Protected Healthcare Information (PHI) is present in the DICOM instances being stored,
retrieved, processed, and displayed, as well as in the API being invoked.

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for FHIR based transactions.

General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification.

The rendered report bundled in the DiagnosticReport includes hyperlinks. It is recommended for any deployment to have network configurations that only allow trusted known address to be accessed, and block unknown addresses.

### XX.5.1 Security Considerations for Actors

This profile strongly recommends all actors group with an ITI ATNA Secure Application or
Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- Record Audit Event [ITI-20] transaction which would record when and where analysis
785 results are distributed and displayed.
- Authenticate Node [ITI-19] transaction to further ensure the integrity of transactions via
node authentication and communication encryption.

Furthermore, for the FHIR-based transactions, this profile strongly recommends the use of ITI Internet User Authroization (IUA) to ensure that communications are only allowed for authenticated and authorized users and/or systems.

### XX.5.2 Security Considerations for Multimedia Report

Multimedia report instances as defined in this profile contain personal demographic information
and clinical information. It is appropriate for products implementing the Interactive Multimedia Report Profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

## XX.6 IMR Cross-Profile Considerations <a name="other-grouping"> </a>

TODO


