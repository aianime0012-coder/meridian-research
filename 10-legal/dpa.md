# Data Processing Agreement (DPA)

> **TEMPLATE — not legal advice. Have qualified counsel in the relevant jurisdiction review before execution.**

**Parties:**
- **Controller ("you" / "Customer"):** [Customer Legal Name], [Address]
- **Processor ("we" / "Provider"):** [Company Legal Name], [Address]

**Effective Date:** [Effective Date]
**Last Reviewed:** [Review Date]

---

## 1. Background and Purpose

This Data Processing Agreement ("DPA") forms part of the agreement between the Customer and [Company Legal Name] (the "Main Agreement") under which the Provider processes Personal Data on behalf of the Customer in connection with the research and advisory Services. This DPA sets out the terms governing the processing of Personal Data and the obligations of the parties, in accordance with applicable data protection law.

Where applicable data protection law recognizes the concepts of controller and processor, the roles are as set out below:
- The **Customer is the Controller** of the Personal Data it provides or makes available in connection with the Services.
- The **Provider is the Processor** of such Personal Data, processing it only on documented instructions of the Customer.

If the parties are both controllers with respect to specific data (e.g., contact information used for the operation of the engagement), the roles and responsibilities for that processing shall be as agreed in the Main Agreement or a separate schedule, and each party remains responsible for its own compliance with applicable law.

## 2. Definitions

- **Personal Data:** any information relating to an identified or identifiable natural person, as defined by applicable data protection law.
- **Processing:** any operation performed on Personal Data, including collection, recording, organization, structuring, storage, adaptation, retrieval, use, disclosure, and deletion.
- **Data Subject:** the identified or identifiable natural person to whom Personal Data relates.
- **Applicable data protection law:** the GDPR, the CCPA/CPRA, and any other data protection or privacy law or regulation applicable to the processing under this DPA, as applicable.

## 3. Scope and Duration

This DPA applies to all Personal Data processed by the Provider in connection with the Services. The term of this DPA commences on the Effective Date and continues until the end of the processing services under the Main Agreement, after which point obligations relating to deletion/return of Personal Data (Section 11) and audit (Section 8) continue to apply.

## 4. Instructions

- The Provider shall process Personal Data only on documented instructions from the Customer, unless required to do so by applicable law (in which case the Provider shall, unless prohibited by law, inform the Customer of that legal requirement before processing).
- Instructions may be given via the Main Agreement, this DPA, order forms, or written communications.
- If the Provider reasonably believes an instruction infringes applicable data protection law, it shall inform the Customer without undue delay.

## 5. Categories of Personal Data and Data Subjects

### 5.1 Categories of Personal Data Processed
Depending on the Services provided, the following categories of Personal Data may be processed:
- Contact information (name, email, phone number, company, job title);
- Account and login information;
- Billing and payment information (processed by payment processors; Provider does not store full card numbers);
- Engagement-related content and communications;
- Usage and analytics data (aggregated/pseudonymized);
- [Other categories as specified in Appendix 1].

### 5.2 Categories of Data Subjects
- Customers' employees, contractors, and representatives;
- Prospective clients and leads;
- End users of the Customer (if applicable);
- [Other categories as specified in Appendix 1].

### 5.3 Special Categories
The parties acknowledge that Special Categories of Personal Data (e.g., health, biometric, or other sensitive data) are not intentionally processed unless expressly agreed in writing, in which case additional safeguards shall be implemented.

## 6. Provider's Obligations

The Provider shall:
- Process Personal Data only on documented instructions (Section 4);
- Ensure that persons authorized to process Personal Data have committed themselves to confidentiality;
- Implement and maintain appropriate technical and organizational security measures (Section 7);
- Not engage a sub-processor without the mechanism described in Section 10;
- Assist the Customer with data subject rights requests and regulator inquiries (Section 9);
- Assist the Customer with data protection impact assessments (DPIAs) and consultations with supervisory authorities where required and feasible (Section 9);
- Return or delete Personal Data at the end of the term (Section 11);
- Not use Personal Data for any purpose other than providing the Services;
- Not sell, rent, or disclose Personal Data to third parties except as permitted by this DPA or applicable law.

## 7. Security Measures

The Provider shall implement appropriate technical and organizational security measures, including:
- **Encryption:** encryption of Personal Data in transit (TLS/HTTPS) and at rest where technically feasible;
- **Access control:** access to Personal Data restricted to personnel on a need-to-know basis, with unique credentials, least-privilege principles, and multi-factor authentication where supported;
- **Confidentiality:** contractual and technical confidentiality obligations for all personnel with access;
- **Vulnerability management:** regular security updates, patching, and malware protection;
- **Backups:** regular, tested backups to support continuity and recovery;
- **Breach response:** procedures to detect, respond to, and notify of personal data breaches (Section 9);
- **Staff training:** privacy and security training for personnel;
- **Sub-processor controls:** due diligence and contractual controls over sub-processors (Section 10).

A more detailed description of security measures may be provided on request or in Appendix 2. The Provider may update its security measures without prior notice where such changes do not degrade the overall level of security.

## 8. Audits and Evidence of Compliance

- The Provider shall make available, upon the Customer's reasonable written request and subject to confidentiality, information necessary to demonstrate compliance with this DPA.
- The Customer (or its independent auditor) may audit the Provider's compliance with this DPA, provided that: (a) the audit is conducted during normal business hours; (b) the Customer gives reasonable advance notice; (c) the audit does not unreasonably interfere with the Provider's operations; and (d) the Customer takes reasonable steps to minimize disruption and protect confidential information.
- To avoid unnecessary disruption, independent third-party certifications (e.g., SOC 2, ISO 27001), penetration test summaries, or similar audit reports, where available, may be relied upon in lieu of, or to satisfy portions of, an on-site audit.
- Audit costs are borne by the requesting party unless the audit reveals a material breach of this DPA, in which case the Provider bears the reasonable costs of the audit.

## 9. Assistance Obligations

### 9.1 Data Subject Rights
The Provider shall, taking into account the nature of the processing and the information available to it, reasonably assist the Customer in responding to data subject requests to exercise rights (e.g., access, rectification, erasure, restriction, portability, objection). Where a data subject contacts the Provider directly, the Provider shall refer the request to the Customer (where feasible) and may inform the data subject that it is a processor acting on the Customer's behalf.

### 9.2 Data Breach Notification
- Upon becoming aware of a personal data breach affecting Personal Data processed under this DPA, the Provider shall notify the Customer without undue delay (and no later than [48–72] hours where required by applicable law).
- The notification shall include, to the extent available: the nature of the breach, categories and approximate numbers of data subjects and records affected, likely consequences, and measures taken or proposed to mitigate and address the breach.
- The Provider shall reasonably assist the Customer with its breach notification obligations to supervisory authorities and data subjects where required by applicable law.

### 9.3 DPIAs and Consultations
The Provider shall, where required and to the extent feasible, assist the Customer with data protection impact assessments and prior consultations with supervisory authorities, taking into account the nature of the processing and the information available to it.

## 10. Sub-Processors

### 10.1 Authorized Sub-Processors
The Customer authorizes the Provider to engage the following sub-processors, which process Personal Data only to support the Services:

| Sub-Processor | Activity | Location | Notification Required? |
|---|---|---|---|
| Stripe | Payment processing | [Location] | Yes |
| [Email Provider, e.g., SendGrid/Mailchimp/Postmark] | Transactional/marketing email | [Location] | Yes |
| [CRM Provider, e.g., HubSpot/Pipedrive/Salesforce] | CRM and relationship management | [Location] | Yes |
| [Hosting Provider, e.g., Vercel/Netlify/AWS/Cloudflare] | Hosting and infrastructure | [Location] | Yes |
| [Analytics Provider, e.g., Plausible/Google Analytics] | Usage analytics | [Location] | Yes |

### 10.2 Approval Mechanism
- The Provider shall not engage a new or replacement sub-processor without prior written authorization from the Customer, or, where the parties agree to a general authorization, without notifying the Customer of any intended changes.
- The Provider shall give the Customer at least [30] days' prior notice of any intended new or replacement sub-processor.
- If the Customer objects to a new sub-processor within [10] business days of the notice, the parties shall work in good faith to resolve the objection. If the parties cannot agree, the Customer may terminate the affected Services without penalty (subject to fees for Services already provided).
- The Provider shall impose on each sub-processor contractual obligations no less protective than those in this DPA, and shall remain fully liable to the Customer for the sub-processor's performance.

## 11. International Transfers

- Where Personal Data is transferred internationally to a jurisdiction not recognized by applicable law as providing an adequate level of protection, the parties shall implement appropriate safeguards, including (where applicable) the EU Standard Contractual Clauses (SCCs), UK Addendum, or equivalent approved transfer mechanism, which are incorporated into this DPA by reference.
- Sub-processor transfers are addressed through the sub-processor agreements and the mechanisms described in Section 10.
- A list of transfer mechanisms relied upon is available on request.

## 12. Term and Deletion on Termination

- This DPA continues in effect until the termination or expiry of the Main Agreement.
- Upon termination, the Provider shall, at the Customer's choice and subject to applicable law, return or delete all Personal Data processed under this DPA (including copies), unless applicable law requires retention.
- The Provider may retain Personal Data to the extent required by applicable law (e.g., tax, accounting, or litigation obligations), in which case the data shall remain protected under this DPA and shall be used only for the purpose of the retention requirement.

## 13. Liabilities

Each party's liability under this DPA is subject to the limitations of liability set out in the Main Agreement. The Customer is responsible for the accuracy, quality, and lawfulness of the Personal Data it provides and for the legal basis for processing.

## 14. General Provisions

- **Confidentiality:** Both parties shall keep confidential any non-public information exchanged under this DPA, including audit results and security details.
- **Relationship to Main Agreement:** This DPA is incorporated into, and forms part of, the Main Agreement. In the event of conflict regarding data processing, this DPA prevails.
- **Severability:** If any provision of this DPA is unenforceable, the remainder shall remain in effect.
- **Amendments:** This DPA may be amended only by written agreement of the parties. It may be updated to reflect changes in applicable law or the parties' practices.

## Appendix 1 — Details of Processing

- **Categories of Personal Data:** [See Section 5.1; specify any additional categories]
- **Categories of Data Subjects:** [See Section 5.2; specify any additional categories]
- **Purpose of Processing:** Provision of research and advisory services, including communications, billing, analytics, and support.
- **Retention:** [Specify retention periods per data category, subject to Section 12]

## Appendix 2 — Security Measures (Detailed)

- **Physical:** [data center physical security, where applicable]
- **Organizational:** [roles, responsibilities, training, incident management]
- **Technical:** [encryption standards, access controls, logging and monitoring]
- **Resilience:** [backup schedules, RPO/RTO targets, disaster recovery testing]

---

*Signatures to be added per the parties' standard execution practices. This document is a template and does not constitute legal advice. Have qualified counsel in the relevant jurisdiction review and customize it before execution.*
