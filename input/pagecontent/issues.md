### Issues

#### Open Issues

These issues were known as part of the publication, and IHE invites comments.

- How to reduce redundant information across referenced resources?
    - For example, a DiagnosticReport may contain more than one Observations. Since different Observations belong to the same report, many of the attributes except for the actual value or interpretation will be different. Hence there can be lots of redundant information. Also such information may be also redundant at another resource (e.g. subject is repeated in DiagnosticReport)

- For DiagnosticReport.effective[x], should Period data type be also supported in addition to DateTime?

- Will creating an addendum interferes with FHIR events and subscription?
    - A FHIR resource such as DiagnosticReport can be used as an event. Subscribers can be setup to receive notification when event happened. In normal case, there may be subscription created to receive resource update notifications. However, for DiagnosticReport, a common practice is rather than updating the report, a new addendum will be created. This means a subscription expecting to receive notification when reports are updated may not get notification because the DiagnosticReport resources are not being updated. Will this immutability semantics cause any problem with FHIR events and workflow?

- Should there be any constraints on the DiagnosticReport.status?
    - The base ValueSet has a rich set of status that may or may not apply to radiology reporting.

- Do we need to capture when the DiagnosticReport resource is signed off by the radiologist? There is currently no such timestamp available.

- Should the Report Creator supports RAD-Y4 Retrieve Rendered Diagnostic Report?
    - It is possile for the Report Creator to include a rendered report in DiagnosticReport.presentedForm using a URL link instead of embedded. This is the case if the Report Creator host the report on its own. In this case, should the Report Creator require to support RAD-Y4? Currently it is optional for the Report Repository to retrieve the report from Report Creator and then switch the hosting to itself. The expectation is that the Report Repository is design to host these reports and support API to query/retrieve reports or distribute the reports. Such behavior is normally not expected from a Report Creator.

- Use ImageSelection to specify how multimedia content can be referenced in an Observation?
    - In FHIR R5, a new ImageSelection resource is available, which allows more sophisticated reference to a study, with the additional capability to include imageRegion. This is a good match for IMR, but currently in draft.

#### Closed Issues

These issues have been decided and documented in the publication.