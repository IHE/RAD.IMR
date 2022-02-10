
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
    <img src="IHE_IMR_actor.drawio.png">
</div>
<br clear="all">

**Figure XX.1-1: IMR Actor Diagram**

Table XX.1-1: IMR Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality     | Reference                         |
|---------|---------------|------------------------|-----------------|-----------------------------------|
| Report Creator | \[RAD-Y1\] Store Multimedia Report | Initiator                       | R               | RAD TF-2: 4.Y1 |
| Report Repository       | \[RAD-Y1\] Store Multimedia Report | Responder                        | R               | RAD TF-2: 4.Y1 |
|                         | \[RAD-Y3\] Find Multimedia Report | Responder                         | R               | RAD TF-2: 4.Y3 |
|                         | \[RAD-Y4\] Retrieve Pre-rendered Multimedia Report | Responder                         | R               | RAD TF-2: 4.Y4 |
| Report Reader          | \[RAD-Y2\] Display Multimedia Report | Initiator + Responder                      | R               | RAD TF-2: 4.Y2 |
|                        | \[RAD-Y3\] Find Multimedia Report    | Initiator                                  | R               | RAD TF-2: 4.Y3 |
|                        | \[RAD-Y4\] Retrieve Displaybale Multimedia Report    | Initiator                                  | R               | RAD TF-2: 4.Y4 |
|                        | \[RAD-107\] WADO-RS Retrieve   | Initiator                                  | R               | RAD TF-2: 4.107 |
| Image Manager / Image Archive | \[RAD-107\] WADO-RS Retrieve | Responder | R | RAD TF-2: 4.107 |
{: .grid}

### XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on profile's actors.

#### XX.1.1.1 Report Creator <a name="ReportCreator"> </a>

Report Creators encode diagnostic reports with multimedia content for a service request. Report Creators may also support retrieve pre-rendered multimedia report request if one or more pre-rendered reports are hosted by itself and accessible via a URL.

Report Creators may support multiple rendering of the multimedia reports for different consumers (e.g. simple consumers that do not render the detailed multimedia contents on its own, or external consumers that do not have access to stuides inside the enterprise firewall),

Note that how the Report Creator receives the multimedia content is out of scope for this release of IMR.

#### XX.1.1.2 Report Repository <a name="ReportRepository"> </a>

Report Repositories store multimedia reports and return them to Report Reader upon requests.

Report Repositories may be grouped with Report Reader to suppor the 'push' model for report distribution. In this case, there is no explicit query/retrieve of multimedia reports required.

Optionally, Report Repositories support query/retrieve of multimedia reports. This enables independent Report Readers to retrieve reports.

Furthermore, if Report Repositories receive multimedia reports with embedded pre-rendered reports, it may extract the embedded report out and substitute it with a URL. This enables Report Repositories to support external access of reports in the future.

#### XX.1.1.3 Report Reader <a name="ReportReader"> </a>

Report Readers retrieve multimedia reports from Report Repositories and present the reports to the user. For multimedia content embedded in the report (e.g. hyperlinks to corresponding images), the user can interact with the reports to access the multimedia contents.

There are baseline image viewing capabilities required for Report Reader, while optionally the Report Reader may suport additional advanced behvaior.

The following subsections describe three different pathways that the Report Readers can display the images to the user.

##### XX.1.1.3.1 Report Reader standalone </a>

Standalone Report Readers are Report Readers that is self-sufficient to handle and display the multimedia report itself as well as all the referenced multimedia contents. In this case, Report Readers retrieve the images from Image Manager / Image Archive and display the images to the user with some basic viewing capabilities.

##### XX.1.1.3.2 Report Reader with Integrated Invoke Image Display <a name="ReportReaderwithIID"> </a>

Report Readers retrieve multimedia report from Report Repositories and present the reports to the user. When interacting with the multimedia contents in the reports, the Report Readers launch the integrated Invoke Image Display actors to access the corresponding multimedia contents in the reports and display them to the user.

##### XX.1.1.5 Report Reader with Integrated Image Display <a name="ReportReaderwithSWF"> </a>

Report Readers retrieve multimedia report from Report Repositories and present the reports to the user. When interacting with the multimedia contents in the reports, the Report Readers launch the integrated Image Display actors to access the corresponding multimedia contents in the reports and display them to the user.

#### XX.1.1.6 Image Manager / Image Archive <a name="ImageArchive"> </a>

Image Manager / Image Archive provides the images and related objects to the Report Readers.

Image Manager / Image Archive supports WADO-RS Retrieve [RAD-107] as well as other DICOM DIMSE services. This enables different types of image viewer to retrieve objects.

## XX.2 IMR Actor Options <a name="actor-options"> </a>

Options that may be selected for each actor in this implementation guide, are listed in Table XX.2-1 below. Dependencies 
between options when applicable are specified in notes.

Table XX.2-1: IMR - Actors and Options

| Actor   | Option Name | Reference |
|---------|-------------|-----------|
| Report Creator | PDF Report Option  | Section XX.2.1 | 
|                | HL7 Text Report Option | Section XX.2.2 |
| Report Repository | No options defined | -- |
| Report Reader | Series/Study Navigation Option | Section XX.2.3 |
|               | PDF Report Option  | Section XX.2.1 | 
|               | HL7 Text Report Option | Section XX.2.2 |
{: .grid}

### XX.2.1 PDF Report Option

The PDF Report Option exports a rendered report with all multimedia contents in the PDF format.

A Report Creator can export a rendered multimedia report, preserving the hyperlinks as in the default HTML version.

A Report Reader or non-IMR Report Reader can use the PDF version if desired.

### XX.2.2 HL7 Text Report Option

The HL7 Text Report Option exports a text-only version of the report without the multimedia contents.

A Report Creator can use this text-only report to commuicate the report with existing non-IMR Report Readers, for example, using HL7 v2 ORU messages, or Send Imaging Result [RAD-128] in IHE [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) profile as a Report Creator.

### XX.2.3 Series/Study Navigation Option

The Series/Study Navigation Option supports more advanced viewing of the referenced images by enabling scrolling through images in the same series or study.

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
<td>Report Reader</td>
<td>Required if using Image Display Invoker to display images</td>
<td>RAD IID/Image Display Invoker</td>
<td>RAD-TF-1: ???</td>
</tr>
<tr class="odd">
<td>Report Reader</td>
<td>Required if using Image Display to display images</td>
<td>RAD SWF.b/Image Display</td>
<td>RAD-TF-1: ???</td>
</tr>
</tbody>
</table>


## XX.4 Interactive multimedia Report Overview <a name="overview"> </a>

### XX.4.1 Concepts

#### XX.4.1.? Critical Attributes for Diagnoist Report



#### XX.4.1.? Measurement captured as persistent objects vs transient message

#### XX.4.1.? Real Time Communication between Image Display / Evidence Creator and Report Creator

#### XX.4.1.? Level of Interactivity

When interacting with multimedia reports, there are different levels of sophitications:

Level 0: No interactivity

The Report Reader can display the static content in the report, but provides no interactivity with the content for the user.

Level 1: Basic interactivity

The Report Reader can display that static content in the report, including hyperlinks to different multimedia contents in the report (e.g. measurements). The user can click on these links to access a basic view of the source image(s) in which the findings are derived from.

Level 2: Essential interactivity

The Report Reader can provide not only a basic view of the source image(s), but also provide other essential features such as zoom, pan, window levelling, etc. If annotations are available, then the annotations (markup, ROI, etc.) are displayed as well and able to toggle them.

Level 3: Advanced interactivity

The Report Reader can display not only the image referenced directly, but also the full series that contain the image. The Report Reader may provide other tools (e.g. measurements, more advanced image visualization, etc.) as well as support other advanced DICOM objects such as segmentation objects or parametric map objects.

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

The functionality of this use case is the same as in Use Case 2. The difference is that the IMR Report Reader does not natively support image viewing capability. Instead it paired with an Image Display Invoker to launch an Image Display that can do so. Upon reviewing reports for a patient in the EMR which supports as an IMR Report Reader with integrated Image Display Invoker, the EMR encounters an IMR multimedia report. It displays the reports with interative links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader launches the integrated Image Display Invoker which in turn invokes the confgured Image Display in context based on the information in the link. The Image Display retrieves and displays the images with interactive tools. The Clinicans can navigate the series and see the measurements with annotations as described in the report.

##### XX.4.2.3.2 Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Invoker Process Flow

Figure XX.4.2.3.2-1 shows how the Clinician can use the EMR that supports IMR Report Reader with integrated Image Display Invoker to interact with the multimedia content available in the report.

<div>
{%include uc3-presenting-interactive-report-EMR.svg%}
</div>
<br clear="all">

Figure XX.4.2.3.2-1: Consume and Interact with Multimedia Report by Report Reader with Integrated Invoke Image Display Process Flow in IMR Profile

#### XX.4.2.4 Use Case 4: Consume and Interact with Multimedia Report for Prior Study by Radiologist

##### XX.4.2.4.1 Consume and Interact with Multimedia Report for Prior Study by Radiologist Use Case Description

A radiologist is in the process of dictating a study. Relevant prior studies are displayed along with the current study. The prior studies have associated multimedia reports. The Report Reader integrated with the Image Display displays the multimedia reports to the radiologist with interactive links. When the Radiologist clicks on the links, the Report Reader triggers the viewport in the Image Display currently showing the prior study to show the specific image in which the measurements are derived from. The Radiologist can continue and re-measure to confirm the data submitted by the residence.

##### XX.4.2.4.2 Consume and Interact with Multimedia Report for Prior Study by Radiologist Process Flow

Figure XX.4.2.4.2-1 shows how the Radiologist can use the PACS workstation (Image Display) that is integrated with IMR Report Reader to interact with the multimedia content available in the report.

<div>
{%include uc4-presenting-interactive-report-PACS.svg%}
</div>
<br clear="all">

Figure XX.4.2.4.2-1: Consume and Interact with Multimedia Report for Prior Study by Radiologist Process Flow in IMR Profile

A similar workflow can also happen in the clinician reading context. In this case, a clinican is reviewing reports and studies for a patient in the EMR, but the EMR does not supprt as an IMR Report Reader. It displays the report as normal text report without the multimedia content. The clinican clicks on a study, the integrated Image Display Invoker launches the configured Image Display in context. However, this Image Display also fetches the report as part of its image viewing process, and this Image Display is also integrated with an IMR Report Reader. It identifies that the study has an associated multimedia report. It displays the study along with the report with interative links to the multimedia content. The Clinician clicks on the interactive links. The integrated Report Reader retrieves the corresponding images to which the measurements are derived from and display them in the Image Display. The clinician can interact with the images to see the annotation.

##### XX.4.2.4.3 Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Process Flow

Figure XX.4.2.4.3-1 shows how the Clinician can use the EMR that supports IMR Report Reader with integrated Image Display to interact with the multimedia content available in the report.

<div>
{%include uc4b-presenting-interactive-report-EMR-use-IID.svg%}
</div>
<br clear="all">

Figure XX.4.2.4.3-1: Consume and Interact with Multimedia Report by Report Reader with Integrated Image Display Process Flow in IMR Profile

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

**Scheduled Workflow (SWF.b)**: An Image Display can be grouped with an IMR Report Reader to enhance the report viewing capability for prior studies.

**Results Distribution (RD)**: A Report Creator that supports the HL7 Text Report Option can use Result Distribution to send the text report to other consumers.

**Basic Image Reivew (BIR)**: A Report Reader can be grouped with an Image Display in BIR to provide the required image display functionality.