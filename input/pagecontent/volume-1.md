
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
| Report Creator | \[RAD-Y1\] Store Multimedia Report | Initiator | R | RAD TF-2: 4.Y1 |
| Report Repository | \[RAD-Y1\] Store Multimedia Report | Responder | R | RAD TF-2: 4.Y1 |
|                   | \[RAD-Y3\] Find Multimedia Report | Responder | R | RAD TF-2: 4.Y3 |
|                   | \[RAD-Y4\] Retrieve Rendered Multimedia Report | Responder | R | RAD TF-2: 4.Y4 |
| Report Reader | \[RAD-Y1\] Store Multimedia Report | Responder | O (See Note 1) | RAD TF-2: 4.Y1 |
|               | \[RAD-Y2\] Display Multimedia Report | Responder | R | RAD TF-2: 4.Y2 |
|               | \[RAD-Y3\] Find Multimedia Report | Initiator | O (See Note 1) | RAD TF-2: 4.Y3 |
|               | \[RAD-Y5\] Display Images | Responder | R | RAD TF-2: 4.Y5 |
|               | \[RAD-107\] WADO-RS Retrieve | Initiator | O | RAD TF-2: 4.107 |
| Rendered Report Reader | \[RAD-Y1\] Store Multimedia Report | Responder | O (See Note 1) | RAD TF-2: 4.107 |
|                        | \[RAD-Y3\] Find Multimedia Report | Initiator | O (See Note 1) | RAD TF-2: 4.Y3 |
|                        | \[RAD-Y4\] Retrieve Rendered Multimedia Report | Initiator | R | RAD TF-2: 4.Y4 |
| Image Manager / Image Archive | \[RAD-16\] Retrieve Images | Responder | R | RAD TF-2: 4.16 |
|                               | \[RAD-31\] Retrieve Key Images | Responder | R | RAD TF-2: 4.31 |
|                               | \[RAD-45\] Retrieve Evidence Documents | Responder | R | RAD TF-2: 4.45 |
|                               | \[RAD-107\] WADO-RS Retrieve | Responder | R | RAD TF-2: 4.107 |
| Image Display | \[RAD-106\] Invoke Image Display | Responder | R | RAD TF-2: 4.106 |
{: .grid}

> Note 1: A Report Reader shall support at least one of RAD-Y1 or RAD-Y3.

### XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on profile's actors.

#### XX.1.1.1 Report Creator

Report Creators encode diagnostic reports with multimedia content using FHIR DiagnosticReport resource. Each resulting DiagnosticReport resource also includes a default rendered report.

Report Creators may support multiple rendering of the multimedia reports for different consumers (e.g. simple consumers that do not render the detailed multimedia contents on its own, or external consumers that do not have access to studies inside the enterprise firewall).

Report Creators store the DiagnosticReport resources to Report Repositories, Report Readers or Rendered Report Readers. If the rendered report is embedded by referencing a URL, the Report Creators shall ensure that the URL is accessible by the recipients (e.g. referencing a common shared storage).

> Note that how the Report Creator receives the multimedia content is out of scope for this release of IMR.

#### XX.1.1.2 Report Repository

Report Repositories store multimedia reports received from Report Creators.

Report Repositories support query/retrieve of multimedia reports by Report Readers and Rendered Report Readers.

> Note that a Report Repository may adjust the accessibility of the rendered report if applicable. For example, a Report Repository may adjust an internal URL to an external accessible URL, or it may retrieve the rendered report referenced by a URL and embedded directly in the DiagnosticReport resource as base64 encoded in query responses. Details regarding how Report Repositories make adjust the accessibility of the rendered report is out of scope of IMR.

#### XX.1.1.3 Report Reader

Report Readers receive multimedia reports by either querying Report Repositories or receive directly from Report Creators.

Report Readers present the reports to the user, including the multimedia content embedded in the report as hyperlinks. When users click on the hyperlinks, Report Readers present the referenced images to the user in a way that the user can interact with the images (e.g. windowing, zooming, panning, toggle annotations, etc.).

There are baseline image viewing capabilities required for Report Readers, while optionally the Report Reader may support additional advanced behavior.

Report Readers shall support at least one of the following named options to retrieve the referenced images and display them to the user.

##### XX.1.1.3.1 Report Reader with WADO-RS Retrieve Option

Report Readers with WADO-RS Retrieve Option are Report Readers that can handle retrieve and display of referenced images in multimedia reports without external dependencies. When triggered to view images, Report Readers retrieve the images from Image Manager / Image Archive and display the images to the user with some basic viewing capabilities.

See <a href="#xx23-wado-rs-retrieve-option">WADO-RS Retrieve Option</a> for details.

##### XX.1.1.3.2 Report Reader with Integrated Image Display Invoker Option

Report Readers with Integrated Image Display Invoker Option are Report Readers that delegate the image viewing capabilities to external Image Display invoked by the integrated Image Display Invoker. When triggered to view images, Report Readers translate the embedded image references and endpoints in the DiagnosticReport resource into corresponding Invoke Image Display URLs.

See <a href="#xx24-integrated-image-display-invoker-option">Integrated Image Display Invoker Option</a> for details.

##### XX.1.1.3.3 Report Reader with Integrated Image Display Option

Report Readers with Integrated Image Display Option are Report Readers that delegate the image viewing capabilities to the integrated Image Display. When triggered to view images, the Report Readers translate the embedded image references and endpoints in the DiagnosticReport resource into corresponding commands (out of scope of IMR) and launch the integrated Image Display in context.

See <a href="#xx25-integrated-image-display-option">Integrated Image Display Option</a> for details.

#### XX.1.1.4 Rendered Report Readers

Rendered Report Readers receive multimedia reports by either querying Report Repositories or receive directly from Report Creators.

Rendered Report Readers present the rendered reports embedded in the DiagnosticReport resource to the user, including the multimedia content embedded in the report as hyperlinks. When users click on the hyperlinks, Rendered Report Readers launched the rendered references images to the user.

> Note that there is no additional image viewing capabilities required for Rendered Report Readers. In other words, the image viewing capabilities is prescribed by the Report Creators.

#### XX.1.1.5 Image Manager / Image Archive

Image Managers / Image Archives provide the images and related objects to the Report Readers or Image Displays.

Image Managers / Image Archives shall support WADO-RS Retrieve [RAD-107] as well as [RAD-16], [RAD-17], [RAD-31] and [RAD-45] DICOM DIMSE services. This enables different types of Image Displays to retrieve objects.

#### XX.1.1.6 Image Display

Image Displays retrieve images from Image Managers / Image Archives, display the images to the user and provide different interactive tools for user to interactive with the images, based on requests from Image Display Invokers.

Image Displays shall support Invoke Image Display [RAD-106].

## XX.2 IMR Actor Options <a name="actor-options"> </a>

Options that may be selected for each actor in this implementation guide, are listed in Table XX.2-1 below. Dependencies 
between options when applicable are specified in notes.

Table XX.2-1: IMR - Actors and Options

| Actor   | Option Name | Reference |
|---------|-------------|-----------|
| Report Creator | PDF Report Option  | Section XX.2.1 | 
|                | HL7 Text Report Option | Section XX.2.2 |
| Report Repository | No options defined | -- |
| Report Reader | WADO-RS Retrieve Option (See Note 1) | Section XX.2.3 |
|               | Integrated Image Display Invoker Option (See Note 1) | Section XX.2.4 |
|               | Integrated Image Display Option (See Note 1) | Section XX.2.5 |
|               | Series/Study Navigation Option | Section XX.2.6 |
| Rendered Report Reader | PDF Report Option | Section XX.2.1 |
| Image Manager / Image Archive | Retrieve Rendered Instance Option | Section XX.2.7 |
| Image Display | No options defined | -- |
{: .grid}

> Note 1: The Report Reader shall support at least one of the options to retrieve images.

### XX.2.1 PDF Report Option

The PDF Report Option enables actors to export a rendered report with all multimedia contents in the PDF format.

A Report Creator that supports this option shall export a rendered multimedia report, preserving the image references as hyperlinks in the rendered PDF file.

A Rendered Report Reader that supports this option shall support retrieving and displaying the rendered report in PDF format.

### XX.2.2 HL7 Text Report Option

The HL7 Text Report Option enable actors to export a text-only version of the report without the multimedia contents.

A Report Creator that supports this option shall use this text-only report to communicate the report with existing non-IMR Report Readers, for example, using HL7 v2 ORU messages, or Send Imaging Result [RAD-128] in IHE [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) profile as a Report Creator.

### XX.2.3 WADO-RS Retrieve Option

The WADO-RS Retrieve Option enables actors to retrieve images from Image Manager / Image Archive using WADO-RS.

A Report Reader that supports this option shall use WADO-RS Retrieve [RAD-107] to retrieve images from an Image Manager / Image Archive.

The requests shall have the same semantics as RetrieveInstance or RetrieveFrames as defined in WADO-RS Retrieve [RAD-107], constructed based on DiagnosticReport.result.derivedFrom.endpoint.address and DiagnosticReport.result.component.valueString.

If the Report Reader also claims support of the Series/Study Navigation Option, then the WADO-RS request shall also support the RetrieveSeries and RetrieveStudy semantics.

### XX.2.4 Integrated Image Display Invoker Option

The Integrated Image Display Invoker Option enables actors to display images via an external Image Display actor.

A Report Reader that supports this option shall use Invoke Image Display [RAD-106] to invoke an Image Display which in turn retrieves images from an Image Manager / Image Archive. Report Readers shall translate the embedded image references and endpoints in the DiagnosticReport resource into corresponding Invoke Image Display URLs.

The requests shall have the same semantics as Retrieve Display of Series Images or Retrieve Display of Study Images in Invoke Image Display [RAD-106].

> Note: Retrieve Display of Series Images is available in CP-RAD-xxx.

> Note: A Report Reader that supports this Option can also claim support of the Series/Study Navigation Option as the Image Display Invoker always invokes the Image Display at the series or study level.

### XX.2.5 Integrated Image Display Option

The Integrated Image Display Option enables actors to display images via the integrated Image Display actor.

A Report Reader that supports this option shall launch an Image Display in context of the referenced images. The integrated Image Display may use DICOM C-Move request, WADO-RS retrieve request or other means to retrieve images from an Image Manager / Image Archive.

For DICOM C-Move requests, the requests shall have the same semantics as Retrieve Images [RAD-16], Retrieve Presentation States [RAD-17], Retrieve Key Image Notes [RAD-31] or Retrieve Evidence Document [RAD-45].

For WADO-RS requests, the requests shall have the same semantics as RetrieveInstance or RetrieveFrames as defined in WADO-RS Retrieve [RAD-107], constructed based on DiagnosticReport.result.derivedFrom.endpoint.address and DiagnosticReport.result.component.valueString.

If the Report Reader also claims support of the Series/Study Navigation Option, then the WADO-RS request shall also support the RetrieveSeries and RetrieveStudy semantics.

### XX.2.6 Series/Study Navigation Option

The Series/Study Navigation Option enables actors to scroll through images in the same series or study.

A Report Reader that supports this option shall display the referenced image, if specified, as the anchor image immediately display to the user, and shall enable the user to scroll through the other images in the same series (and optionally study) as the anchor image.

### XX.2.7 Retrieve Rendered Instance Option

The Retrieve Rendered Instance Option enables actors to retrieve a rendered image rather than retrieve the original DICOM instance.

An Image Manager / Image Archive that supports this option shall return the requested images in the requested rendered media type as defined in DICOM PS3.18 Section 9.5 [Retrieve Rendered Instance Transaction](https://dicom.nema.org/medical/dicom/current/output/html/part18.html#sect_9.5).

## XX.3 IMR Required Actor Groupings <a name="required-groupings"> </a>

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 2).

Section XX.5 describes some optional groupings that may be of interest for security
considerations and Section XX.6 describes some optional groupings in other related profiles.

| IMR Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|-----------|--------------------|-----------------------------|-----------|
| Report Creator | Required | ITI CT / Time Client | ITI-TF-1: 7.1 |
| Report Repository | -- | -- | -- |
| Report Reader | Integrated with Image Display Invoker | RAD IID / Image Display Invoker | RAD-IID: 35.1.1.2 |
|               | Integrated with Image Display | RAD SWF.b / Image Display | RAD-TF-1: 34.1 |
| Rendered Report Reader | -- | -- | -- |
| Image Manager / Image Archive | -- | -- | -- |
| Image Display | -- | -- | -- |
{: .grid}

## XX.4 Interactive multimedia Report Overview <a name="overview"> </a>

### XX.4.1 Concepts

**TODO** Reference the HIMSS-SIIM IMR Technical Consideration Whitepaper when it is published

#### XX.4.1.1 What is Structure in Radiology Reporting

In reporting, structure can significantly improve usability, both for machine consumption and human consumption. There are different types of structure that are relevant to reporting:

##### Message Structure

In the most basic form, the clinical report is conveyed between the sender and the receiver using some kind of message format. The message format defines a structure for the overall payload, including the metadata and the actual report content. For example, HL7 v2 ORU messages or FHIR DiagnosticReport resources define such a message structure that governs where different content should be placed, such as patient, order, findings, impressions, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) profile specifies using HL7 v2 ORU as the message structure while this Interactive Multimedia Report profile specifies using FHIR DiagnosticReport resource as the message structure.

##### Report Content Structure

In a radiology report, although they are many variations of what information a report should contain depending on the procedure and specialty, there are general common sections in a report such as Indication, Methods, Findings, Impressions, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) profile specifies using different OBX segments for different sections while this Interactive Multimedia Report profile specifies using different FHIR DiagnosticReport.result which are referenced Observation resources for different sections.

##### Report Content Encoding

Also known as 'structured reporting' or 'synoptic reporting', structure refers to the use of fully coded values in pre-coordinated form or post-coordinated form, in which the values are drawn from some value sets such as LOINC or SNOMED-CT, in order to represent the full concept.

This has been successfully used in certain discipline such as cancer screening, but it is less common in general radiology reporting practice.

The primary goal of this Interactive Multimedia Report Profile is to focus on Report Content Structure, introduce the ability to capture report content with some interactive links that referencing other contents such as the source images. It is not the intention of this profile to require fully coded content in the report.

#### XX.4.1.2 Source of Multimedia Content

There are two sources of multimedia content for radiology reporting:

- User-defined
    - These are the content provided by the user. This includes, but not limited to, annotations, measurements, image references, etc.
- System-defined
    - These are the content provided by a system. For example, parametric map generated by the modality or region of interest generated by an AI model

These contents should be available to the report authoring system so that it can incorporate the details automatically.

#### XX.4.1.3 Image Reference Locations

A multimedia report may include references to images in which the findings or impressions are derived from. The image references may be general references not specific to a particular statement in the report. However, there may be multiple measurements stated in the same finding and each measurement is derived from a different set of images. In this case, the image references should be inline corresponding to the matching measurements to avoid any confusion.

#### XX.4.1.4 Real Time Communication between Image Display / Evidence Creator and Report Creator

A key element for an IMR is the ability to include clinical findings such as measurements, ROI, etc. with interactive links to the source images. Traditionally, these annotations, markups, presentation states, and key images could be captured as DICOM objects such as GSPS, SR, or KOS. These objects are designed to capture evidence for long-term reference instead of real-time communication or composition. Most PACS will create these evidence objects at the end of a session in order to capture all the data points created by the image-centric specialist in one object, rather than create multiple evidence objects resulting in one per data point. As a result, these evidence objects in DICOM are good resources for subsequent interactive access when viewing an IMR, but not good candidates as the payload for real-time communication during a reporting session. As the image-centric specialist captures measurements, regions of interest, and other data points, the PACS should provide those data points to the reporting system in real-time without introducing any unnecessary interruptions, or adding transitory content to the permanent record.

Several technologies could be used to implement such communication channels. For example, HL7’s [FHIRcast](https://fhircast.org/) uses the publish/subscribe model. It uses the WebSub W3C standard and originated as an application context synchronization standard that extends the SMART on FHIR authentication pattern. When applying FHIRcast in the context of IMR, the PACS can publish messages regarding the exam (e.g. identifier of a radiology exam) as well as granular context sharing of specific images and measurements (e.g., measurement details and referenced images), and one or more systems can subscribe to this notification and respond accordingly; in particular, a dictation system might launch in exam context, as well as insert the measurements or image references during dictation. The message payload, or event, in FHIRcast is a FHIR resource, such as an Observation. 

For scenarios when both the image viewing system and report authoring system are webapps, FHIRcast may be too heavyweight due to the need for a mediator. The proposed [SMART Web Messaging](https://github.com/HL7/smart-web-messaging) standard is a lightweight alternative that can transmit the same event payloads as FHIRcast, over HTML5 web messaging. This enables two systems to communicate in the same browser process using the same payloads that FHIRcast integration uses, thereby enabling the developers to integrate rapidly, then progressively enhance the solution towards FHIRcast without modifying the event payloads.

It is important to note that this real-time communication is not limited to IMR but generally applicable to many contexts. A realtime mechanism to share granular context from an image viewing system could create a plug-in architecture for decision support systems to extend the image analysis and reporting process. In our prior example, an AI system might be notified of a new measurement, pull the measurement source image and automatically identify the anatomic location and Lung-Rads score that could then be transmitted to the reporting system.

#### XX.4.1.5 Placement of Multimedia Content

At a basic level, multimedia content can be placed at the end of the report. This can be achieved with low level of communications between the PACS and the Reporting System as long as these multimedia contents (or their corresponding references) are known at some point by the Reporting System, which can then insert these contents towards the end of the report.

Although this can be useful, a more sophisticated placement of multimedia contents is the ability to insert them in context of the findings and impressions. For example, when a description such as "Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station" is recorded as a finding, the corresponding image reference with the matching markup if available are injected in the same context as hyperlink, such that subsequently upon viewing the report, a user can access the matching multimedia content in context while reading the report.

This sophisticated placement of multimedia contents requires a more complex interaction between the PACS and the Reporting System because both systems need to know the current context and be able to mark their respective data accordingly. This also requires a low latency communication because any pause required by the radiologist to synchronize the two systems during a reporting session will cause significant distraction to the radiologist.

#### XX.4.1.6 Level of Interactivity

When interacting with multimedia reports, there are different levels of sophistication:

Level 0: No interactivity

The Report Reader can display the static content in the report, but provides no interactivity with the content for the user.

Level 1: Basic interactivity

The Report Reader can display that static content in the report, including hyperlinks to different multimedia contents in the report (e.g. measurements). The user can click on these links to access a basic view of the source image(s) in which the findings are derived from.

Level 2: Essential interactivity

The Report Reader can provide not only a basic view of the source image(s), but also provide other essential features such as zoom, pan, window levelling, etc. If annotations are available, then the annotations (markup, ROI, etc.) are displayed as well and able to toggle them.

Level 3: Advanced interactivity

The Report Reader can display not only the image referenced directly, but also the full series that contain the image. The Report Reader may provide other tools (e.g. measurements, more advanced image visualization, etc.) as well as support other advanced DICOM objects such as segmentation objects or parametric map objects.

#### XX.4.1.7 Multiplanar Reconstruction

Multiplanar reconstruction, or MPR, involves the process of converting data from an imaging modality acquired in a certain plane, usually axial, into another plane such as coronal or sagittal or oblique. It is most commonly performed with thin-slice data from volumetric CT in the axial plane, but it may be accomplished with scanning in any plane and whichever modality capable of cross-sectional imaging, including magnetic resonance imaging (MRI).

Although MPR is a feature available in many PACS implementations, it is a advanced operation that is computational intensive. For the interactive image viewing capability on interactive multimedia report, MPR is not expected to be available. If viewing of the images from different planes is desirable, then the acquired data should be reconstructed to other planes and then be saved as separate set of images. These new set of reconstructed images can then be referenced in the DiagnosticReport resource.

#### XX.4.1.8 Query Payload

A DiagnosticReport resource includes many references to other resources, such as Patient, IMR Observation, IMR ImagingStudy, etc. By default, a FHIR server returns query responses with references to other resources. The requester is expected to retrieve these referenced resources separately afterwards.

Optionally, a FHIR server may support the [_include](http://hl7.org/fhir/R4/search.html#include) search result parameters. If the requester specifies this parameter in the search request, then the FHIR Server will include all referenced resources in the same response. The advantage is that the requester only needs to issue a single query result and the result will contain all the necessary data. The disadvantages are (1) the payload size may increase significantly, (2) the server will need to perform more work and may return the response slower, (3) it is an optional capability of the server.

#### XX.4.1.9 Referenced Resource vs Contained Resource

A DiagnosticReport resource includes many references to other resources. Technically it is possible for the Report Creator to include these other resources as [contained](https://www.hl7.org/fhir/references.html#contained) resources, these contained resources are not independently accessible and they cannot be searched. Therefore in IMR, when storing a DiagnosticReport resource, all referenced resources are actual resources and are referenced accordingly.

### XX.4.2 Use Cases

This profile is focused on encoding multimedia contents in diagnostic reports such that later the user can interact with the embedded multimedia contents in the reports.

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

Upon reviewing reports for a patient in the EMR which natively supports as an IMR Report Reader, the EMR encounters an IMR multimedia report. It displays the reports with interactive links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader retrieves the images from the Imaging Document Source and displays the images with interactive tools. The Clinicians can navigate the series and see the measurements with annotations as described in the report.

##### XX.4.2.2.2 Consume and Interact with Multimedia Report by Standalone Report Reader Process Flow

Figure XX.4.2.2.2-1 shows how the Clinician can use the EMR with native IMR Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-standalone.svg%}
</div>
<br clear="all">

Figure XX.4.2.2.2-1: Consume and Interact with Multimedia Report by Standalone Report Reader Process Flow in IMR Profile

#### XX.4.2.3 Use Case 3: Consume and Interact with Multimedia Report by Report Reader with Integrated Invoker Image Display

##### XX.4.2.3.1 Consume and Interact with Multimedia Report by Report Reader with Integrated  Image Display Invoker Use Case Description

The functionality of this use case is the same as in Use Case 2. The difference is that the IMR Report Reader does not natively support image viewing capability. Instead it paired with an Image Display Invoker to launch an Image Display that can do so. Upon reviewing reports for a patient in the EMR which supports as an IMR Report Reader with integrated Image Display Invoker, the EMR encounters an IMR multimedia report. It displays the reports with interactive links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader launches the integrated Image Display Invoker which in turn invokes the configured Image Display in context based on the information in the link. The Image Display retrieves and displays the images with interactive tools. The Clinicians can navigate the series and see the measurements with annotations as described in the report.

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

A similar workflow can also happen in the clinician reading context. In this case, a clinician is reviewing reports and studies for a patient in the EMR, but the EMR does not support as an IMR Report Reader. It displays the report as normal text report without the multimedia content. The clinician clicks on a study, the integrated Image Display Invoker launches the configured Image Display in context. However, this Image Display also fetches the report as part of its image viewing process, and this Image Display is also integrated with an IMR Report Reader. It identifies that the study has an associated multimedia report. It displays the study along with the report with interactive links to the multimedia content. The Clinician clicks on the interactive links. The integrated Report Reader retrieves the corresponding images to which the measurements are derived from and display them in the Image Display. The clinician can interact with the images to see the annotation.

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

The rendered report (either rendered by the Report Reader, or bundled in the DiagnosticReport) includes hyperlinks. It is recommended for any deployment to have network configurations that only allow trusted known clients (e.g. by IP address or subnet) to access, and block unknown clients. Furthermore, the requests to these hyperlinks should be authorized. Unauthorized access should be rejected.

## XX.6 IMR Cross-Profile Considerations <a name="other-grouping"> </a>

**Scheduled Workflow (SWF.b)**: An Image Display can be grouped with an IMR Report Reader to enhance the report viewing capability for prior studies.

**Results Distribution (RD)**: A Report Creator that supports the HL7 Text Report Option can use Result Distribution to send the text report to other consumers.

**Basic Image Review (BIR)**: A Report Reader can be grouped with an Image Display in BIR to provide the required image display functionality.