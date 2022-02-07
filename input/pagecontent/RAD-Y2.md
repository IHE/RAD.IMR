### 2:3.Y2.1 Scope

This transaction is used to present the multimedia report content to someone, such as a radiologist or a clinicians, in such a way that the user can interactive with the embedded multimedia contents.

### 2:3.Y2.2 Actors Roles

The roles in this transaction are defined in the following table and may be palyed by the actors shown here:

**Table: Actor Roles**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Requester | Request to retrieve multimedia content referenced in the report    | Report Reader <br> Report Reader with Integrated Image Display Invoker <br> Report Reader with Integrated Image Display    |
| Responder | Return the requested multimedia content | Imaging Document Source <br> Image Manager / Image Archive |
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:3.Y2.3 Referenced Standards

**DICOM PS3.4: C-Move**
**DICOM PS3.18: WADO-RS**

### 2:3.Y2.4 Messages

<div>
{%include RAD-Y2-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.Y2.4-1: Interaction Diagram**


#### 2:3.Y2.4.1 Retrieve Images Message
The Requester retrieves one or more DICOM instances from the Responder.

Teh Requester shall support making requests to more than one Responder. The Responder shall support handling messages from more than one Requester

##### 2:3.Y2.4.1.1 Trigger Events

The User navigates through the multimedia content and triggers the Requester to fetch the referenced images as specified in the multimedia report.

##### 2:3.Y2.4.1.2 Message Semantics

###### 2:3.Y2.4.1.2.1 Report Reader Standalone
If the Requester is a Report Reader that natively knows how to retrieve and present the multimedia content, then this message is a DICOM WADO-RS request. The Requester is the User Agent, and the Responder is the Origin Server.

The request shall have the same semantics as RetrieveInstance or RetrieveFrames as defined in WADO-RS Retrieve [RAD-107], based on DiagnosticReport.result.derivedFrom.endpoint.address or DiagnosticReport.result.component.extension[derivedFrom].endpoint.address.

If the Requester claims support of the Series/Study Navigation Option, then the request shall also support the RetrieveSeries and RetrieveStudy semantics.

Note that although the DiagnosticReport resource provides a 'ready to view' HTML version of the report, the links embedded in the HTML are fixed. So it does not provide the Requester the control of how and what to retrieve.

###### 2:3.Y2.4.1.2.2 Report Reader integrated with Image Display
If the Requester is a Report Reader integrated with Image Display, then this message is a DICOM C-Move request. The Requester is the DICOM C-Move SCU, and the Responder is the DICOM C-Move SCP.

The request shall have the same semantics as Retrieve Images [RAD-16], Retrieve Presentation States [RAD-17], Retrieve Reports [RAD-27], Retrieve Key Image Notes [RAD-31] or Retrieve Evidence Document [RAD-45].

###### 2:3.Y2.4.1.2.3 Report Reader integrated with Image Display Invoker
If the Requester is a Report Reader integrated with Image Display Invoker, then this message is a HTTP GET request. The Requester is the User Agent, and the Responder is the Origin Server.

The request shall have the same semantics as Retrieve Display of Series Images or Retrieve Display of Study Images in Invoke Image Display [RAD-106].

##### 2:3.Y2.4.1.3 Expected Actions

The Responder shall accept and process the request.

#### 2:3.Y2.4.2 Return Images Message

##### 2:3.Y2.4.2.1 Trigger Events

The Responder receives the request to retrieve images or inovke an Image Display actor.

##### 2:3.Y2.4.2.2 Message Semantics

###### 2:3.Y2.4.2.2.1 Report Reader Standalone

The Responder shall provide the same expected actions as defined in WADO-RS Retrieve [RAD-107].

###### 2:3.Y2.4.2.2.2 Report Reader integrated with Image Display

The Responder shall provide the same expected actions as defined in Retrieve Images [RAD-16], Retrieve Presentation States [RAD-17], Retrieve Reports [RAD-27], Retrieve Key Image Notes [RAD-31] or Retrieve Evidence Document [RAD-45].

###### 2:3.Y2.4.2.2.2 Report Reader integrated with Image Display

The Responder shall provide the same expected actions as defined in Invoke Image Display [RAD-106].

##### 2:3.Y2.4.2.3 Expected Actions

###### 2:3.Y2.4.2.3.1 Report Reader Standalone

The Requester receives the requested objects and display them.

The Requester shall follow redirects (responses with values of 301, 302, 303 or 307. See
https://tools.ietf.org/html/rfc7231#section-6.4 for details) unless a loop or security policy
violation is detected.

###### 2:3.Y2.4.2.3.2 Reoprt Reader integrated with Image Display

The Requester receives the requested objects.

The Requester shall display the received objects in the Image Display that enables the user to interact with. If the integrated Image Display was already showing a different part of the same study as the received objects, the Image Display shall change the viewport to display the received objects.

###### 2:3.Y2.4.2.3.3 Report Reader integrated with Image Display Invoker

The Requester receives an HTTP return status whether the Image Display is invoked successfully or not.

#### 2:3.Y2.4.3 Display Multimedia Report Message

##### 2:3.Y2.4.3.1 Trigger Events

The Requester received the requested images.

##### 2:3.Y2.4.3.2 Message Semantics

The Requester shall display the received objects that enables the user to interactive with.

The Requester shall show any annotations received (e.g. key images, DICOM SR, etc.). *** TODO: Define what annotations are required and what are not ***

The Requester shall provide basic viewing tools for the user to interactive with the images. *** TODO: Define basic tools ***

##### 2:3.Y2.4.3.3 Expected Actions

The User can interact with the images in context of the triggered multimedia content.

The user may choose to redo some of the measurements in order to compare the data recorded in the report, for example. Note that these actions shall not affect the existing content in the multimedia report recieved. If the user decided to save the new measurements, for example, a new report will be created as an addendum instead of updating the existing report.

### 2:3.Y2.4.4 Security Considerations

See [IMR Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

This transaction is associated with a Begin-Instance-Transfer ATNA Trigger Event on the Requester and Instance-Transferred on the the Responder.

This transaction is also associted with Study Accessed ATNA Trigger Event on the Requester when the user interacts with the images.
