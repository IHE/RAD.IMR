### Issues

#### Open Issues

These issues were known as part of the publication, and IHE invites comments.

|#|Question|
|-|--------|
|1|Q: IMR currently requires a Report Creator to also include a default rendered report in HTML format with all contents (including the image references) to show rendered images. Is this requirement too high for a Report Creator and should leave as a named option to output rendered report?|
|2|Q: For DiagnosticReport.effective[x], should Period data type be also supported in addition to DateTime?|
|3|Q: Will creating an addendum interferes with FHIR events and subscription? <br><br> A FHIR resource such as DiagnosticReport can be used as an event. Subscribers can be setup to receive notification when event happened. In normal case, there may be subscription created to receive resource update notifications. However, for DiagnosticReport, a common practice is rather than updating the report, a new addendum will be created. This means a subscription expecting to receive notification when reports are updated may not get notification because the DiagnosticReport resources are not being updated. Will this immutability semantics cause any problem with FHIR events and workflow? |
|4|Q: Should there be any constraints on the DiagnosticReport.status? <br><br> The base ValueSet has a rich set of status that may or may not apply to radiology reporting.|
|5|Q: Do we need to capture when the DiagnosticReport resource is signed off by the radiologist? There is currently no such timestamp available.|
|6|Q: Should the Report Creator supports RAD-Y4 Retrieve Rendered Diagnostic Report? <br><br> It is possible for the Report Creator to include a rendered report in DiagnosticReport.presentedForm using a URL link instead of embedded. This is the case if the Report Creator host the report on its own. In this case, should the Report Creator require to support RAD-Y4? Currently it is optional for the Report Repository to retrieve the report from Report Creator and then switch the hosting to itself. The expectation is that the Report Repository is design to host these reports and support API to query/retrieve reports or distribute the reports. Such behavior is normally not expected from a Report Creator.|
|7|Q: Use ImageSelection to specify how multimedia content can be referenced in an Observation? <br><br> In FHIR R5, a new ImageSelection resource is available, which allows more sophisticated reference to a study, with the additional capability to include imageRegion. This is a good match for IMR, but currently in draft.|
|8|Q: Should the Report Creator required to create a default rendered report, or leave it as an option? <br><br> The presentedForm is required to be fully ready-to-display by the Rendered Report Reader. This means all image references are required to be rendered as some rendered format, whether it is WADO-RS with Rendered Image, or other rendered format supported by the browser. It may be too much to ask for a Report Creator to do.|
|9|Q: Should IMR support all FHIR resources in both XML and JSON, or JSON only?|
|10|Q: For RAD-Y3, should IMR impose any requirements on the ability to support _include or _revinclude in FHIR query? <br><br> DiagnosticReport resources include many references to other resources such as Patient, IMR Observation, etc. By default, a query result will not include those referenced resources and the client will need to issue subsequent FHIR APIs to retrieve those resources. Optionally if the server supports the _include search parameter, then the server will include all referenced resources in the same response. This may simplify the work in the client, but it may increase the payload of the response significantly.|
|11|Q: Will there be cases that a DiagnosticReport has no referenced ServiceRequest (or Order)? <br><br>For example, in ED cases, will report be created before an order exist?|
|12|Q: Is the report content structure defined using DiagnosticReport too high a requirement? <br><br> IMR defines some general report content structure based on FHIR DiagnosticReport and other dependent resources. This includes common attributes like Finding and Impression and Indication.|
{: .grid}


#### Closed Issues

These issues have been decided and documented in the publication.

|#| Question |
|-|----------|
|1|Q: How to reduce redundant information across referenced resources? <br><br> For example, a DiagnosticReport may contain more than one Observations. Since different Observations belong to the same report, many of the attributes except for the actual value or interpretation will be different. Hence there can be lots of redundant information. Also such information may be also redundant at another resource (e.g. subject is repeated in DiagnosticReport) <br><br> A: Each referenced resource should be self-contained as they can be standalone and used outside the context of a DiagnosticReport. They can be searched independently. So using references, the redundant information is basically referencing the same common references, not duplicated.
|2|Q: IMR does not currently impose any constraint on Patient, Organization, Practitioner and PractitionerRole. Should there be any constraints or leave it to the deployment to impose any profiles on these resources? <br><br> A: Do not constraint in IMR. Let the deployment decides if any profiles on these resources should be imposed.|
{: .grid}