do
$$
    declare
        counter integer;
    begin
        SET session_replication_role = 'replica';

        -- jhi_authority
        select count(*) into counter from public.jhi_authority;
        if counter = 0 then
            INSERT INTO public.jhi_authority VALUES ('ROLE_ADMIN', 'ADMIN');
            INSERT INTO public.jhi_authority VALUES ('ROLE_USER', 'USER');
        end if;

        -- jhi_user
        INSERT INTO public.jhi_user
        VALUES (1, 'admin', '$2a$10$xsorDttnaQ45./hnqsGqxuPuakzUVlsYbCJgD7jIp45gHHjiJLsMW', 'Administrator',
                'Administrator', 'admin@localhost', NULL, true, 'en', NULL, NULL, 'system', '2022-04-17 16:08:24.018',
                NULL, 'system', '2023-10-09 11:25:28.2847', NULL, NULL, NULL, NULL, true)
        ON CONFLICT(id) DO NOTHING;

        -- jhi_user_authority
        INSERT INTO public.jhi_user_authority VALUES (1, 'ROLE_ADMIN') ON CONFLICT DO NOTHING;
        INSERT INTO public.jhi_user_authority VALUES (1, 'ROLE_USER') ON CONFLICT DO NOTHING;

        -- utm_alert_tag
        INSERT INTO public.utm_alert_tag VALUES (1, 'False positive', '#f44336', true) ON CONFLICT DO NOTHING;

        -- utm_asset_types
        INSERT INTO public.utm_asset_types VALUES (1, 'DATABASE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (2, 'FIREWALL') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (3, 'CLOUD') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (4, 'LAPTOP') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (5, 'SERVER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (6, 'WORKSTATION') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (7, 'PC') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (8, 'OTHER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (9, 'BRIDGE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (10, 'BROADBAND ROUTER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (11, 'GAME CONSOLE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (12, 'GENERAL PURPOSE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (13, 'HUB') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (14, 'LOAD BALANCER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (15, 'MEDIA DEVICE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (16, 'PBX') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (17, 'PDA') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (18, 'PHONE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (19, 'POWER-DEVICE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (20, 'PRINT SERVER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (21, 'PROXY SERVER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (22, 'REMOTE MANAGEMENT') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (23, 'ROUTER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (24, 'SECURITY-MISC') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (25, 'SPECIALIZED') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (26, 'STORAGE-MISC') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (27, 'SWITCH') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (28, 'TELECOM-MISC') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (29, 'TERMINAL') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (30, 'TERMINAL SERVER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (31, 'VOIP ADAPTER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (32, 'VOIP PHONE') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (33, 'WAP') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (34, 'WEB SERVER') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (35, 'WEBCAM') ON CONFLICT DO NOTHING;
        INSERT INTO public.utm_asset_types VALUES (36, 'PRINTER') ON CONFLICT DO NOTHING;

        -- utm_compliance_report_config
        select count(*) into counter from public.utm_compliance_report_config;
        if counter = 0 then
            INSERT INTO public.utm_compliance_report_config
            VALUES (442,
                    'The Windows Account Logon Failure Report provides comprehensive visualization of failed logon attempts in a Windows-based environment, segregated by reason status and user-host information. This report plays an important role in demonstrating security controls that relate to access and identity management, which is significant in compliance with various regulations.<br/><br/>For HIPAA, this report contributes evidence of enforcing access controls (164.312(a)(1)) and log-in monitoring (164.308(a)(5)(ii)(C)). For CMMC, it supports control AC.2.013 by limiting unsuccessful logon attempts and satisfying SI.4.230, which requires a system that alerts and limits anomalous activities.<br/><br/>In GLBA, this report supports the safeguard rule by showing active monitoring of access attempts, critical for detecting unauthorized access. It also helps in validating user identification and authentication procedures, making it useful for demonstrating SOC2 Type 2 controls related to user access.<br/><br/>For FISMA, the report aids in demonstrating compliance with the AC-7 control on unsuccessful logon attempts. It assists in meeting GDPR requirements on data privacy and access control by identifying potential unauthorized access attempts.<br/><br/>For PCI-DSS, this report supports Requirement 10 to track and monitor all access to network resources and cardholder data. By monitoring and investigating failed login attempts, enterprises can identify, respond to and mitigate potential risks in a timely fashion.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 266, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (443,
                    'The Windows Account Logon Success Report provides a consolidated view of successful logon events. This report supports security controls such as managing and controlling user access and monitoring system activity, hence proving compliance with key elements across numerous regulations. <br/><br/>For HIPAA, this aligns with the Technical Safeguard for Access Control which requires covered entities to implement procedures for the control of, and access to, electronic protected health information (45 CFR § 164.312(b)).<br/><br/>Under CMMC, it aligns with Access Control (AC.1.001 & AC.1.002), relating to limiting information access to authorized users.<br/><br/>With GLBA, it supports the Safeguards Rule, reinforcing the need for a security program that ensures the safeguarding of customer information.<br/><br/>In compliance with SOC2 Type 2, the report provides evidence for satisfying the criteria for Security, demonstrating that only authorized individuals have access.<br/><br/>For FISMA, the report ties with control AC-2 - Account management, reflecting on the effective management of system access by tracking successful logon events.<br/><br/>Under GDPR, it helps in establishing the control “Access” in Article 32, demonstrating the ability to ensure system access only to authorized persons to prevent unauthorized processing of personal data.<br/><br/>PCI-DSS mapping is to Requirement 8, authenticating access to system components. A successful logon validates the effectiveness of user identification and authentication mechanisms. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 265, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (444,
                    'This security report logs the assignment of special privilege escalations, aiding in identifying potentially rogue accounts or insider threats. It supports user access management and compliance by monitoring for elevated permissions activity – a crucial aspect in maintaining robust cybersecurity practices.<br/><br/>1. HIPAA: Helps meet Security Rule''s provisions especially §164.308(a)(4) (Information Access Management), as it aids in controlling permissions.<br/>   <br/>2. CMMC: Contributes to control AC.1.001 (limiting system access to authorized users), AC.1.002 (process for managing accounts), and AC.2.011 (session termination at the end of a user session).<br/><br/>3. GLBA & SOC2 Type 2: This report supports the Information Security Program''s objectives as specified in GLBA and Common Criteria (CC4.1/CC5.7) of SOC2 Type 2, ensuring access control & activity monitoring.<br/><br/>4. FISMA: Helps meet control CP-9 (Protection of Information at Rest) as it tracks special privilege assignments to prevent unauthorised access.<br/><br/>5. GDPR: Assists in meeting Article 32 requiring the implementation of appropriate security of data, particularly people who have access to personal data.<br/><br/>6. PCI-DSS: Contributes to the requirement 8 - Identify and authenticate access to system components. <br/><br/>The report''s core value lies in its capabilities to promptly detect privilege escalations, anomalous behavior, and potential insider threats, thereby reinforcing overall data protection mechanisms.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 264, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (445,
                    'This report presents aggregated and correlated logs for successful Office 365 (O365) active directory (AD) logins, categorized by the user, and the location from where the login originated. The visualization helps to quickly identify unusual patterns, like logins from unexpected locations or at odd times.<br/><br/>In terms of compliance:<br/>1. HIPAA: This report supports the "Information Access Management" control as it helps ensure that users are only accessing the network/resources from authorized locations.<br/>2. CMMC: It aligns with "Access Control" by monitoring who is accessing the network.<br/>3. GLBA: It assists with the "Safeguards Rule," ensuring that customers'' personal information is adequately protected.<br/>4. SOC2 Type 2: The adherence to the "Security" and “Access Controls” principles can be validated by this report as it tracks successful logins.<br/>5. FISMA: This report supports "Access Control" (AC-2: Account Management) by providing an account of successful logins.<br/>6. GDPR: Article 32 - security of processing, data breaches can be identified or prevented by monitoring login activities.<br/>7. PCI-DSS: Helps with Requirement 10 to regularly monitor and test networks, and Requirement 8 for identifying and authenticating access to system components.<br/>',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, true, 261, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (446,
                    'The CISCO ASA Firewall Activity report outlines incoming and outgoing traffic through the firewall, flagging suspicious activity like multiple failed login attempts, traffic from blacklisted IPs, unusual resource allocations, or data transfers. This showcases the organization''s active vigilance against cyber threats, demonstrating preventive security control. <br/><br/>1. HIPAA: This report supports the "Transmission Security Standard", helping prove that transmission of ePHI is secure and actively monitored for potential threats.<br/>2. CMMC: It maps to Level 3 Control (SC.3.173), validating that malicious code within transmissions are detected.<br/>3. GLBA: Aligns with Safeguards Rule, demonstrating administrative and technical measures taken for data protection. <br/>4. SOC2 Type 2: Contributes to the control - "System Monitoring", showing ongoing monitoring of security controls system activities.<br/>5. FISMA: Supports the control (AU-12), providing audit records for suspicious activities.<br/>6. GDPR: Demonstrates Article 32 obligation, outlining the implementation of appropriate security measures.<br/>7. PCI-DSS: It maps to control (1.2, 1.3, 1.4) showing that firewall and router configurations are secure, scrutinizing inbound and outbound traffic.<br/><br/>This detailed firewall analysis is critical for many compliance regulations, fulfilling requirements for demonstrable, monitored, and defensible security controls.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, true, 257, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (447,
                    'This security report logs the assignment of special privilege escalations to new logins, aiding in identifying potentially rogue accounts or insider threats. It supports user access management and compliance by monitoring for elevated permissions activity – a crucial aspect in maintaining robust cybersecurity practices.<br/><br/>1. HIPAA: Helps meet Security Rule''s provisions especially §164.308(a)(4) (Information Access Management), as it aids in controlling permissions.<br/>   <br/>2. CMMC: Contributes to control AC.1.001 (limiting system access to authorized users), AC.1.002 (process for managing accounts), and AC.2.011 (session termination at the end of a user session).<br/><br/>3. GLBA & SOC2 Type 2: This report supports the Information Security Program''s objectives as specified in GLBA and Common Criteria (CC4.1/CC5.7) of SOC2 Type 2, ensuring access control & activity monitoring.<br/><br/>4. FISMA: Helps meet control CP-9 (Protection of Information at Rest) as it tracks special privilege assignments to prevent unauthorised access.<br/><br/>5. GDPR: Assists in meeting Article 32 requiring the implementation of appropriate security of data, particularly people who have access to personal data.<br/><br/>6. PCI-DSS: Contributes to the requirement 8 - Identify and authenticate access to system components. <br/><br/>The report''s core value lies in its capabilities to promptly detect privilege escalations, anomalous behavior, and potential insider threats, thereby reinforcing overall data protection mechanisms.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 263, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (448,
                    'This security report from the SIEM logs, titled "Windows Account Created," provides a detailed analysis of all new Windows user accounts created and the trend of account creation over time within the organization''s systems. Two visualizations graphically represent this information for ease of understanding and monitoring.<br/><br/>The report enables compliance with multiple compliance regulations. Under GDPR''s ''right to personal data'', organizations must keep a record of all accounts with personal data being created. It is also critical for HIPAA as inappropriate account creation can lead to unauthorized access to Protected Health Information (PHI). <br/><br/>As per CMMC, organizations must have controls to monitor user activity (AC.2.016), which includes new account creation. FISMA also mandates secure user account management (AC-2; Identification and Authentication).<br/><br/>SOC2 Type 2 emphasizes monitoring system activities and identifying unauthorized access which includes new account creation, and PCI-DSS Requirement 10 mandates tracking and monitoring of all access to network resources and cardholder data.<br/><br/>In terms of GLBA, this enhances safeguards for data by limiting unauthorized access through creation of illegitimate accounts.<br/><br/>Overall, this report plays a crucial role in investigating any suspicious behavior or security events, strengthening cybersecurity posture, and maintaining compliance with various standards by providing evidence of effective user account management monitoring.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 267, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (449,
                    'The "File Operations by User" report is a valuable data asset that utilizes SIEM (Security Information and Event Management) logs to provide insights into user behaviors related to file actions. This includes file access events, such as read, write, delete, and modify actions, along with other file-related events, like file creation, copying, or movement. <br/><br/>1. HIPAA: safeguards including access controls (§164.312(a)(1)) and audit controls (§164.312(b)), are supported by such a report as it provides visibility to file operations in systems handling PHI (Personal Health Information).<br/><br/>2. CMMC: practices like ''Audit and Review Activities'' (AU.2.041) and ''Limit Data Access'' (AC.2.016) align with the insights received from this report.<br/><br/>3. GLBA: its Safeguard rule requires that organizations monitor file access to protect customers'' personal financial information. <br/><br/>4. FISMA: auditing for inappropriate or unusual activities (RA-5, AU-2), or unauthorized access (AC-4). <br/><br/>5. SOC2 Type 2: Common Criteria 7.2 requires organizations to monitor system activity regularly.<br/><br/>6. GDPR: it assists with rights like ''Access'' (Article 15) by monitoring operations on files ladened with personal data, and ''Integrity and Confidentiality'' (Article 5) by detecting unauthorized or inappropriate data processing activities. <br/><br/>7. PCI-DSS: requirement 10 which entails tracking and monitoring of all access to network resources and cardholder data can validate these using this report.<br/>',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 241, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (450,
                    'The Azure Login Activity report provides comprehensive insights into the login activities within the Azure environment. It displays critical details such as user IDs, IP addresses, timestamps, logins'' success or failure status, location, and more. <br/><br/>1. HIPAA: The report contributes to the Audit Controls (§164.312(b)) requirement by providing a detailed log of access activities that may contain PHI. <br/>2. CMMC: Under the Access Control (AC.4.096), a thorough record of login activities is required for the workforce to monitor and control access.<br/>3. GLBA: Safeguards Rule requires organizations to monitor systems for unauthorized access. Failures in login attempts highlighted in the report can give early warnings of such activities.<br/>4. SOC2 Type 2: One part of the Common Criteria (CC6.1) of SOC2 states that organizations must implement logical access security measures to protect data. Monitoring and documenting all attempted logins can prove adherence.<br/>5. FISMA: This report helps meet the AC-2 and AU-2 controls, requiring a method to authenticate and audit user activities.<br/>6. GDPR: Article 32 emphasizes security techniques like pseudonymization and encryption. The report helps demonstrate the access control and supports the conditions under Article 30 (Records of processing activities).<br/>7. PCI-DSS: Requirement 10 mandates tracking and monitoring all access to network resources and cardholder data. The report provides detailed logging of such activities to maintain compliance.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, true, 258, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (451,
                    'The Azure Login Activity report provides comprehensive insights into the login activities within the Azure environment. It displays critical details such as user IDs, IP addresses, timestamps, logins'' success or failure status, location, and more. <br/><br/>1. HIPAA: The report contributes to the Audit Controls (§164.312(b)) requirement by providing a detailed log of access activities that may contain PHI. <br/>2. CMMC: Under the Access Control (AC.4.096), a thorough record of login activities is required for the workforce to monitor and control access.<br/>3. GLBA: Safeguards Rule requires organizations to monitor systems for unauthorized access. Failures in login attempts highlighted in the report can give early warnings of such activities.<br/>4. SOC2 Type 2: One part of the Common Criteria (CC6.1) of SOC2 states that organizations must implement logical access security measures to protect data. Monitoring and documenting all attempted logins can prove adherence.<br/>5. FISMA: This report helps meet the AC-2 and AU-2 controls, requiring a method to authenticate and audit user activities.<br/>6. GDPR: Article 32 emphasizes security techniques like pseudonymization and encryption. The report helps demonstrate the access control and supports the conditions under Article 30 (Records of processing activities).<br/>7. PCI-DSS: Requirement 10 mandates tracking and monitoring all access to network resources and cardholder data. The report provides detailed logging of such activities to maintain compliance.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, true, 239, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (452,
                    'The "Office 365 Unsuccessful Logon Attempts" report provides a detailed view into failed logon attempts to an organization''s Office 365 environment, featuring visualizations for failed login instances per user and their geographical locations. <br/><br/>This report integrates critical security controls like ''Account Monitoring and Control'', ''Data Protection and Privacy'', and ''Incident Response and Management''. Unsuccessful logon attempts could signal a possible unauthorized access attempt, thereby satisfying the monitoring requirements of various laid down compliance standards.<br/><br/>For HIPAA, this report supports the technical safeguard of ''Access Control & Audit Controls'' by ensuring only authorized users have access and tracking login attempts. Similarly, for GDPR, it supports ''Article 32 - Security of processing'' by protecting against unauthorized data processing. <br/><br/>Under FISMA, it correlates to control ''AC-7: Unsuccessful Logon Attempts'' ensuring safeguards against repeated logon attempts. It backs PCI-DSS''s requirement ''10: Track and monitor all access to network resources'' by providing a way to audit access to system resources.<br/><br/>Under SOC2 Type 2, this report aids in addressing the security principle by identifying and documenting unsuccessful attempts. GLBA and CMMC also demand similar controls over access and incident management which are directly served by this report. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, true, 262, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (453,
                    'The "Meraki Firewall Activity" report, containing visualizations of the top 100 events sorted by IP source and Meraki events by source IP and port, is crucial for security management and compliance with numerous regulations.<br/><br/>1. HIPAA: By controlling and monitoring network access, it aids in maintaining the confidentiality of Protected Health Information (PHI), which is mandated under HIPAA.<br/>2. CMMC: The report aids in maintaining situational awareness (SA) and system and information integrity (SI), both required under CMMC level 3 regulations.<br/>3. GLBA: The report can help confirm the Safeguards Rule of GLBA by monitoring system activities and thereby protecting customers'' personal financial information.<br/>4. SOC 2 Type 2: This report demonstrates the effectiveness of the organization''s system controls which are required for SOC 2 Type 2 compliance.<br/>5. FISMA: The report assists in maintaining the system and information integrity (SI) control, crucial for FISMA compliance.<br/>6. GDPR: The report proves the implementation of appropriate security measures critical to protecting personal data of EU citizens, thereby aiding in GDPR compliance.<br/>7. PCI-DSS: For PCI-DSS, this report helps in fulfilling requirements for maintaining a secure network and regularly monitoring and testing',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, true, 259, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (454,
                    'The "Cisco Switch Activity" report provides comprehensive visibility on the network layer activities across the environment. It records and represents activities associated with Cisco switch, categorized by host, along with overall switch activity. This involves data like traffic, irregular behaviors, unauthorized access attempts, intrusion attempts, and network performance issues.<br/><br/>This report directly supports several compliance regulations:<br/><br/>1. HIPAA: It satisfies the ''Information Access Management'' (164.308(a)(4)) by monitoring unauthorized network access attempts, and ''Security Incident Procedures'' (164.308(a)(6)) by logging intrusion attempts.<br/>2. GLBA: Helps in fulfilling ''Safeguards Rule'', ensuring secure customer data transmission within the network, keeping track of unusual activity patterns, strengthening access controls.<br/>3. SOC 2 Type 2: The report adheres to the ''Communication and Information'' principle by displaying network activity thereby aiding in change management.<br/>4. FISMA: Supports AU (Audit & Accountability) controls by maintaining a detailed account of network activities.<br/>5. CMMC: Level 3 controls involving ''Detection and Monitoring'' can be met since SIEM helps identify malicious activity by maintaining comprehensive centralized logs.<br/>6. PCI-DSS: It contributes to Requirement 1, "Install and maintain firewall configuration to protect',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, true, 256, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (455,
                    'The Windows Systems Activity report is a valuable component for maintaining compliance with several standards. It includes visualizations for total Windows alert counts and a review of these alerts. These figures provide a snapshot of security-related activities within your Windows-based systems. <br/><br/>1. HIPAA: Ensures PHI is protected against threats to its security and integrity. Anomalies or high alert counts on Windows Systems could represent threats.<br/> 2. CMMC: Windows alerts fall under the "SIEM system" (AM.2.044), showcasing that malicious activity is being identified and mitigated.<br/>3. GLBA: Ensures customers'' personal financial information is adequately protected. Alerts triggered due to unusual activity help in safeguarding the information.<br/>4. SOC2 Type 2: Shows continuous monitoring of security controls. Alerts indicate that abnormal activity is detected and acted upon.<br/>5. FISMA: Windows alerts provide evidence for risk assessment (RA-3), audit and accountability controls (AU-2, AU-6) by assessing, detecting, and reporting unusual activities.<br/>6. GDPR: Alert count goes towards ensuring ongoing confidentiality, integrity, and availability of processing systems and services (Article 32).<br/>7. PCI-DSS: Helps meet Requirement 10.6 (Review logs and security events for all system components to identify anomalies or suspicious activity). Windows alert counts allow to spot such activities, adding an extra layer to the PCI-DSS compliance process.<br/>',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 203, true, 255, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (456,
                    'The Linux System Activity report provides a detailed overview of user account activities on Linux systems within the network. It gives insight into user actions, identification of unusual behavior, and assists in maintaining system accountability - an essential aspect of the system''s security posture.<br/><br/>Here''s how this report supports each of the compliance regulations:<br/><br/>1. HIPAA: Contributes to the control for Information Access Management, enforcing roles based user access control and monitoring.<br/> 2. CMMC: Assists with Access Control (AC) and Audit and Accountability (AU) Domains by providing an audit of account activities on the Linux systems.<br/>3. GLBA: Supports the Safeguards Rule by providing visibility on how customer data is accessed in the network.<br/>4. SOC2 Type 2: Demonstrates controls around user access and activity, enabling effective access control management and system activities monitoring.<br/>5. FISMA: The report helps to enact access and user control policies under Access Control Family (AC) and feeds into the Audit and Accountability Family (AU) control.<br/>6. GDPR: Facilitates accountability and integrity components under Article 32, by demonstrating the control over data access and manipulation within the Linux systems.<br/>7. PCI-DSS: This addresses the requirements around tracking and monitoring of all access to network resources and cardholder data, listed under Requirement 10.<br/>',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 204, true, 254, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (458,
                    'The Netflow Activity report from SIEM logs offers crucial insights into network traffic trends, demonstrating the count of host-related events and application-related events. It provides a unified view of network behavior, which helps in threat detection and response activities.<br/><br/>1. HIPAA, GLBA, and FISMA: This report assists with the network security requirements of these regulations. By measuring network activity, and identifying abnormal patterns, it helps maintain data integrity and confidentiality, central to HIPAA, GLBA, and FISMA.<br/>2. PCI-DSS: Control 10.6.1 states that daily log reviews are required for all system components. The Netflow Activity report facilitates this by providing a visualized overview of network activities.<br/>3. CMMC: This report contributes to the CMMC''s Domain "Network Protection" and "System & Information Integrity". Monitoring netflow activity offers data needed for network security practices and to identify potential intrusion attempts.<br/>4. SOC2 Type 2: As this report monitors network performance, it helps in achieving the Availability Trust Service Criterion of the SOC2 Type 2 framework, which demands system availability monitoring.<br/>5. GDPR: By helping to detect breaches early, this report plays a role in complying with GDPR''s mandate to notify authorities of breaches within 72 hours.  ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 202, true, 250, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (459,
                    'The "Dangerous Network traffic" report identifies potentially malicious network activity by correlating IP addresses and generating alerts based on Threat Intelligence data. This report plays a crucial role in meeting several compliance regulations:<br/><br/>1. HIPAA: It aids in the protection of ePHI (electronic Protected Health Information) by enabling early detection of threats that may compromise ePHI data integrity.<br/>2. CMMC: Aligns with Domain 3 (Access Control) by helping control the flow of data & identify malicious IPs seeking unauthorized access to Controlled Unclassified Information (CUI).<br/>3. GLBA: It supports the Safeguards Rule which requires financial institutions to protect customer information by identifying and handling network traffic from threat sources. <br/>4. SOC2 Type 2:  Supports ''Security'' principle by identifying and alerting on possible security threats.<br/>5. FISMA: Adequate security controls for network traffic aligns with FISMA''s requirements, namely, NIST SP 800-53''s AC-4 and SI-4.<br/>6. GDPR: Addresses Article 32’s requirement to implement suitable technical measures to guarantee data processing security, by identifying and managing potentially malicious network traffic.<br/>7. PCI-DSS: Supports Requirement 1 for maintaining a secure network, by identifying and managing dangerous network traffic.<br/><br/>This report, therefore, forms an integral part of an organization''s security stance, helping maintain compliance and protect sensitive data.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 202, true, 252, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (460,
                    'The Azure Subscription Activity is a security report that summarizes activities and operations in an Azure environment. It shows the number of events by resource and lists all Azure operations.<br/><br/>- HIPAA: This report aids in meeting the Audit Controls (164.312 b) requirement by monitoring the system activity and providing an audit trail of attempted access to electronic protected health information (ePHI).<br/>- CMMC: It contributes towards the Situational Awareness (SA.2.179) control, providing information about cyber operations to identify and respond to security incidents.<br/>- GLBA: The report addresses Detection, Prevention, and Response Mechanisms control by indicating abnormal activities that may suggest a security threat.<br/>- SOC2 Type 2: Aids in the monitoring and evaluating of alteration of system configurations, critical to meeting the System Activity Review Common Criteria (CC6.1).<br/>- FISMA: Supports the audit and accountability control (AU-2) which requires an organization to review/analyze information system activity to detect inappropriate or unusual activity.<br/>- GDPR: In line with Article 32''s requirement for a process to regularly test, assess, and evaluate the effectiveness of security measures, the report provides auditable evidence of this.<br/>- PCI-DSS: Contributes to Requirement 10: Track and monitor all access to network resources and cardholder data by providing an audit trail of system activity for each providing in-scope entity. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 301, true, 260, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (461,
                    'The Azure WAF report provides a clear overview of web application firewall (WAF) events across certain categories. It is crucial in identifying potential threats and maintaining cybersecurity.<br/><br/>1. HIPAA: It supports HIPAA’s “Access Control” and “Audit Control” requirements. Identifying and recording access attempts helps ensure only authorized users can view and handle PHI.<br/><br/>2. CMMC: It maps to three CMMC domains - "Access Control", "Audit and Accountability" and "Risk Management" by controlling access, chronicling events and detecting potentially malicious activities.<br/><br/>3. GLBA: The report aids compliance with GLBA by logging all events, a requirement under "Financial Privacy Rule" and "Safeguards Rule" to protect customer data.<br/><br/>4. SOC2 Type2: The report supports achieving "Security" and "Availability" service principles by monitoring security events and maintaining system availability.<br/><br/>5. FISMA: It satisfies a number of FISMA controls including AC-4 (Information flow enforcement) and AU-2 (Audit events).<br/><br/>6. GDPR: It helps meet the GDPR''s "Integrity and Confidentiality" principle by enabling prompt detection and rectification of security incidents to prevent breach of personal data.<br/><br/>7. PCI-DSS: The report supports PCI-DSS requirement 10 (Track and monitor all access to network resources and cardholder data) and requirement 1 (Install and maintain a firewall configuration to protect cardholder data) by tracking events and reporting potential breaches.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 301, true, 269, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (462,
                    'The AWS Subscription Activity report delivered by the SIEM system delivers critical visibility into user activity within the AWS infrastructure, including logons to the AWS Console and generated AWS Events. <br/><br/>Firstly, AWS Console logon activities can help towards maintaining the necessary access control as mandated by HIPAA (164.312(a)(1) - Access Control, 164.312(b) - Audit Controls) and CMMC (AC.2.009 - Login Monitoring), ensuring that only authorized individuals can access protected data. Besides, monitoring such activities can provide valuable logs for SOC2 Type 2 as part of Common Criteria 7 (System Monitoring).<br/><br/>Secondly, AWS Events indicate actions taken within the AWS ecosystem (e.g., starting/stopping instances, modifying security groups, or bucket policies). Such data helps assured configuration management (CM) and security incident event management (SIEM), thus fulfilling parts of the FISMA and NIST standards (CM.2.061, IR.3.093 to name a few) and PCI-DSS requirement 10 (track and monitor all access to network resources and cardholder data).<br/><br/>Further, these event logs contribute to GDPR''s requirement for both integrity and confidentiality (Article 32) and GLBA’s Safeguard Rule, where firms are required to design and implement a safeguards program.<br/><br/>This report helps ensure the organization meets key aspects of these compliance standards, providing necessary evidence during audits and enabling proactive measures to minimize security risk.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 301, true, 239, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (463,
                    'The O365 Active Directory report provides crucial insight into user activity details and potential suspicious behavior in the network. This report''s data can greatly assist in compliance with various regulations and standards by mapping to specific security controls.<br/><br/>HIPAA: The report helps safeguard sensitive health information by monitoring unauthorized access attempts, which is crucial for the Administrative Safeguards requirement.<br/><br/>GLBA: The report supports the Safeguards Rule by monitoring, detecting, and documenting security incidents involving customer data.<br/><br/>CMMC: The activity log supports Level 3 controls by providing audit records, risk management, and identification of malicious content.<br/><br/>FISMA: The report helps implement control RA-5 (Vulnerability Scanning), SI-4 (Information System Monitoring), AU-2 (Audit Events), and AU-12 (Audit Generation).<br/><br/>SOC2 Type 2: Logs align with monitoring access control and changes to systems processing data, providing real-time alerts for unauthorized access.<br/><br/>GDPR: The report supports the accountability and data security principles by enabling control and understanding over data processing activities.<br/><br/>PCI-DSS: The report is essential in meeting Requirement 10 (Track and monitor all access to network resources and cardholder data) by logging all components of the cardholder data environment.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 302, true, 271, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (464,
                    'The O365 Exchange Report is a comprehensive summary of the top 5 most executed exchange operations and other exchange activities occurring within the Office 365 environment. This report provides insights into user activities, permission changes, mailbox operations, and policy modifications. <br/><br/>From a compliance perspective, such information is crucial as it ensures strict adherence to HIPAA, GLBA and GDPR regulations concerning data privacy and integrity. By closely monitoring exchange operations, businesses can identify and prevent unauthorized access or data sharing, something that is vital in the healthcare industry (HIPAA), financial institutions (GLBA), and organizations managing data of EU citizens (GDPR). <br/><br/>For the CMMC, domains like Access Control (AC) and Audit and Accountability (AU) relate directly to such reports because it ensures controlled access and provides auditable evidence of data actions. <br/><br/>For FISMA, it maps to the AU family, allowing federal agencies to maintain audit logs and track information system activities.<br/><br/>In SOC2 Type 2, this report contributes to the "Security" and "Confidentiality" principles as it tracks sensitive data handling & access. <br/><br/>For PCI-DSS, requirement 10, "Track and monitor all access to network resources and cardholder data", this report provides documented proof that access to such resources is closely monitored. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 302, true, 253, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (465,
                    'The O365 SharePoint Report presents detailed information on user activities within SharePoint including identity of the users, time of access, and actions taken in SharePoint. <br/><br/>1. HIPAA: Sharing and storing patient data could occur in SharePoint. With this report, the organization can verify that only authorized users have accessed such information, meeting the Privacy Rule that requires the safeguarding of Protected Health Information (PHI).<br/>   <br/>2. CMMC: The report helps monitor and control communications at the system and information level as required by the CMMC practice AC.4.014. It also aids in audit and accountability, mapping to control AU.2.042.<br/><br/>3. SOC2 Type 2: By monitoring user accesses and activities, it helps organizations ensure the design and effectiveness of controls over the security, availability, processing integrity, and privacy of customer data, adhering to the principle of Communication and Information.<br/><br/>4. FISMA: This report maps to control AU-3 (Audit and Accountability) which requires organizations to create, analyze and retain system audit logs, and to IR-5 (Incident Response), as anomalies and suspicious activities can be identified and responses initiated.<br/><br/>5. GDPR: This report supports the monitoring of data processing activities (Article 30) by showing who accessed what data and when, fostering transparency and accountability.<br/><br/>6. PCI-DSS: It supports Requirement 10 by tracking, monitoring all access to network resources and cardholder data.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 302, true, 251, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (466,
                    'The Windows Alerts report generated by the SIEM provides an overview of security alerts classified by category and status, collected from Windows-based systems in the network. These alerts may include unauthorized login attempts, suspicious network activity or malicious behavior, which can indicate potential security breaches or vulnerabilities.<br/><br/>This report contributes to several compliance regulations:<br/><br/>1. HIPAA: The report aids in fulfilling the Administrative Safeguards requirement, specifically under the Security Management Process standard which requires efforts to prevent, detect, contain, and correct security violations.<br/><br/>2. CMMC: Under the Domain Access Control (AC), it helps meet AC.2.016 - Control information flows between owners of the system and limit unauthorized data flow accordingly.<br/><br/>3. FISMA: The alerts contribute to the NIST SP 800-53 Rev. 4 control families AC (Access Control) and SI (System and Information Integrity).<br/><br/>4. PCI-DSS: This report contributes primarily towards Requirement 10: Track and monitor all access to network resources and cardholder data. <br/><br/>5. SOC 2 Type 2: Under the security principle, this report assists in identifying and responding to security incidents effectively.<br/><br/>6. GLBA: Helps meet safeguard rules with system risks identification and management.<br/><br/>7. GDPR: This report contributes to GDPR by enhancing the organization''s ability to detect and investigate data breaches which must be reported under GDPR''s timely report obligations.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 401, true, 248, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (467,
                    'The "Linux Alerts" security report generated by a SIEM consists of visualizations for Traffic by Linux Logs and Linux Alerts Reports. These indicate the analyzed network traffic going through the Linux servers, alongside the specific security alerts generated in response to detected unusual activities. <br/><br/>The report supports HIPAA by evidencing the monitoring of information systems that store, process, or transmit PHI (Protected Health Information). It also helps in meeting the CMMC''s requirement of network monitoring and inspection, necessary for safeguarding Controlled Unclassified Information (CUI). <br/><br/>For GLBA, whose safeguards rule requires financial institutions to ensure the security and confidentiality of customer information, the report can evidence continuous oversight of system activity. <br/><br/>Under SOC2 Type 2 and FISMA, this kind of report assists in demonstrating system monitoring, which is fundamental for validating system integrity and data protection measures.<br/><br/>In terms of GDPR, the report supports the compliance by helping the organization detect and promptly respond to potential data breaches, minimizing risks to data subject''s rights and freedoms.<br/><br/>Finally, for PCI-DSS, the report contributes to requirements for tracking all access to network resources and cardholder data, along with the need for a system to timely alert to possible compromises. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 402, true, 245, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (468,
                    'Azure Alerts report provides insight on security events and potential vulnerabilities identified within the Azure environment. It visualizes alerts and operations, and is instrumental for an enterprise''s proactive security posture, security monitoring and incident response.<br/><br/>1. HIPAA: This report helps in maintaining log monitoring standard (164.308(a)(5)(ii)(B)).<br/>2. CMMC: Contributes to SI.3.218, to monitor system security controls on an ongoing basis.<br/>3. GLBA: Helps in complying with security measures to protect against unauthorized access to customer records.<br/>4. SOC2 Type 2: Assists in monitoring system activities, part of the audit requirement of SOC2 Type 2.<br/>5. FISMA: Maps to AU-6 Audit Review, Analysis, and Reporting control by identifying and categorizing alerts.<br/>6. GDPR: Assists in Article 32''s requirement for ability to ensure ongoing confidentiality, integrity, availability and resilience of processing systems.<br/>7. PCI-DSS: Contributes to Requirement 10: Track and monitor all access to network resources and cardholder data.<br/><br/>The Azure Alerts report is vital for timely detection, prompt action as well as evidence of due diligence and due care for both internal audits and external regulators.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 403, true, 249, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (469,
                    'The Office 365 Alerts report provides insights into the O365 system''s security alerts, categorized by severity. The first visualization presents a comprehensive list of alerts, breaking them down by type, source, time, and related resources for a quick security overview. This assists in addressing security issues promptly and fosters an enhanced security posture. <br/><br/>The second visualization displays the "Top Severity in O365"  highlighting the most severe threats, which helps prioritize actions based on risk severity.<br/><br/>This report directly supports security controls like Access Control (AC), Audit and Accountability (AU), and System and Information Integrity (SI) under FISMA. For GDPR, it helps satisfy Article 32 requirements of ensuring ongoing confidentiality, integrity, and resilience of systems by quickly identifying and rectifying any breaches.<br/><br/>For HIPAA, the report aids in adhering to the Technical Safeguards section by providing necessary information to prevent inappropriate access to ePHI data stored or processed through O365. CMMC''s Domain RE (Risk Management) and SI (System & Information Integrity) controls can be demonstrated by identifying, assessing, and mitigating risks.<br/><br/>For GLBA, SOC2 Type 2 and PCI-DSS, this report helps in identifying and appropriately responding to security events, proving that the company has suitable incident response mechanisms. Also, it helps meet PCI DSS 10.6.1 requirements on reviewing logs for suspicious activities.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 404, true, 247, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (470,
                    'The Threat Activity Alert report is crucial for safeguarding the organization''s resources by identifying incidents that could potentially harm the system. It focuses on the top 5 alert categories by count and illustrates the total log count to identify trends and specific threat patterns, which assist in potential threat prediction and immediate response.<br/><br/>This report mainly supports the following compliances:<br/><br/>1. HIPAA: In terms of enforcing technical safeguards, it directly adheres with Access Control (164.312(a)(1)) which talks about real-time alert notifications in case of attempted or successful unauthorized access.<br/>   <br/>2. CMMC: Matches with Security Assessment (CA.2.157) requiring organizations to develop and implement system monitoring plans.<br/><br/>3. FISMA: Ensures accurate Risk Assessment (RA-5) through identifying and preparing the system against identified threat sources.<br/><br/>4. GDPR: Helps meet the ''Security of processing'' requirement under Article 32, which emphasizes the need for processes that ensure ongoing confidentiality, integrity, availability and resilience.<br/>   <br/>5. PCI-DSS: Aligns with Requirement 10: Track and monitor all access to network resources and cardholder data.<br/><br/>As the report aids in identifying possible vulnerabilities and unauthorized access attempts, it helps meet SOC2 Type2''s security and availability principles also and corresponds to GLBA’s Safeguards Rule to keep Customer Information secure. <br/>',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 405, true, 242, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (471,
                    'The "Windows AD Policy Change" report tracks alterations made to the organization''s Active Directory (AD) policies. It provides insight into who (top users) has initiated these changes and what specific modifications have been made. This report supports the organization in tracking the internal updates not only for accountability but indicating potential insider threats.<br/><br/>For HIPAA, which requires access control (§ 164.312(a)(1)), it helps ensure that ePHI is only accessed by authorized personnel, and any changes are accordingly recorded.<br/><br/>FISMA emphasizes the importance of monitoring changes to system components (AU-3). This report provides such information to ensure the integrity of the system and information.<br/><br/>It aids in meeting GLBA requirements for safeguarding customer data by maintaining a risk management program and related controls such as ''Monitoring Systems and Procedures'' to identify unauthorized access.<br/><br/>CMMC''s control (AC.2.016) requires that "The role and access privileges of system users should be reviewed periodically" and device access should be controlled. This report can provide information for such reviews.<br/><br/>For SOC2, the report supports the "Change Management" category of the "Common Criteria" by ensuring only authorized changes are made and traced back.<br/><br/>In terms of GDPR, this report aids in maintaining integrity and confidentiality (Article 32) as it ensures only authorized personnel are changing policies.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, true, 240, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (472,
                    'Your "AWS Alerts" report, generated from the Security Information and Event Management (SIEM) tool, presents important insights into security events within your Amazon Web Services (AWS) environment. It features two visualizations that display cover AWS alerts in detail.<br/><br/>This report is instrumental in demonstrating compliance with several regulatory frameworks:<br/><br/>1. HIPAA: It helps maintain the "Audit Controls" and "Protection from Malicious Software" requirements. The alerts may identify unusual data access patterns or potential malware, crucial for protecting healthcare information.<br/>   <br/>2. GDPR: Under ''Integrity and Confidentiality'' principle, the report can show any unauthorized or unusual data access patterns, thus enhancing data protection measures.<br/>   <br/>3. SOC2 – Type 2: The report supports the "Security, Availability, Processing Integrity, Confidentiality and Privacy" principles by revealing potential system vulnerabilities, unauthorized access attempts, etc.<br/>   <br/>4. FISMA: The report supports the risk assessment policy and procedures (RA-1) by identifying potential risks and supporting the process of risk mitigation.<br/>   <br/>5. PCI-DSS: The AWS Alerts report supports the requirement of "Track and monitor all access to network resources and cardholder data" by presenting access and usage patterns in the AWS environment. ',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 403, true, 244, 'TEMPLATE', NULL);
            INSERT INTO public.utm_compliance_report_config
            VALUES (474,
                    'The Threat Intelligence Alerts report generated from the SIEM provides a visual representation of the detected threats based on the IP and the alerts generated. This report illustrates the threat landscape the firm is facing, helping in timely responses. <br/><br/>1. HIPAA: It contributes to Administrative Safeguard requirements under HIPAA by ensuring a security incident procedure is in place for identifying and responding to various security incidents. <br/><br/>2. CMMC: Under SI (System and Information Integrity) domain, the report helps the organization to identify, analyze, and respond to incidents.<br/><br/>3. GLBA: It assists in meeting GLBA''s requirement controlling risks to customer information by identifying potential threats.<br/><br/>4. SOC2 Type 2: Contributes to Security, Availability and Processing integrity principles, by identifying threats and ensuring system''s availability and security.<br/><br/>5. FISMA: The report aids in adhering FISMA''s Risk Assessment (RA) control - RA.5 (Vulnerability Scanning), which requires scan for vulnerabilities in the system.<br/><br/>6. GDPR: Under Article 32’s requirement of implementing security measures to ensure a level of security appropriate to the risk, this report can help assess risk levels and respond accordingly.<br/><br/>7. PCI-DSS: Contributes to Requirement 10 by tracking and monitoring all access to network resources and cardholder data, identifying potential threats that could lead to unauthorized access.',
                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 405, true, 252, 'TEMPLATE', NULL);
        end if;

        -- utm_compliance_standard
        select count(*) into counter from public.utm_compliance_standard;
        if counter = 0 then
            INSERT INTO public.utm_compliance_standard
            VALUES (100, 'Account Management',
                    'Account management controls showcase security controls in place to monitor user and service account activity on the network, servers, cloud and SaaS applications.',
                    true);
            INSERT INTO public.utm_compliance_standard
            VALUES (200, 'Device Activity',
                    'Device Activity reports showcase security controls in place to monitor network and device activity.',
                    true);
            INSERT INTO public.utm_compliance_standard
            VALUES (300, 'Application Audit',
                    'Application Audit reports showcase security controls in place to monitor application activity on servers, workstations, cloud and SaaS.',
                    true);
            INSERT INTO public.utm_compliance_standard
            VALUES (400, 'Alerts and Incidents',
                    'Reports in this compliance section showcase threat activity detected by the system in the form of alerts and incidents along with their current status.',
                    true);
        end if;

        -- utm_compliance_standard_section
        select count(*) into counter from public.utm_compliance_standard_section;
        if counter = 0 then
            INSERT INTO public.utm_compliance_standard_section
            VALUES (101, 100, 'Windows Systems',
                    'Reports in this section list user activity on devices using the Windows Operating system. The report covers activity on Windows workstations as well as servers.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (102, 100, 'Office 365', 'This section showcases account activity on Office 365.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (103, 100, 'Cloud',
                    'Reports in this section list user activity on the most popular Cloud providers, such as Azure and AWS.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (201, 200, 'Firewalls and Switches',
                    'Reports in this section list user activity on firewalls and switches. This information is usually collected via syslog or API.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (202, 200, 'Network',
                    'This section contains Network Activity metrics gathered from package analysis devices and Netflow metrics.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (203, 200, 'Windows', 'This section contains reports about Activity from devices with Windows OS.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (204, 200, 'Linux', 'This section contains reports about Activity from devices with Linux OS.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (301, 300, 'Cloud',
                    'Reports in this section list application activity on Cloud providers such as Azure and AWS');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (302, 300, 'Office 365',
                    'Reports in this section list activity on Office 365 applications, including Outlook, SharePoint and Active Directory.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (401, 400, 'Windows',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the SIEM and devices with the Windows Operating system.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (402, 400, 'Linux',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the SIEM and devices with the Linux Operating system.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (403, 400, 'Cloud',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the SIEM and Cloud providers.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (404, 400, 'Office 365',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the SIEM and Office 365');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (405, 400, 'UTMStack SIEM',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the UTMStack SIEM.');
            INSERT INTO public.utm_compliance_standard_section
            VALUES (406, 400, 'Network',
                    'This section showcases alerts and incidents created as part of the detection capabilities of the SIEM on the network.');
        end if;

        select count(*) into counter from public.utm_configuration_parameter;
        if counter = 0 then
            INSERT INTO public.utm_configuration_parameter
            VALUES (1, 1, 'utmstack.twilio.authToken', 'Twilio Authentication Token',
                    'Your Twilio Authentication Token. On your project Twilio Dashboard you can find it. You can also go to Settings/General and locate your Authentication Token. If you have multiple tokens, you must use the Primary Token.',
                    NULL, true, 'text', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (2, 1, 'utmstack.twilio.accountSid', 'Twilio Account SID',
                    'Your Twilio Account SID. On your project Twilio Dashboard you can find it. You can also go to Settings/General and locate your Account SID',
                    NULL, true, 'text', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (3, 1, 'utmstack.twilio.number', 'Twilio Virtual Phone Number', 'Your Twilio Virtual Phone Number.',
                    NULL, true, 'tel', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (4, 2, 'utmstack.mail.password', 'Mail Server Password', 'Login password of the SMTP server', NULL,
                    true, 'password', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (5, 2, 'utmstack.mail.from', 'Utmstack email address', 'Address from which emails are sent', NULL,
                    true, 'email', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (6, 2, 'utmstack.mail.baseUrl', 'Utmstack base url', 'Base url of Utmstack', NULL, true, 'text',
                    NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (7, 2, 'utmstack.mail.host', 'Mail Server Host',
                    'SMTP server host. For instance, `smtp.example.com`.', 'example.hostmail.com', true, 'text', NULL,
                    NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (8, 2, 'utmstack.mail.port', 'Mail Server Port', 'SMTP server port', '587', true, 'number', NULL,
                    NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (9, 2, 'utmstack.mail.username', 'Mail Server Username', 'Login user of the SMTP server', NULL, true,
                    'text', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (17, 3, 'utmstack.tfa.enable', 'Enable Two Factor Authentication', NULL, 'false', true, 'bool', NULL,
                    NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (19, 4, 'utmstack.alert.addressToNotifyAlerts', 'Emails to notify alerts',
                    'Configure all email addresses to notify when an alert comes in', NULL, true, 'list', NULL, NULL,
                    NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (18, 4, 'utmstack.alert.addressToNotifyIncidents', 'Emails to notify incidents',
                    'Configure all email addresses to notify when an alert is marked as incident', NULL, true, 'list',
                    NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (20, 5, 'utmstack.time.zone', 'Time Zone', 'Application default time zone', 'UTC', true,
                    'timezone_list', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (21, 5, 'utmstack.time.dateformat', 'Date Format', 'Application default date format', 'medium', true,
                    'dateformat_list', NULL, NULL, NULL);
            INSERT INTO public.utm_configuration_parameter
            VALUES (13, 2, 'utmstack.mail.properties.mail.smtp.auth', 'Encryption type',
                    'Select the encryption type used by the SMTP server', 'TLS', true, 'radio', NULL, NULL,
                    'TLS,SSL,NONE');
        end if;

        select count(*) into counter from public.utm_configuration_section;
        if counter = 0 then
            INSERT INTO public.utm_configuration_section
            VALUES (1, 'sms',
                    'UTMStack uses Twilio to notify via sms, in this section you can configure the necessary parameters that this platform needs to work',
                    NULL);
            INSERT INTO public.utm_configuration_section
            VALUES (2, 'email', 'Here you can configure all necessary parameters for email notifications', NULL);
            INSERT INTO public.utm_configuration_section
            VALUES (3, 'Two Factor Authentication',
                    'Two Factor Authentication is a method in which a user is granted access to a website or application only after successfully presenting two or more pieces of evidence (or factors) to an authentication mechanism. Here you can enable this feature.',
                    NULL);
            INSERT INTO public.utm_configuration_section
            VALUES (4, 'alerts',
                    'Here you can configure all the necessary parameters for the correct operation of alerts and incidents',
                    NULL);
            INSERT INTO public.utm_configuration_section
            VALUES (5, 'Date settings',
                    'Default time zone, and date format, this setting allows you to view logs in the desired time format. Logs will continue to be stored in the system in the UTC time zone.',
                    NULL);
        end if;

        select count(*) into counter from public.utm_dashboard;
        if counter = 0 then
            INSERT INTO public.utm_dashboard
            VALUES (13, 'O365 Overview', '', '2023-03-13 20:21:54.927', NULL, 'system', NULL,
                    '[{"id":"f256f724-3a16-1085-62c3-3eef427b3191","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (221, 'O365 SharePoint', '', '2023-03-13 20:21:55.297', NULL, 'system', NULL,
                    '[{"id":"72fb7f9c-566b-91bd-6807-cb33512c11a8","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (11, 'O365 Threat Intelligence', '', '2023-03-13 20:21:55.302', NULL, 'system', NULL,
                    '[{"id":"9f712444-7ad7-154a-f49f-58e2671bbc61","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (223, 'VMware System', '', '2023-03-13 20:21:55.307', NULL, 'system', NULL, NULL, NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (7, 'Threat Activity', '', '2023-03-13 20:21:55.32', NULL, 'system', NULL, NULL, 60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (226, 'Windows Systems', '', '2023-03-13 20:21:55.372', NULL, 'system', NULL, NULL, NULL, NULL,
                    true);
            INSERT INTO public.utm_dashboard
            VALUES (227, 'AWS Cloud', 'AWS Cloud Overview', '2023-03-13 20:21:55.383', NULL, 'system', NULL,
                    '[{"id":"2aad04c7-dbbb-e41c-4f63-9457f49b505d","filterLabel":"Tenant","indexPattern":"log-aws-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"Select Tenant","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (232, 'NetFlow', 'Netflow', '2023-03-13 20:21:55.436', NULL, 'system', NULL, NULL, NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (234, 'O365 Exchange', '', '2023-03-13 20:21:55.445', NULL, 'system', NULL,
                    '[{"id":"031e95f5-2c0f-ea35-bd14-8e6ad12f1aef","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (236, 'Meraki System', '', '2023-03-13 20:28:05.819', NULL, 'system', NULL,
                    '[{"id":"0fc7d0ff-d37f-3857-ad2b-13ccb3d01983","filterLabel":"Device Name","indexPattern":"log-firewall-meraki-*","field":"dataSource.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    30000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (238, 'Bitdefender System', '', '2023-03-20 11:09:52.531', NULL, 'system', NULL, NULL, NULL, NULL,
                    true);
            INSERT INTO public.utm_dashboard
            VALUES (239, 'AWS Activity By User and Event', '', '2023-07-29 19:38:00.252', '2023-08-12 17:15:40.139',
                    'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (240, 'Windows AD Policy Change',
                    'The Windows AD Policy Change report refers to a log of all changes made to policies on a Windows Active Directory (AD).',
                    '2023-08-12 17:14:37.654', '2023-08-02 08:49:32.973', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (241, 'File Operations by User', '', '2023-08-12 17:14:37.67', '2023-08-10 17:01:33.691', 'system',
                    'system',
                    '[{"id":"6c155ed0-5230-34c2-e784-f441cb0eadd1","filterLabel":"User Name","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.SubjectUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (242, 'Threat Activity Alerts', '', '2023-08-12 17:14:37.68', '2023-08-10 16:33:44.412', 'system',
                    'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (244, 'AWS Alerts',
                    'The AWS Alerts report presents a collection of alerts generated by correlating Amazon Web Services (AWS) logs.',
                    '2023-08-12 17:14:37.727', '2023-07-31 08:27:31.793', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (245, 'Linux Alerts Report',
                    'The Linux Alerts report contains alerts generated by correlating logs received from Linux systems to identify security threats.',
                    '2023-08-12 17:14:54.489', '2023-08-10 16:20:06.69', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (246, 'Process Ran with Administrator Privileges', 'Process run with administrator privileges',
                    '2023-08-12 17:14:54.499', '2023-08-10 16:17:35.476', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (247, 'Office 365 Alerts',
                    'Office 365 Alerts report provides information about suspicious or irregular activities logged in your Office 365 environment.',
                    '2023-08-12 17:14:54.507', '2023-08-02 09:26:19.747', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (248, 'Windows Alerts', '', '2023-08-12 17:14:54.514', '2023-08-10 16:26:49.526', 'system', 'system',
                    '[{"id":"9588058f-33de-3fb4-3891-08835a9cf55b","filterLabel":"Server Name","indexPattern":"alert-*","field":"dataSource.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (249, 'Azure Alerts',
                    'The Azure Alerts report provides crucial insight into operations and security concerns within cloud resources, such as anomalous activities, unauthorized access attempts, and other potential vulnerabilities.',
                    '2023-08-12 17:14:54.523', '2023-08-02 09:18:51.053', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (250, 'NetFlow Activity', 'Netflow', '2023-08-12 17:15:08.098', '2023-08-06 19:40:07.108', 'system',
                    'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (251, 'O365 Sharepoint report',
                    'This security report provides details of usage, security actions, and modifications detected in an organization''s Office 365 SharePoint environment.',
                    '2023-08-12 17:15:08.121', '2023-08-02 07:30:44.884', 'system', 'system',
                    '[{"id":"3c5be84a-f3a2-5f1e-7086-216efb572042","filterLabel":"User ID","indexPattern":"log-o365-*","field":"logx.o365.UserId.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (252, 'Threat Intelligence Activity', '', '2023-08-12 17:15:08.129', '2023-08-06 20:11:42.384',
                    'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (253, 'O365 Exchange report',
                    'The O365 Exchange report is a security report generated from Security Information and Event Management (SIEM) logs and correlated events.',
                    '2023-08-12 17:15:08.137', NULL, 'system', NULL,
                    '[{"id":"031e95f5-2c0f-ea35-bd14-8e6ad12f1aef","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100},{"id":"b54ef565-56c1-0fce-1917-73c44835a3ec","filterLabel":"User ID","indexPattern":"log-o365-*","field":"logx.o365.UserId.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (254, 'Linux System Activity', '', '2023-08-12 17:15:23.144', '2023-07-31 20:51:21.395', 'system',
                    'system',
                    '[{"id":"eabf03ed-040d-dd39-b469-eebf28037976","filterLabel":"Host Name","indexPattern":"log-linux-*","field":"logx.linux.host.name.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (255, 'Windows Systems Activity', '', '2023-08-12 17:15:23.154', NULL, 'system', NULL, '[]', NULL,
                    NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (256, 'CISCO Switch Activity', '', '2023-08-12 17:15:23.178', '2023-08-01 11:19:17.783', 'system',
                    'system',
                    '[{"id":"6cea1699-3e61-f60a-1840-9ade8ecf6e50","filterLabel":"Host name","indexPattern":"log-cisco-switch-*","field":"host.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (257, 'CISCO ASA Firewall Activity', '', '2023-08-12 17:15:23.185', '2023-08-01 11:24:16.838',
                    'system', 'system',
                    '[{"id":"5f450920-ac95-7579-7030-ec8f13fd8c10","filterLabel":"Host name","indexPattern":"log-firewall-cisco-asa-*","field":"host.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (258, 'Azure Login Activity', '', '2023-08-12 17:15:23.194', '2023-07-31 20:31:26.577', 'system',
                    'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (259, 'Meraki Firewall Activity', '', '2023-08-12 17:15:40.107', '2023-02-04 22:33:40.441', 'system',
                    'system',
                    '[{"id":"0fc7d0ff-d37f-3857-ad2b-13ccb3d01983","filterLabel":"Device Name","indexPattern":"log-firewall-meraki-*","field":"dataSource.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    30000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (260, 'Azure Subscription Activity', '', '2023-08-12 17:15:40.116', '2023-07-30 15:43:22.635',
                    'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (261, 'Office 365 AD Successful Logon by User', '', '2023-08-12 17:15:40.124',
                    '2023-07-29 19:02:23.767', 'system', 'system',
                    '[{"id":"8c026747-2f91-ab58-7974-3cbfae8ad5d5","filterLabel":"User","indexPattern":"log-o365-*","field":"logx.o365.UserId.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (262, 'Office 365 Unsuccessful Logon Attempts', '', '2023-08-12 17:15:40.131',
                    '2023-07-29 18:26:44.337', 'system', 'system', '[]', NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (263, 'Windows Special Privileges Assigned to New Logon', '', '2023-08-12 17:17:18.562',
                    '2023-07-29 18:49:54.321', 'system', 'system',
                    '[{"id":"c44b47ef-efc7-7ef2-d57d-f80847e571fc","filterLabel":"User","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.TargetUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (264, 'Windows Privilege Escalation', '', '2023-08-12 17:17:18.574', '2023-07-28 22:01:12.833',
                    'system', 'system',
                    '[{"id":"2dd20fe4-0084-bb48-703f-15cce618673b","filterLabel":"User","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.TargetUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (265, 'Windows Account Logon Success', '', '2023-08-12 17:17:18.581', '2023-08-14 20:49:12.81',
                    'system', 'system',
                    '[{"id":"5584eada-f797-8c87-4486-8d09a28538ea","filterLabel":"User Name","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.TargetUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100},{"id":"6c2a101b-5e70-6cab-870d-d1176ec2ec39","filterLabel":"Server","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.beat.hostname.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (266, 'Windows Account Logon Failure',
                    'List of failed logon attempts per user and target hosts. Description of failure reason with count.',
                    '2023-08-12 17:17:18.589', '2023-07-28 20:53:43.653', 'system', 'system',
                    '[{"id":"70528c45-6093-7cd8-4aa0-ca6bf7afc9bb","filterLabel":"User Name","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.TargetUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100},{"id":"33f39ffa-3a6c-99e7-0580-c02f4858c41a","filterLabel":"Server","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.beat.hostname.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (267, 'Windows User Accounts Created', '', '2023-08-12 17:17:44.226', '2023-07-28 23:04:12.29',
                    'system', 'system',
                    '[{"id":"49bc18f6-95b1-d6a5-aaa8-8c6fe261cfb4","filterLabel":"User Creating Account","indexPattern":"log-wineventlog-*","field":"logx.wineventlog.event_data.SubjectUserName.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (268, 'Windows Systems Activity Report', '', '2023-08-14 21:06:38.574', NULL, 'system', NULL, '[]',
                    NULL, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (269, 'Azure WAF', '', '2023-08-14 21:12:52.444', NULL, 'system', NULL, '[]', 30000, NULL, true);
            INSERT INTO public.utm_dashboard
            VALUES (271, 'O365 Active Directory', '', '2023-08-14 21:19:53.671', NULL, 'system', NULL,
                    '[{"id":"a3848e55-ffaa-23ae-e5cf-dd3ef659100e","filterLabel":"Tenant","indexPattern":"log-o365-*","field":"logx.tenant.keyword","multiple":false,"searchable":true,"clearable":true,"loadingText":"Loading","placeholder":"","maxSelectedItems":100}]',
                    60000, NULL, true);
        end if;

        select count(*) into counter from public.utm_dashboard_visualization;
        if counter = 0 then
            INSERT INTO public.utm_dashboard_visualization
            VALUES (675, 66, 13, 2, 461.79998779296875, 259.6000061035156, 0, 15, true, NULL,
                    '{"cols":7,"id":"4b544912-182e-55dc-b171-b13f6df3e691","rows":4,"x":15,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (676, 59, 13, 0, 529.2000122070312, 259.6000061035156, 0, 0, true, NULL,
                    '{"cols":8,"id":"608032aa-b6c3-8dcb-7ca0-05e1c46e228f","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (677, 49, 13, 3, 529.2000122070312, 259.6000061035156, 0, 22, true, NULL,
                    '{"cols":8,"id":"cb5129fa-81d9-70a2-d380-0a944e02cf46","rows":4,"x":22,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (678, 58, 13, 1, 461.79998779296875, 259.6000061035156, 0, 8, true, NULL,
                    '{"cols":7,"id":"10592d1d-e913-6c2b-1a22-db866bfdc723","rows":4,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (679, 468, 13, 6, 664, 327, 4, 20, true, NULL,
                    '{"cols":10,"id":"21d95999-84f1-3477-973e-e8f0b6179a55","rows":5,"x":20,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (680, 60, 13, 4, 596.5999755859375, 327, 4, 0, true, NULL,
                    '{"cols":9,"id":"b4279a31-608a-7463-eb15-d52818adb689","rows":5,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (681, 470, 13, 7, 596.5999755859375, 596.5999755859375, 9, 0, true, NULL,
                    '{"cols":9,"id":"c06413ff-52f8-59dc-2937-8655b12c6053","rows":9,"x":0,"y":9}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (682, 55, 13, 5, 731.4000244140625, 327, 4, 9, true, NULL,
                    '{"cols":11,"id":"0412622a-25f7-916a-4d3a-103505a762b4","rows":5,"x":9,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (683, 472, 13, 8, 731.4000244140625, 596.5999755859375, 9, 9, true, NULL,
                    '{"cols":11,"id":"e145f90c-9b55-deaf-fc72-1ce8a92541fe","rows":9,"x":9,"y":9}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (684, 473, 13, 9, 664, 596.5999755859375, 9, 20, true, NULL,
                    '{"cols":10,"id":"5ee50469-51cb-aef2-ae68-c41e5fee51ef","rows":9,"x":20,"y":9}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (685, 49, 221, 0, 548, 436.3999938964844, 0, 0, true, NULL,
                    '{"cols":10,"id":"b51c09d4-a8b6-fcf0-f332-e7c0878f7be3","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (686, 474, 221, 2, 1664, 436.3999938964844, 8, 0, true, NULL,
                    '{"cols":30,"id":"54680b51-8ecc-e1d5-c69b-5183dbc90483","rows":8,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (687, 475, 221, 1, 1106, 436.3999938964844, 0, 10, true, NULL,
                    '{"cols":20,"id":"a55bcef8-acd5-e5f1-0920-7ea1b143af8e","rows":8,"x":10,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (688, 468, 11, 3, 550.6666870117188, 494.6000061035156, 4, 20, true, NULL,
                    '{"cols":10,"id":"289d900c-f898-07c0-7b27-911b52524321","rows":9,"x":20,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (689, 476, 11, 1, 550.6666870117188, 494.6000061035156, 4, 0, true, NULL,
                    '{"cols":10,"id":"000bb2bc-2f1a-d558-757e-f8476cd8d1af","rows":9,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (690, 52, 11, 0, 1672, 214.26666259765625, 0, 0, true, NULL,
                    '{"cols":30,"id":"070f21ea-e793-3922-c285-b1a1941e0251","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (691, 65, 11, 2, 550.6666870117188, 494.6000061035156, 4, 10, true, NULL,
                    '{"cols":10,"id":"441cf83a-9589-5881-48fd-8a55d1bc93c3","rows":9,"x":10,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (692, 479, 223, 0, 596.5999755859375, 461.79998779296875, 0, 0, true, NULL,
                    '{"cols":9,"id":"7e3a3a2a-8218-2fa2-3295-32d082267313","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (693, 480, 223, 2, 664, 529.2000122070312, 7, 0, true, NULL,
                    '{"cols":10,"id":"a498c392-a08c-0938-3e9c-3abea36c3aca","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (694, 481, 223, 1, 1405.4000244140625, 461.79998779296875, 0, 9, true, NULL,
                    '{"cols":21,"id":"3a3cbc7b-7214-e533-c924-fc01c5606786","rows":7,"x":9,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (695, 482, 223, 5, 2012, 866.2000122070312, 15, 0, true, NULL,
                    '{"cols":30,"id":"f316914b-790a-8906-93fa-8e21d9bae367","rows":13,"x":0,"y":15}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (696, 483, 223, 3, 664, 529.2000122070312, 7, 10, true, NULL,
                    '{"cols":10,"id":"c9660d1c-196a-11b3-4637-d92e5bf7d4b3","rows":8,"x":10,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (697, 484, 223, 4, 664, 529.2000122070312, 7, 20, true, NULL,
                    '{"cols":10,"id":"0e3c5794-fd8a-9983-9b8d-50d11b0a1e6f","rows":8,"x":20,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (698, 485, 7, 2, 448.73333740234375, 252.13333129882812, 0, 16, true, NULL,
                    '{"cols":7,"id":"f9ee280e-b8f7-9efd-e25a-c975e8c6e7e9","rows":4,"x":16,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (699, 486, 7, 0, 514.2666625976562, 252.13333129882812, 0, 0, true, NULL,
                    '{"cols":8,"id":"d5afe85c-ded4-4452-70e2-fb40a6f601bd","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (700, 487, 7, 1, 514.2666625976562, 252.13333129882812, 0, 8, true, NULL,
                    '{"cols":8,"id":"a39f5a92-1da0-9df0-2587-4113a035771c","rows":4,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (701, 488, 7, 4, 579.7999877929688, 448.73333740234375, 4, 0, true, NULL,
                    '{"cols":9,"id":"3a2c7344-de10-7cd2-0a60-35c41512cb9f","rows":7,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (702, 489, 7, 5, 1366.199951171875, 448.73333740234375, 4, 9, true, NULL,
                    '{"cols":21,"id":"2a5afdb8-0f4c-7c1d-0683-e5f2b15cc1fd","rows":7,"x":9,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (703, 490, 7, 7, 710.8666381835938, 645.3333129882812, 11, 10, true, NULL,
                    '{"cols":11,"id":"cd88922d-0817-6aec-723e-ee6cc9462b63","rows":10,"x":10,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (704, 491, 7, 6, 645.3333129882812, 645.3333129882812, 11, 0, true, NULL,
                    '{"cols":10,"id":"8355560c-c1d6-7854-ac91-4e45bb611be7","rows":10,"x":0,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (705, 492, 7, 8, 579.7999877929688, 645.3333129882812, 11, 21, true, NULL,
                    '{"cols":9,"id":"0f4c3293-10f1-31fc-47db-025abcdd5e86","rows":10,"x":21,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (706, 493, 7, 3, 448.73333740234375, 252.13333129882812, 0, 23, true, NULL,
                    '{"cols":7,"id":"77ae5349-8ca8-282f-ea6d-98170f7ea458","rows":4,"x":23,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (712, 497, 226, 1, 461.79998779296875, 259.6000061035156, 0, 8, true, NULL,
                    '{"cols":7,"id":"587b6f97-7339-93d9-c263-dce292440851","rows":4,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (713, 498, 226, 2, 461.79998779296875, 259.6000061035156, 0, 15, true, NULL,
                    '{"cols":7,"id":"0ffc7b00-b72b-ba05-f6f8-cd626d9dc82e","rows":4,"x":15,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (714, 499, 226, 0, 529.2000122070312, 259.6000061035156, 0, 0, true, NULL,
                    '{"cols":8,"id":"04bd9589-54ab-6336-e246-9da934f22ab2","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (715, 500, 226, 3, 529.2000122070312, 259.6000061035156, 0, 22, true, NULL,
                    '{"cols":8,"id":"835459a2-5956-a056-4d0a-b6ae98a7cbe0","rows":4,"x":22,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (716, 501, 226, 5, 933.5999755859375, 529.2000122070312, 4, 8, true, NULL,
                    '{"cols":14,"id":"822ab5b4-776e-85d0-ed15-e9e479c11627","rows":8,"x":8,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (717, 502, 226, 4, 529.2000122070312, 529.2000122070312, 4, 0, true, NULL,
                    '{"cols":8,"id":"2178066a-0ad8-cd3b-011e-47d0b41fd7aa","rows":8,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (718, 503, 226, 7, 2012, 529.2000122070312, 12, 0, true, NULL,
                    '{"cols":30,"id":"7e2019b9-ca91-01d1-b0fd-118d4d1ef986","rows":8,"x":0,"y":12}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (719, 504, 226, 6, 529.2000122070312, 529.2000122070312, 4, 22, true, NULL,
                    '{"cols":8,"id":"edaabf78-4173-f379-5c8d-9fc0612df8e3","rows":8,"x":22,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (720, 505, 227, 2, 710.8666381835938, 448.73333740234375, 6, 0, true, NULL,
                    '{"cols":11,"id":"2501531c-dbea-8f24-8786-de2bdeeacbc0","rows":7,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (721, 506, 227, 4, 1956, 448.73333740234375, 13, 0, true, NULL,
                    '{"cols":30,"id":"ee79fab8-51c5-240f-e8e9-5cdd2c8265de","rows":7,"x":0,"y":13}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (722, 127, 227, 1, 776.4000244140625, 383.20001220703125, 0, 18, true, NULL,
                    '{"cols":12,"id":"bbb6a219-8cba-34d9-3ab5-0ff637edddf7","rows":6,"x":18,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (723, 508, 227, 0, 1169.5999755859375, 383.20001220703125, 0, 0, true, NULL,
                    '{"cols":18,"id":"7ab3acb6-7c8f-dae8-36a8-9bf42741c4c9","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (724, 509, 227, 3, 1235.13330078125, 448.73333740234375, 6, 11, true, NULL,
                    '{"cols":19,"id":"9b864081-6b08-15c7-6d85-06fa02b7bd50","rows":7,"x":11,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (725, 515, 227, 0, 2020, 869.6666870117188, 0, 0, true, NULL,
                    '{"cols":30,"id":"3cb3aa29-eceb-ce39-e213-fc45204409d5","rows":13,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (738, 524, 232, 2, 977, 450.6000061035156, 7, 15, true, NULL,
                    '{"cols":15,"id":"876b34f3-881c-bc90-7edf-99d1b74f933f","rows":7,"x":15,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (739, 525, 232, 0, 1964, 450.6000061035156, 0, 0, true, NULL,
                    '{"cols":30,"id":"68b3eaad-3c8f-953b-e554-45dfddd72b4a","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (740, 526, 232, 1, 977, 450.6000061035156, 7, 0, true, NULL,
                    '{"cols":15,"id":"f5d1efa9-31d0-03a3-b75b-caf537c46561","rows":7,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (744, 66, 234, 3, 1001, 596.5999755859375, 7, 0, true, NULL,
                    '{"cols":15,"id":"655f9306-e330-16eb-bba2-d3c14fd9f94c","rows":9,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (745, 473, 234, 4, 1001, 596.5999755859375, 7, 15, true, NULL,
                    '{"cols":15,"id":"4019a7b2-f334-1fc7-e444-9b30acc17677","rows":9,"x":15,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (746, 530, 234, 0, 529.2000122070312, 461.79998779296875, 0, 0, true, NULL,
                    '{"cols":8,"id":"40fef4a8-e90b-eeb8-f892-4aabf1d4c571","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (747, 531, 234, 1, 529.2000122070312, 461.79998779296875, 0, 8, true, NULL,
                    '{"cols":8,"id":"71edde78-3002-1daf-7430-d0f7b73f62fb","rows":7,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (748, 532, 234, 2, 933.5999755859375, 461.79998779296875, 0, 16, true, NULL,
                    '{"cols":14,"id":"cfecac15-2bf0-c1c3-2933-bf87418f1854","rows":7,"x":16,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (754, 522, 236, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"2a92d53d-57a9-a897-4c15-29d1280bdb07","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (755, 523, 236, 1, 1956, 514.2666625976562, 7, 0, true, NULL,
                    '{"cols":30,"id":"2674afaf-74d1-c167-4f05-8a9aa32f876a","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (757, 537, 238, 0, 645.3333129882812, 514.2666625976562, 0, 0, true, NULL,
                    '{"cols":10,"id":"f00bbe6a-cf21-c111-47df-b9057e8b2bf6","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (758, 538, 238, 2, 645.3333129882812, 514.2666625976562, 0, 20, true, NULL,
                    '{"cols":10,"id":"62b9c9e2-dc27-fe6f-3843-606b40600482","rows":8,"x":20,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (759, 539, 238, 3, 1956, 514.2666625976562, 8, 0, true, NULL,
                    '{"cols":30,"id":"1a83c1e1-02b6-6d4b-83b3-28545d9eb239","rows":8,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (760, 540, 238, 1, 645.3333129882812, 514.2666625976562, 0, 10, true, NULL,
                    '{"cols":10,"id":"6c8c30d2-506c-b446-43dc-da8a68183275","rows":8,"x":10,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (761, 127, 239, 0, 973, 514.2666625976562, 0, 0, true, NULL,
                    '{"cols":15,"id":"05f92235-d615-0252-e6c6-6341d8b33f69","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (762, 541, 239, 2, 1956, 514.2666625976562, 8, 0, true, NULL,
                    '{"cols":30,"id":"785dde97-6c1b-72eb-394c-a0c6f5264394","rows":8,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (763, 542, 239, 1, 973, 514.2666625976562, 0, 15, true, NULL,
                    '{"cols":15,"id":"026f8fd9-53e0-22ae-d973-b69e82489e07","rows":8,"x":15,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (764, 543, 240, 0, 1404, 367.0666809082031, 0, 0, true, NULL,
                    '{"cols":30,"id":"26df1fd0-6580-c215-ba6d-4a399d877f28","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (765, 544, 240, 1, 1404, 602.7333374023438, 8, 0, true, NULL,
                    '{"cols":30,"id":"0289d80b-a79a-869e-0af3-aaa7c763c4f7","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (766, 545, 241, 1, 2012, 529.2000122070312, 7, 0, true, NULL,
                    '{"cols":30,"id":"d887dd4a-aa78-edd4-4381-8ff8c16c97c9","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (767, 546, 241, 0, 2012, 461.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"f722a630-b945-e048-f2a7-d699306d9149","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (768, 489, 242, 6, 1405.4000244140625, 461.79998779296875, 4, 9, true, NULL,
                    '{"cols":21,"id":"2a5afdb8-0f4c-7c1d-0683-e5f2b15cc1fd","rows":7,"x":9,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (769, 493, 242, 3, 394.3999938964844, 259.6000061035156, 0, 18, true, NULL,
                    '{"cols":6,"id":"77ae5349-8ca8-282f-ea6d-98170f7ea458","rows":4,"x":18,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (770, 488, 242, 5, 596.5999755859375, 461.79998779296875, 4, 0, true, NULL,
                    '{"cols":9,"id":"3a2c7344-de10-7cd2-0a60-35c41512cb9f","rows":7,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (771, 547, 242, 4, 394.3999938964844, 259.6000061035156, 0, 24, true, NULL,
                    '{"cols":6,"id":"0eae040e-2044-93d2-cb95-dc5f4f587351","rows":4,"x":24,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (772, 487, 242, 1, 394.3999938964844, 259.6000061035156, 0, 6, true, NULL,
                    '{"cols":6,"id":"a39f5a92-1da0-9df0-2587-4113a035771c","rows":4,"x":6,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (773, 490, 242, 8, 731.4000244140625, 664, 11, 10, true, NULL,
                    '{"cols":11,"id":"cd88922d-0817-6aec-723e-ee6cc9462b63","rows":10,"x":10,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (774, 486, 242, 0, 394.3999938964844, 259.6000061035156, 0, 0, true, NULL,
                    '{"cols":6,"id":"d5afe85c-ded4-4452-70e2-fb40a6f601bd","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (775, 492, 242, 9, 596.5999755859375, 664, 11, 21, true, NULL,
                    '{"cols":9,"id":"0f4c3293-10f1-31fc-47db-025abcdd5e86","rows":10,"x":21,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (776, 485, 242, 2, 394.3999938964844, 259.6000061035156, 0, 12, true, NULL,
                    '{"cols":6,"id":"f9ee280e-b8f7-9efd-e25a-c975e8c6e7e9","rows":4,"x":12,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (777, 491, 242, 7, 664, 664, 11, 0, true, NULL,
                    '{"cols":10,"id":"8355560c-c1d6-7854-ac91-4e45bb611be7","rows":10,"x":0,"y":11}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (781, 548, 244, 0, 1573, 675.9666748046875, 0, 0, true, NULL,
                    '{"cols":30,"id":"e9b26d35-c80b-3f2d-0ec0-a70391c07628","rows":13,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (782, 549, 245, 0, 2012, 529.2000122070312, 0, 0, true, NULL,
                    '{"cols":30,"id":"77e493ad-171c-9a18-a03b-b97cb2470703","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (783, 550, 245, 1, 2012, 866.2000122070312, 8, 0, true, NULL,
                    '{"cols":30,"id":"d715c869-5670-2ed1-7a6a-fe01123fcb52","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (784, 551, 246, 0, 2012, 529.2000122070312, 0, 0, true, NULL,
                    '{"cols":30,"id":"9c4faf88-053e-962a-e1e3-e0f7eb93172e","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (785, 552, 246, 1, 2012, 866.2000122070312, 8, 0, true, NULL,
                    '{"cols":30,"id":"2644596c-04ba-0759-f02d-f0fcea0c1b25","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (786, 553, 247, 1, 1404, 602.7333374023438, 8, 0, true, NULL,
                    '{"cols":30,"id":"b6cc67f7-8fac-07c7-6703-8a909d0f1db2","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (787, 554, 247, 0, 1404, 367.0666809082031, 0, 0, true, NULL,
                    '{"cols":30,"id":"258654d5-bc69-2359-b4d7-9b345793e0eb","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (788, 555, 248, 0, 2012, 461.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"c44502ec-b7ef-8442-24bc-60e2dd463da3","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (789, 503, 248, 1, 2012, 529.2000122070312, 7, 0, true, NULL,
                    '{"cols":30,"id":"73485e7d-58db-39ae-e9fe-14b0701a64c3","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (790, 556, 249, 1, 1404, 602.7333374023438, 8, 0, true, NULL,
                    '{"cols":30,"id":"6bf07340-4d44-6920-64d9-969be659f5ea","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (791, 557, 249, 0, 1404, 367.0666809082031, 0, 0, true, NULL,
                    '{"cols":30,"id":"e17086a0-7b12-f41a-6861-b152c6401f48","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (792, 525, 250, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"68b3eaad-3c8f-953b-e554-45dfddd72b4a","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (793, 526, 250, 1, 973, 448.73333740234375, 7, 0, true, NULL,
                    '{"cols":15,"id":"f5d1efa9-31d0-03a3-b75b-caf537c46561","rows":7,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (794, 524, 250, 2, 973, 448.73333740234375, 7, 15, true, NULL,
                    '{"cols":15,"id":"876b34f3-881c-bc90-7edf-99d1b74f933f","rows":7,"x":15,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (795, 558, 251, 0, 1404, 367.0666809082031, 0, 0, true, NULL,
                    '{"cols":30,"id":"d564ae03-498e-2b8d-005a-02193fc60077","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (796, 559, 251, 1, 1404, 602.7333374023438, 8, 0, true, NULL,
                    '{"cols":30,"id":"bd360210-f655-d697-0588-128a31e73a24","rows":13,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (797, 560, 252, 0, 1956, 514.2666625976562, 0, 0, true, NULL,
                    '{"cols":30,"id":"5d187bd0-6157-fb9b-3e2e-30e14f10cdd5","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (798, 561, 252, 1, 1956, 579.7999877929688, 8, 0, true, NULL,
                    '{"cols":30,"id":"112d41cd-e9db-15a9-ae0d-6272b938143c","rows":9,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (799, 66, 253, 0, 1404, 308.1499938964844, 0, 0, true, NULL,
                    '{"cols":40,"id":"655f9306-e330-16eb-bba2-d3c14fd9f94c","rows":9,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (800, 562, 253, 1, 1404, 555.5999755859375, 9, 0, true, NULL,
                    '{"cols":40,"id":"857df28d-f7a4-52f8-ba47-2856533ee822","rows":16,"x":0,"y":9}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (801, 563, 254, 0, 2012, 394.3999938964844, 0, 0, true, NULL,
                    '{"cols":30,"id":"254b4bae-57f4-452d-f6cb-b9d62d1754d4","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (802, 564, 254, 1, 2012, 596.5999755859375, 6, 0, true, NULL,
                    '{"cols":30,"id":"3c20d836-746e-8947-efc0-2a218b286e64","rows":9,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (803, 498, 255, 2, 448.73333740234375, 252.13333129882812, 0, 15, true, NULL,
                    '{"cols":7,"id":"0ffc7b00-b72b-ba05-f6f8-cd626d9dc82e","rows":4,"x":15,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (804, 497, 255, 1, 448.73333740234375, 252.13333129882812, 0, 8, true, NULL,
                    '{"cols":7,"id":"587b6f97-7339-93d9-c263-dce292440851","rows":4,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (805, 499, 255, 0, 514.2666625976562, 252.13333129882812, 0, 0, true, NULL,
                    '{"cols":8,"id":"04bd9589-54ab-6336-e246-9da934f22ab2","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (806, 502, 255, 4, 514.2666625976562, 514.2666625976562, 4, 0, true, NULL,
                    '{"cols":8,"id":"2178066a-0ad8-cd3b-011e-47d0b41fd7aa","rows":8,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (807, 501, 255, 5, 907.4666748046875, 514.2666625976562, 4, 8, true, NULL,
                    '{"cols":14,"id":"822ab5b4-776e-85d0-ed15-e9e479c11627","rows":8,"x":8,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (808, 500, 255, 3, 514.2666625976562, 252.13333129882812, 0, 22, true, NULL,
                    '{"cols":8,"id":"835459a2-5956-a056-4d0a-b6ae98a7cbe0","rows":4,"x":22,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (809, 503, 255, 7, 1956, 514.2666625976562, 12, 0, true, NULL,
                    '{"cols":30,"id":"7e2019b9-ca91-01d1-b0fd-118d4d1ef986","rows":8,"x":0,"y":12}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (810, 504, 255, 6, 514.2666625976562, 514.2666625976562, 4, 22, true, NULL,
                    '{"cols":8,"id":"edaabf78-4173-f379-5c8d-9fc0612df8e3","rows":8,"x":22,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (811, 565, 256, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"c44a6124-2c4a-3d96-c109-fc770a635eca","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (812, 566, 256, 1, 1956, 579.7999877929688, 7, 0, true, NULL,
                    '{"cols":30,"id":"eff85c35-2b02-b19e-e195-16b52a77f026","rows":9,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (813, 567, 257, 0, 1964, 384.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"7d1d9faa-6649-4d9b-7ec5-3c1f6f909411","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (814, 568, 257, 1, 1964, 516.4000244140625, 6, 0, true, NULL,
                    '{"cols":30,"id":"916c698f-70e0-1bfb-7168-1cd2760eba1b","rows":8,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (815, 569, 258, 0, 2020, 869.6666870117188, 0, 0, true, NULL,
                    '{"cols":30,"id":"0f045ac9-3c1b-ce37-069e-7b8bfa72b7e4","rows":13,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (816, 522, 259, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"2a92d53d-57a9-a897-4c15-29d1280bdb07","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (817, 523, 259, 1, 1956, 514.2666625976562, 7, 0, true, NULL,
                    '{"cols":30,"id":"2674afaf-74d1-c167-4f05-8a9aa32f876a","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (818, 570, 260, 1, 2012, 529.2000122070312, 7, 0, true, NULL,
                    '{"cols":30,"id":"72a11c41-bdbd-bc65-a5fa-8035e8dade30","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (819, 571, 260, 0, 2012, 461.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"c7a9e289-06e9-7b21-2e2d-1e29eb92d0ec","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (820, 572, 261, 1, 1956, 514.2666625976562, 7, 0, true, NULL,
                    '{"cols":30,"id":"5da6f533-9227-bc1e-2724-c4d1113d78f8","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (821, 55, 261, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"78559e4a-c503-308f-607d-21a39a718e61","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (822, 534, 262, 1, 1956, 514.2666625976562, 6, 0, true, NULL,
                    '{"cols":30,"id":"e1cc75d0-564e-0da8-37c6-e65417cd943a","rows":8,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (823, 573, 262, 0, 1956, 383.20001220703125, 0, 0, true, NULL,
                    '{"cols":30,"id":"9adbebda-9b64-c76b-4991-ce4953fb0788","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (824, 574, 263, 1, 1964, 450.6000061035156, 6, 0, true, NULL,
                    '{"cols":30,"id":"1f7ed7b4-67a6-4636-dfab-a9996037bebe","rows":7,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (825, 575, 263, 0, 1964, 384.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"86b93add-6185-b237-db92-d6a1074a3ceb","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (826, 576, 264, 0, 1964, 384.79998779296875, 0, 0, true, NULL,
                    '{"cols":30,"id":"258d51eb-31f3-de51-2a40-4de2ec317086","rows":6,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (827, 577, 264, 1, 1964, 450.6000061035156, 6, 0, true, NULL,
                    '{"cols":30,"id":"9892099a-2d34-84a5-b2ac-396c105e7bc0","rows":7,"x":0,"y":6}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (828, 578, 265, 1, 2012, 529.2000122070312, 5, 0, true, NULL,
                    '{"cols":30,"id":"94c1aa28-2036-d854-16fc-7f53aeb17401","rows":8,"x":0,"y":5}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (829, 579, 265, 0, 2012, 327, 0, 0, true, NULL,
                    '{"cols":30,"id":"5c64ed4c-52e5-f1ab-bd61-c9353e6f6834","rows":5,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (830, 580, 266, 0, 1964, 319, 0, 0, true, NULL,
                    '{"cols":30,"id":"76f9e90f-d737-cfb2-9a0f-f1e8f247334d","rows":5,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (831, 581, 266, 1, 1964, 516.4000244140625, 5, 0, true, NULL,
                    '{"cols":30,"id":"af54f6bb-e821-626d-28e8-cd7679db7362","rows":8,"x":0,"y":5}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (832, 582, 267, 1, 1956, 514.2666625976562, 7, 0, true, NULL,
                    '{"cols":30,"id":"9b4bb2ef-4fa6-c5b9-c775-adcd41081b6f","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (833, 583, 267, 0, 1956, 448.73333740234375, 0, 0, true, NULL,
                    '{"cols":30,"id":"4e083c32-977f-53cc-8cca-cf8335fdd90f","rows":7,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (834, 498, 268, 2, 448.73333740234375, 252.13333129882812, 0, 15, true, NULL,
                    '{"cols":7,"id":"0ffc7b00-b72b-ba05-f6f8-cd626d9dc82e","rows":4,"x":15,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (835, 497, 268, 1, 448.73333740234375, 252.13333129882812, 0, 8, true, NULL,
                    '{"cols":7,"id":"587b6f97-7339-93d9-c263-dce292440851","rows":4,"x":8,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (836, 499, 268, 0, 514.2666625976562, 252.13333129882812, 0, 0, true, NULL,
                    '{"cols":8,"id":"04bd9589-54ab-6336-e246-9da934f22ab2","rows":4,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (837, 502, 268, 4, 514.2666625976562, 514.2666625976562, 4, 0, true, NULL,
                    '{"cols":8,"id":"2178066a-0ad8-cd3b-011e-47d0b41fd7aa","rows":8,"x":0,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (838, 501, 268, 5, 907.4666748046875, 514.2666625976562, 4, 8, true, NULL,
                    '{"cols":14,"id":"822ab5b4-776e-85d0-ed15-e9e479c11627","rows":8,"x":8,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (839, 500, 268, 3, 514.2666625976562, 252.13333129882812, 0, 22, true, NULL,
                    '{"cols":8,"id":"835459a2-5956-a056-4d0a-b6ae98a7cbe0","rows":4,"x":22,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (840, 503, 268, 7, 1956, 514.2666625976562, 12, 0, true, NULL,
                    '{"cols":30,"id":"7e2019b9-ca91-01d1-b0fd-118d4d1ef986","rows":8,"x":0,"y":12}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (841, 504, 268, 6, 514.2666625976562, 514.2666625976562, 4, 22, true, NULL,
                    '{"cols":8,"id":"edaabf78-4173-f379-5c8d-9fc0612df8e3","rows":8,"x":22,"y":4}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (842, 510, 269, 0, 1038.5333251953125, 514.2666625976562, 0, 0, true, NULL,
                    '{"cols":16,"id":"3d38beba-60d2-36f4-e9c0-fb834dd20b37","rows":8,"x":0,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (843, 514, 269, 1, 907.4666748046875, 514.2666625976562, 0, 16, true, NULL,
                    '{"cols":14,"id":"e287720d-baf8-24dd-ad25-cc9352de12a3","rows":8,"x":16,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (844, 511, 269, 3, 645.3333129882812, 514.2666625976562, 8, 10, true, NULL,
                    '{"cols":10,"id":"7003ae5b-b7b6-fb58-2523-d16e017c7105","rows":8,"x":10,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (845, 513, 269, 2, 645.3333129882812, 514.2666625976562, 8, 0, true, NULL,
                    '{"cols":10,"id":"449ca04e-3def-57e8-9cca-ae99df62b552","rows":8,"x":0,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (846, 512, 269, 4, 645.3333129882812, 514.2666625976562, 8, 20, true, NULL,
                    '{"cols":10,"id":"d1ffe2ed-859a-5f43-f7f4-0c6f046d422e","rows":8,"x":20,"y":8}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (847, 533, 271, 4, 548, 436.3999938964844, 7, 20, true, NULL,
                    '{"cols":10,"id":"0aaf1142-430e-2c22-c500-e5b02137dc0e","rows":8,"x":20,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (848, 534, 271, 2, 548, 436.3999938964844, 7, 0, true, NULL,
                    '{"cols":10,"id":"477b4e0f-b01a-5d19-ca9f-449f9c60d16f","rows":8,"x":0,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (849, 535, 271, 3, 548, 436.3999938964844, 7, 10, true, NULL,
                    '{"cols":10,"id":"7240983e-a4a5-4e1c-9fc5-baf37a2482f4","rows":8,"x":10,"y":7}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (850, 536, 271, 1, 882.7999877929688, 380.6000061035156, 0, 14, true, NULL,
                    '{"cols":16,"id":"736f1fc4-267f-f393-1547-34109846b1b2","rows":7,"x":14,"y":0}');
            INSERT INTO public.utm_dashboard_visualization
            VALUES (851, 55, 271, 0, 771.2000122070312, 380.6000061035156, 0, 0, true, NULL,
                    '{"cols":14,"id":"904a65aa-0214-0f1f-61b3-3482a8cd2a18","rows":7,"x":0,"y":0}');
        end if;

        select count(*) into counter from public.utm_data_source_config;
        if counter = 0 then
            INSERT INTO public.utm_data_source_config
            VALUES ('a1a48f4f-526b-40eb-b067-667e3bda9ef6', 'antivirus-esmc-eset', 'ESET Antivirus', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('92923a6f-72ad-4ef9-b52b-ef71b0dc4a2f', 'antivirus-kaspersky', 'Kaspersky Antivirus', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('e5a3a130-7811-438b-98d5-abb2a49b2c1e', 'antivirus-sentinel-one', 'SentinelOne Antivirus', true,
                    true);
            INSERT INTO public.utm_data_source_config
            VALUES ('1c344f11-35d0-4c93-8bc4-95ffa82d2d9a', 'antivirus-bitdefender-gz', 'Bitdefender GravityZone', true,
                    true);
            INSERT INTO public.utm_data_source_config
            VALUES ('b61bf723-c07f-4ce2-ab85-bdf60b9eecf4', 'aws', 'Amazon Web Services', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('849fd623-97fe-4dce-93f4-726b4e0767d7', 'azure', 'Azure Event Hubs', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('ddb77944-8131-469e-b0f1-956ff02734d6', 'firewall-cisco-asa', 'CISCO ASA', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('befdae7c-0842-4048-a632-bf11d04bc383', 'firewall-cisco-firepower', 'CISCO Firepower', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('3ef58df3-93b6-4698-8449-b091b0855d1d', 'firewall-meraki', 'CISCO Meraki', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('ae5d7918-0c6c-468f-9c03-ab440e0091e1', 'apache', 'Apache Web Server', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('e60999c3-fc3d-443c-852b-58641075bc62', 'auditd', 'Auditd', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('5020eb9a-c9ba-4929-8d5f-9ec42537f230', 'elasticsearch', 'Elasticsearch', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('afb07ae1-8bde-488e-b10c-aba7fd1abd08', 'kafka', 'Apache Kafka', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('95edf071-93e4-46e7-8e98-462fa8afb984', 'kibana', 'Kibana', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('4f51556d-a933-4b0c-a550-284b7289694f', 'logstash', 'Logstash', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('069b2e46-e252-4df3-adc1-41f4024a5170', 'mongodb', 'MongoDB Database', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('819adbc6-dcb9-4eea-a5c5-4ba979888e20', 'mysql', 'MySQL Database', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('0268b58b-b448-4e49-b666-f302672ef0af', 'nginx', 'NGINX', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('239226eb-dc95-46de-858f-39dd08902c35', 'osquery', 'Osquery', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('5464f7cd-18b5-4089-a6c7-cc42033b4294', 'postgresql', 'PostgreSQL Database', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('062ffd67-c76d-434e-84fe-f47557f3e2a0', 'redis', 'Redis', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('4175c6fb-8754-4b15-93a2-97934425469d', 'linux', 'Linux System', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('48e36ec4-8b7b-4b05-bffb-ebea939465d8', 'firewall-fortigate-traffic', 'Fortinet Firewall', true,
                    true);
            INSERT INTO public.utm_data_source_config
            VALUES ('65804cf3-9b00-479b-a900-1f8bb7928785', 'google', 'Google Cloud', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('f5433b6b-6b5f-4b65-99b2-4907dcbcb1de', 'netflow', 'Netflow', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('917e8fdc-adb9-492e-8631-d1e38d76b212', 'o365', 'Office 365', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('feeab8ea-7889-4ccc-8cef-22e3d1324510', 'firewall-sophos-xg', 'SophosXG Firewall', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('423e6ea7-c0f5-43d3-901a-19c4a723f345', 'vmware-esxi', 'VMware ESXi', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('ac7301a5-0ad7-4211-ab9e-6ddefd9f66da', 'wineventlog', 'Windows Events', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('b6be4a19-d59c-43db-a8a3-75780e894129', 'iis', 'Internet Information Services', true, true);
            INSERT INTO public.utm_data_source_config
            VALUES ('510bd106-b42d-47b1-8726-c3ecae672bf4', 'generic', 'Generic Datasource', true, true);
        end if;

        select count(*) into counter from public.utm_group_logstash_pipeline_filters;
        if counter = 0 then
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(1, 201, 32, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(2, 301, 23, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(3, 302, 24, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(4, 303, 25, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(6, 701, 18, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(7, 702, 16, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(8, 801, 31, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(9, 901, 30, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(10, 1001, 21, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(11, 1201, 20, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(12, 1301, 33, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(13, 1401, 14, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(14, 1402, 13, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(15, 1403, 12, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(16, 1404, 11, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(17, 1405, 10, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(18, 1406, 9, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(19, 1407, 8, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(20, 1408, 7, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(21, 1409, 6, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(22, 1410, 5, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(23, 1411, 4, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(24, 1412, 2, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(26, 1413, 15, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(27, 1501, 28, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(28, 1502, 27, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(29, 1503, 29, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(30, 1505, 39, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(31, 1506, 34, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(32, 1507, 17, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(33, 1508, 35, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(34, 1509, 36, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(35, 1510, 26, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(36, 1511, 37, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(37, 1512, 38, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(38, 1514, 40, 'PIPELINE_FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(39, 1515, 42, 'PIPELINE FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(40, 1516, 41, 'PIPELINE FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(41, 1517, 43, 'PIPELINE FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(42, 1518, 44, 'PIPELINE FILTER');
            INSERT INTO utm_group_logstash_pipeline_filters (id, filter_id, pipeline_id, relation) VALUES(43, 1519, 45, 'PIPELINE FILTER');
        end if;

        select count(*) into counter from public.utm_images;
        if counter = 0 then
            INSERT INTO public.utm_images VALUES ('HEADER', 'Utmstack', 'data:image/png;base64,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', 'data:image/png;base64,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');
            INSERT INTO public.utm_images VALUES ('LOGIN', 'Login', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMTAwMCAxMzIzLjU2Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8xMyk7fS5jbHMtMntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzApO30uY2xzLTN7ZmlsbDp1cmwoI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI4KTt9LmNscy00e2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8yNCk7fS5jbHMtNXtmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzAtMik7fS5jbHMtNntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMjQtMik7fTwvc3R5bGU+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8xMyIgeDE9IjAuMDUiIHkxPSI2MDUuNyIgeDI9IjQ5OS45OSIgeTI9IjYwNS43IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwIiB4MT0iNDk5Ljk5IiB5MT0iNjYxLjc3IiB4Mj0iMTAwMCIgeTI9IjY2MS43NyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iIzNhOGRkZSIvPjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzY1NWRjNiIvPjwvbGluZWFyR3JhZGllbnQ+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8yOCIgeTE9IjI0NC4zNCIgeDI9IjEwMDAiIHkyPSIyNDQuMzQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiM2NTVkYzYiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMzYThkZGUiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0iRGVncmFkYWRvX3Npbl9ub21icmVfMjQiIHgxPSIwLjA1IiB5MT0iMTA1MC40NiIgeDI9IjEwMDAiIHkyPSIxMDUwLjQ2IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwLTIiIHgxPSI0OTkuOTkiIHkxPSI4NjQuODgiIHgyPSIxMDAwIiB5Mj0iODY0Ljg4IiB4bGluazpocmVmPSIjRGVncmFkYWRvX3Npbl9ub21icmVfMzAiLz48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzI0LTIiIHgxPSIwLjA1IiB5MT0iODY0Ljg4IiB4Mj0iMTAwMCIgeTI9Ijg2NC44OCIgeGxpbms6aHJlZj0iI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI0Ii8+PC9kZWZzPjxnIGlkPSJDYXBhXzIiIGRhdGEtbmFtZT0iQ2FwYSAyIj48ZyBpZD0iQ2FwYV8xLTIiIGRhdGEtbmFtZT0iQ2FwYSAxIj48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik01MCw0MDIuMDVjLS40LS4yNC0uOC0uNDgtMS4xMi0uNzJBOTguNTUsOTguNTUsMCwwLDEsLjA1LDMxOC43VjU0Ni4zNWExMDAsMTAwLDAsMCwwLDUwLDg2LjYxbDUwLDI4LjgxTDI5OS45Myw3NzcuMjhIMzAwTDUwMCw4OTIuN1Y2NjEuNzdMMTAwLDQzMC45MloiLz48cGF0aCBjbGFzcz0iY2xzLTIiIGQ9Ik05NTEsODYzLjMybC43NS0uNDZjMzIuMTUtMTkuMzUsNDguMjMtNTIuNTUsNDguMjMtODUuNXYtLjA4YzAtMzMuNzYtMTYuNjQtNjcuMjctNTAtODYuNTVsLTUwLjA4LTI5TDcwMCw1NDYuMzUsNTAwLDQzMC44NFY2NjEuNzdMNzAwLDc3Ny4yOEg3MDBMOTAwLDg5Mi43bDQ1LjYyLTI2LjI3LDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtMyIgZD0iTTQ4Ljg1LDQwMS4zM2MuMzIuMjQuNzIuNDgsMS4xMi43MkwxMDAsNDMwLjkyLDQwMCwyNTcuNzVhMTk5Ljc4LDE5OS43OCwwLDAsMSwyMDAsMGwzMDAsMTczLjE3TDEwMDAsNDg4LjY4VjI1Ny43NUw2MDAsMjYuODJhMTk5Ljc4LDE5OS43OCwwLDAsMC0yMDAsMEw1MC4wNSwyMjguODdDMTUuNjUsMjQ4LjcxLTEuMDcsMjg0LC4wNSwzMTguN0E5OC41NSw5OC41NSwwLDAsMCw0OC44NSw0MDEuMzNaIi8+PHBhdGggY2xhc3M9ImNscy00IiBkPSJNOTUxLjc3LDg2Mi44N2wtLjc1LjQ1Yy0uMzIuMi0uNjYuNDEtMSwuNTlsLTQuMzgsMi41Mkw5MDAsODkyLjcsNjAwLDEwNjZhMjAwLjIyLDIwMC4yMiwwLDAsMS0yMDAsMEwxMDAsODkyLjcuMDUsODM1djIzMC44NWw0MDAsMjMwLjkzYTIwMC4yMiwyMDAuMjIsMCwwLDAsMjAwLDBsMzUwLTIwMi4wNmE5OS45Myw5OS45MywwLDAsMCw1MC04Ni42MlY3NzcuMzZoMEE5OS4wNyw5OS4wNywwLDAsMSw5NTEuNzcsODYyLjg3WiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtNiIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjwvZz48L2c+PC9zdmc+', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMTAwMCAxMzIzLjU2Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8xMyk7fS5jbHMtMntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzApO30uY2xzLTN7ZmlsbDp1cmwoI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI4KTt9LmNscy00e2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8yNCk7fS5jbHMtNXtmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzAtMik7fS5jbHMtNntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMjQtMik7fTwvc3R5bGU+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8xMyIgeDE9IjAuMDUiIHkxPSI2MDUuNyIgeDI9IjQ5OS45OSIgeTI9IjYwNS43IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwIiB4MT0iNDk5Ljk5IiB5MT0iNjYxLjc3IiB4Mj0iMTAwMCIgeTI9IjY2MS43NyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iIzNhOGRkZSIvPjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzY1NWRjNiIvPjwvbGluZWFyR3JhZGllbnQ+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8yOCIgeTE9IjI0NC4zNCIgeDI9IjEwMDAiIHkyPSIyNDQuMzQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiM2NTVkYzYiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMzYThkZGUiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0iRGVncmFkYWRvX3Npbl9ub21icmVfMjQiIHgxPSIwLjA1IiB5MT0iMTA1MC40NiIgeDI9IjEwMDAiIHkyPSIxMDUwLjQ2IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwLTIiIHgxPSI0OTkuOTkiIHkxPSI4NjQuODgiIHgyPSIxMDAwIiB5Mj0iODY0Ljg4IiB4bGluazpocmVmPSIjRGVncmFkYWRvX3Npbl9ub21icmVfMzAiLz48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzI0LTIiIHgxPSIwLjA1IiB5MT0iODY0Ljg4IiB4Mj0iMTAwMCIgeTI9Ijg2NC44OCIgeGxpbms6aHJlZj0iI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI0Ii8+PC9kZWZzPjxnIGlkPSJDYXBhXzIiIGRhdGEtbmFtZT0iQ2FwYSAyIj48ZyBpZD0iQ2FwYV8xLTIiIGRhdGEtbmFtZT0iQ2FwYSAxIj48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik01MCw0MDIuMDVjLS40LS4yNC0uOC0uNDgtMS4xMi0uNzJBOTguNTUsOTguNTUsMCwwLDEsLjA1LDMxOC43VjU0Ni4zNWExMDAsMTAwLDAsMCwwLDUwLDg2LjYxbDUwLDI4LjgxTDI5OS45Myw3NzcuMjhIMzAwTDUwMCw4OTIuN1Y2NjEuNzdMMTAwLDQzMC45MloiLz48cGF0aCBjbGFzcz0iY2xzLTIiIGQ9Ik05NTEsODYzLjMybC43NS0uNDZjMzIuMTUtMTkuMzUsNDguMjMtNTIuNTUsNDguMjMtODUuNXYtLjA4YzAtMzMuNzYtMTYuNjQtNjcuMjctNTAtODYuNTVsLTUwLjA4LTI5TDcwMCw1NDYuMzUsNTAwLDQzMC44NFY2NjEuNzdMNzAwLDc3Ny4yOEg3MDBMOTAwLDg5Mi43bDQ1LjYyLTI2LjI3LDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtMyIgZD0iTTQ4Ljg1LDQwMS4zM2MuMzIuMjQuNzIuNDgsMS4xMi43MkwxMDAsNDMwLjkyLDQwMCwyNTcuNzVhMTk5Ljc4LDE5OS43OCwwLDAsMSwyMDAsMGwzMDAsMTczLjE3TDEwMDAsNDg4LjY4VjI1Ny43NUw2MDAsMjYuODJhMTk5Ljc4LDE5OS43OCwwLDAsMC0yMDAsMEw1MC4wNSwyMjguODdDMTUuNjUsMjQ4LjcxLTEuMDcsMjg0LC4wNSwzMTguN0E5OC41NSw5OC41NSwwLDAsMCw0OC44NSw0MDEuMzNaIi8+PHBhdGggY2xhc3M9ImNscy00IiBkPSJNOTUxLjc3LDg2Mi44N2wtLjc1LjQ1Yy0uMzIuMi0uNjYuNDEtMSwuNTlsLTQuMzgsMi41Mkw5MDAsODkyLjcsNjAwLDEwNjZhMjAwLjIyLDIwMC4yMiwwLDAsMS0yMDAsMEwxMDAsODkyLjcuMDUsODM1djIzMC44NWw0MDAsMjMwLjkzYTIwMC4yMiwyMDAuMjIsMCwwLDAsMjAwLDBsMzUwLTIwMi4wNmE5OS45Myw5OS45MywwLDAsMCw1MC04Ni42MlY3NzcuMzZoMEE5OS4wNyw5OS4wNywwLDAsMSw5NTEuNzcsODYyLjg3WiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtNiIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjwvZz48L2c+PC9zdmc+');
            INSERT INTO public.utm_images VALUES ('REPORT', 'Report logo', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMTAwMCAxMzIzLjU2Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8xMyk7fS5jbHMtMntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzApO30uY2xzLTN7ZmlsbDp1cmwoI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI4KTt9LmNscy00e2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8yNCk7fS5jbHMtNXtmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzAtMik7fS5jbHMtNntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMjQtMik7fTwvc3R5bGU+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8xMyIgeDE9IjAuMDUiIHkxPSI2MDUuNyIgeDI9IjQ5OS45OSIgeTI9IjYwNS43IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwIiB4MT0iNDk5Ljk5IiB5MT0iNjYxLjc3IiB4Mj0iMTAwMCIgeTI9IjY2MS43NyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iIzNhOGRkZSIvPjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzY1NWRjNiIvPjwvbGluZWFyR3JhZGllbnQ+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8yOCIgeTE9IjI0NC4zNCIgeDI9IjEwMDAiIHkyPSIyNDQuMzQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiM2NTVkYzYiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMzYThkZGUiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0iRGVncmFkYWRvX3Npbl9ub21icmVfMjQiIHgxPSIwLjA1IiB5MT0iMTA1MC40NiIgeDI9IjEwMDAiIHkyPSIxMDUwLjQ2IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwLTIiIHgxPSI0OTkuOTkiIHkxPSI4NjQuODgiIHgyPSIxMDAwIiB5Mj0iODY0Ljg4IiB4bGluazpocmVmPSIjRGVncmFkYWRvX3Npbl9ub21icmVfMzAiLz48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzI0LTIiIHgxPSIwLjA1IiB5MT0iODY0Ljg4IiB4Mj0iMTAwMCIgeTI9Ijg2NC44OCIgeGxpbms6aHJlZj0iI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI0Ii8+PC9kZWZzPjxnIGlkPSJDYXBhXzIiIGRhdGEtbmFtZT0iQ2FwYSAyIj48ZyBpZD0iQ2FwYV8xLTIiIGRhdGEtbmFtZT0iQ2FwYSAxIj48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik01MCw0MDIuMDVjLS40LS4yNC0uOC0uNDgtMS4xMi0uNzJBOTguNTUsOTguNTUsMCwwLDEsLjA1LDMxOC43VjU0Ni4zNWExMDAsMTAwLDAsMCwwLDUwLDg2LjYxbDUwLDI4LjgxTDI5OS45Myw3NzcuMjhIMzAwTDUwMCw4OTIuN1Y2NjEuNzdMMTAwLDQzMC45MloiLz48cGF0aCBjbGFzcz0iY2xzLTIiIGQ9Ik05NTEsODYzLjMybC43NS0uNDZjMzIuMTUtMTkuMzUsNDguMjMtNTIuNTUsNDguMjMtODUuNXYtLjA4YzAtMzMuNzYtMTYuNjQtNjcuMjctNTAtODYuNTVsLTUwLjA4LTI5TDcwMCw1NDYuMzUsNTAwLDQzMC44NFY2NjEuNzdMNzAwLDc3Ny4yOEg3MDBMOTAwLDg5Mi43bDQ1LjYyLTI2LjI3LDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtMyIgZD0iTTQ4Ljg1LDQwMS4zM2MuMzIuMjQuNzIuNDgsMS4xMi43MkwxMDAsNDMwLjkyLDQwMCwyNTcuNzVhMTk5Ljc4LDE5OS43OCwwLDAsMSwyMDAsMGwzMDAsMTczLjE3TDEwMDAsNDg4LjY4VjI1Ny43NUw2MDAsMjYuODJhMTk5Ljc4LDE5OS43OCwwLDAsMC0yMDAsMEw1MC4wNSwyMjguODdDMTUuNjUsMjQ4LjcxLTEuMDcsMjg0LC4wNSwzMTguN0E5OC41NSw5OC41NSwwLDAsMCw0OC44NSw0MDEuMzNaIi8+PHBhdGggY2xhc3M9ImNscy00IiBkPSJNOTUxLjc3LDg2Mi44N2wtLjc1LjQ1Yy0uMzIuMi0uNjYuNDEtMSwuNTlsLTQuMzgsMi41Mkw5MDAsODkyLjcsNjAwLDEwNjZhMjAwLjIyLDIwMC4yMiwwLDAsMS0yMDAsMEwxMDAsODkyLjcuMDUsODM1djIzMC44NWw0MDAsMjMwLjkzYTIwMC4yMiwyMDAuMjIsMCwwLDAsMjAwLDBsMzUwLTIwMi4wNmE5OS45Myw5OS45MywwLDAsMCw1MC04Ni42MlY3NzcuMzZoMEE5OS4wNyw5OS4wNywwLDAsMSw5NTEuNzcsODYyLjg3WiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtNiIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjwvZz48L2c+PC9zdmc+', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMTAwMCAxMzIzLjU2Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8xMyk7fS5jbHMtMntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzApO30uY2xzLTN7ZmlsbDp1cmwoI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI4KTt9LmNscy00e2ZpbGw6dXJsKCNEZWdyYWRhZG9fc2luX25vbWJyZV8yNCk7fS5jbHMtNXtmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMzAtMik7fS5jbHMtNntmaWxsOnVybCgjRGVncmFkYWRvX3Npbl9ub21icmVfMjQtMik7fTwvc3R5bGU+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8xMyIgeDE9IjAuMDUiIHkxPSI2MDUuNyIgeDI9IjQ5OS45OSIgeTI9IjYwNS43IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwIiB4MT0iNDk5Ljk5IiB5MT0iNjYxLjc3IiB4Mj0iMTAwMCIgeTI9IjY2MS43NyIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iIzNhOGRkZSIvPjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzY1NWRjNiIvPjwvbGluZWFyR3JhZGllbnQ+PGxpbmVhckdyYWRpZW50IGlkPSJEZWdyYWRhZG9fc2luX25vbWJyZV8yOCIgeTE9IjI0NC4zNCIgeDI9IjEwMDAiIHkyPSIyNDQuMzQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiM2NTVkYzYiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMzYThkZGUiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0iRGVncmFkYWRvX3Npbl9ub21icmVfMjQiIHgxPSIwLjA1IiB5MT0iMTA1MC40NiIgeDI9IjEwMDAiIHkyPSIxMDUwLjQ2IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdG9wLWNvbG9yPSIjM2E4ZGRlIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMWVjYWQzIi8+PC9saW5lYXJHcmFkaWVudD48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzMwLTIiIHgxPSI0OTkuOTkiIHkxPSI4NjQuODgiIHgyPSIxMDAwIiB5Mj0iODY0Ljg4IiB4bGluazpocmVmPSIjRGVncmFkYWRvX3Npbl9ub21icmVfMzAiLz48bGluZWFyR3JhZGllbnQgaWQ9IkRlZ3JhZGFkb19zaW5fbm9tYnJlXzI0LTIiIHgxPSIwLjA1IiB5MT0iODY0Ljg4IiB4Mj0iMTAwMCIgeTI9Ijg2NC44OCIgeGxpbms6aHJlZj0iI0RlZ3JhZGFkb19zaW5fbm9tYnJlXzI0Ii8+PC9kZWZzPjxnIGlkPSJDYXBhXzIiIGRhdGEtbmFtZT0iQ2FwYSAyIj48ZyBpZD0iQ2FwYV8xLTIiIGRhdGEtbmFtZT0iQ2FwYSAxIj48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik01MCw0MDIuMDVjLS40LS4yNC0uOC0uNDgtMS4xMi0uNzJBOTguNTUsOTguNTUsMCwwLDEsLjA1LDMxOC43VjU0Ni4zNWExMDAsMTAwLDAsMCwwLDUwLDg2LjYxbDUwLDI4LjgxTDI5OS45Myw3NzcuMjhIMzAwTDUwMCw4OTIuN1Y2NjEuNzdMMTAwLDQzMC45MloiLz48cGF0aCBjbGFzcz0iY2xzLTIiIGQ9Ik05NTEsODYzLjMybC43NS0uNDZjMzIuMTUtMTkuMzUsNDguMjMtNTIuNTUsNDguMjMtODUuNXYtLjA4YzAtMzMuNzYtMTYuNjQtNjcuMjctNTAtODYuNTVsLTUwLjA4LTI5TDcwMCw1NDYuMzUsNTAwLDQzMC44NFY2NjEuNzdMNzAwLDc3Ny4yOEg3MDBMOTAwLDg5Mi43bDQ1LjYyLTI2LjI3LDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtMyIgZD0iTTQ4Ljg1LDQwMS4zM2MuMzIuMjQuNzIuNDgsMS4xMi43MkwxMDAsNDMwLjkyLDQwMCwyNTcuNzVhMTk5Ljc4LDE5OS43OCwwLDAsMSwyMDAsMGwzMDAsMTczLjE3TDEwMDAsNDg4LjY4VjI1Ny43NUw2MDAsMjYuODJhMTk5Ljc4LDE5OS43OCwwLDAsMC0yMDAsMEw1MC4wNSwyMjguODdDMTUuNjUsMjQ4LjcxLTEuMDcsMjg0LC4wNSwzMTguN0E5OC41NSw5OC41NSwwLDAsMCw0OC44NSw0MDEuMzNaIi8+PHBhdGggY2xhc3M9ImNscy00IiBkPSJNOTUxLjc3LDg2Mi44N2wtLjc1LjQ1Yy0uMzIuMi0uNjYuNDEtMSwuNTlsLTQuMzgsMi41Mkw5MDAsODkyLjcsNjAwLDEwNjZhMjAwLjIyLDIwMC4yMiwwLDAsMS0yMDAsMEwxMDAsODkyLjcuMDUsODM1djIzMC44NWw0MDAsMjMwLjkzYTIwMC4yMiwyMDAuMjIsMCwwLDAsMjAwLDBsMzUwLTIwMi4wNmE5OS45Myw5OS45MywwLDAsMCw1MC04Ni42MlY3NzcuMzZoMEE5OS4wNyw5OS4wNywwLDAsMSw5NTEuNzcsODYyLjg3WiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjxwYXRoIGNsYXNzPSJjbHMtNiIgZD0iTTk1MSw4NjMuMzJjLS4zMi4yLS42Ni40MS0xLC41OWwtNC4zOCwyLjUyLDQuMzgtMi41MkM5NTAuMzYsODYzLjczLDk1MC43LDg2My41Miw5NTEsODYzLjMyWiIvPjwvZz48L2c+PC9zdmc+');
        end if;

        select count(*) into counter from public.utm_incident_action_command;
        if counter = 0 then
            INSERT INTO public.utm_incident_action_command VALUES (9, 1, 'windows', 'cmd.exe /c shutdown -s -t 0 -f');
            INSERT INTO public.utm_incident_action_command VALUES (10, 1, 'linux', 'init 0');
        end if;

        select count(*) into counter from public.utm_incident_actions;
        if counter = 0 then
            INSERT INTO public.utm_incident_actions VALUES (1, 'SHUTDOWN_SERVER', 'Shutdown server', NULL, 1, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (2, 'DISABLE_USER', 'Kick out and disable user', NULL, 2, false, '2020-03-19 23:21:23.444', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (3, 'BLOCK_IP', 'Block ip and disconnect any traffic from IP', NULL, 3, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (4, 'ISOLATE_HOST', 'Isolate host (disconnect from network)', NULL, 4, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (5, 'RESTART_SERVER', 'Restart server', NULL, 5, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (6, 'KILL_PROCESS', 'Kill process', NULL, 6, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (7, 'UNINSTALL_PROGRAM', 'Uninstall program', NULL, 7, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
            INSERT INTO public.utm_incident_actions VALUES (8, 'RUN_CMD', 'Run shell command', NULL, 8, false, '2021-07-09 19:06:50.578', 'system', NULL, NULL);
        end if;

		INSERT INTO utm_index_pattern (id, pattern, pattern_module, pattern_system, is_active) VALUES
			(1, 'log-*', NULL, true, true),
			(2, 'alert-*', NULL, true, true),
			(4, 'log-netflow-*', 'NETFLOW', true, false), 
			(8, 'log-wineventlog-*', 'WINDOWS_AGENT', true, true),
			(10, 'log-aws-*', 'AWS_IAM_USER', true, false), 
			(11, 'log-azure-*', 'AZURE', true, false), 
			(12, 'log-o365-*', 'O365', true, false), 
			(13, 'log-firewall-meraki-*', 'MERAKI', true, false), 
			(14, 'log-firewall-*', 'MERAKI,SOPHOS_XG,CISCO,FORTIGATE,FIRE_POWER,UFW,MIKROTIK,PALO_ALTO,SONIC_WALL', true, false), 
			(15, 'log-firewall-cisco-asa-*', 'CISCO', true, false), 
			(17, 'log-firewall-sophos-xg-*', 'SOPHOS_XG', true, false),
			(18, 'log-iis-*', 'IIS', true, false), 
			(19, 'log-generic-*', NULL, true, true),
			(21, 'log-firewall-fortigate-traffic-*', 'FORTIGATE', true, false),
			(24, 'log-vmware-esxi-*', 'VMWARE', true, false), 
			(25, 'log-google-*', 'GCP', true, false), 
			(26, 'log-firewall-cisco-firepower-*', 'FIRE_POWER', true, false),
			(27, 'log-redis-*', 'REDIS', true, false), 
			(28, 'log-postgresql-*', 'POSTGRESQL', true, false), 
			(29, 'log-osquery-*', 'OSQUERY', true, false), 
			(30, 'log-nginx-*', 'NGINX', true, false), 
			(31, 'log-mysql-*', 'MYSQL', true, false), 
			(32, 'log-mongodb-*', 'MONGODB', true, false),
			(33, 'log-logstash-*', 'LOGSTASH', true, false),
			(34, 'log-kibana-*', 'KIBANA', true, false), 
			(35, 'log-kafka-*', 'KAFKA', true, false), 
			(36, 'log-elasticsearch-*', 'ELASTICSEARCH', true, false),
			(37, 'log-auditd-*', 'AUDITD', true, false),
			(38, 'log-apache*', 'APACHE', true, false),
			(39, 'log-linux-*', 'LINUX_AGENT', true, true),
			(40, 'log-antivirus-*', 'ESET,SENTINEL_ONE,KASPERSKY', true, false),
			(41, 'log-antivirus-esmc-eset-*', 'ESET', true, false), 
			(42, 'log-antivirus-kaspersky-*', 'KASPERSKY', true, false),
			(43, 'log-antivirus-sentinel-one-*', 'SENTINEL_ONE', true, false), 
			(44, 'log-sophos-central-*', 'SOPHOS', true, false), 
			(45, 'log-github-*', 'GITHUB', true, false),
			(46, 'log-firewall-ufw-*', 'UFW', true, false),
			(47, 'log-macos-*', 'MACOS', true, false), 
			(48, 'log-firewall-mikrotik-*', 'MIKROTIK', true, false),
			(49, 'log-firewall-paloalto-*', 'PALO_ALTO', true, false),
			(50, 'log-cisco-switch-*', 'CISCO_SWITCH', true, false),
			(51, 'log-firewall-sonicwall-*', 'SONIC_WALL', true, false),
			(52, 'log-deceptive-bytes-*', 'DECEPTIVE_BYTES', true, false),
			(53, 'log-antivirus-bitdefender-gz-*', 'BITDEFENDER', true, false),
			(56, 'soc-ai', 'SOC_AI', true, false),
			(57, 'log-haproxy-*', 'HAPROXY', true, false), 
			(58, 'log-nats-*', 'NATS', true, false),
			(59, 'log-traefik-*', 'TRAEFIK', true, false), 
			(60, 'log-json-input-*', 'JSON', true, true), 
			(61, 'log-rsyslog-linux-*', 'LINUX_LOGS', true, true) 
		ON CONFLICT (id) DO UPDATE SET pattern=EXCLUDED.pattern, pattern_module=EXCLUDED.pattern_module;


        INSERT INTO utm_logstash_filter (id,logstash_filter,filter_name,filter_group_id,system_owner,module_name,is_active,filter_version) VALUES
			 (101,'filter {
			if ([logx][type] and [logx][type] == "aws") {
				mutate {
					add_field => {
						"dataType" => "aws"
					}
					add_field => {
						"dataSource" => "aws"
					}
				}

			if [logx][aws][message] {

				 grok {
					match => {"[logx][aws][message]" => "%{GREEDYDATA:b} %{IP:src_ip} %{IP:dest_ip} %{BASE10NUM:src_port} %{BASE10NUM:dest_port} %{GREEDYDATA:a} %{GREEDYDATA:c} %{WORD:action} %{GREEDYDATA:message_text}"}
				}

				if [message_text] {
					mutate {
						rename => {
							"message_text" => "[logx][aws][details][message_text]"
						}
					}
				 }
				if [action] {
					mutate {
						rename => {
							"action" => "[logx][aws][details][action]"
						}
					}
				 }
				if [src_port] {
					mutate {
						rename => {
							"src_port" => "[logx][aws][details][src_port]"
						}
					}
				 }
				if [dest_ip] {
					mutate {
						rename => {
							"dest_ip" => "[logx][aws][details][dest_ip]"
						}
					}
				 }
				if [src_ip] {
					mutate {
						rename => {
							"src_ip" => "[logx][aws][details][src_ip]"
						}
					}
				 }
				if [dest_port] {
					mutate {
						rename => {
							"dest_port" => "[logx][aws][details][dest_port]"
						}
					}
				 }

			}


				mutate {
					remove_field => ["headers", "[logx][type]", "@version", "global", "es_metadata_id","a","b","c"]
				}
			}
		}
		','aws',NULL,true,'AWS_IAM_USER',false,'1.0.0'),
			 (201,'filter {
			#Fields where extracted based on https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log
			#https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log-schema
			#Filter version 1.0.2

		if ([type] and [type] == "azure") {
			#Handling messages comming as an array of json
			#Only array of json need to be splitted
			if ([message] and [message] =~/^(\[)/ ) {
				json {
				  source => "message"
				  target => "azroot"
				}
				split {
				  field => "azroot"
				}
			} else {
				json {
				  source => "message"
				  target => "azroot"
				}
			}

			#Generating dataType and dataSource fields
			  if [@metadata][dataSource] {
				mutate {
					add_field => {
						"dataType" => "azure"
					}
					#Add based on metadata
					add_field => {
						"dataSource" => "%{[@metadata][dataSource]}"
					}
					add_field => {
						"[logx][tenant]" => "%{[@metadata][dataSource]}"
					}
				}
			  }
			#Generating JSON structure of logx.azure
			mutate {
					#First, fields without fields inside, from the log example,faltan los de la seg pagina
					rename => { "[message]" => "[logx][azure][message]" }
					rename => { "[azroot][id]" => "[logx][azure][id]" }
					rename => { "[azroot][eventType]" => "[logx][azure][eventType]" }
					rename => { "[azroot][subject]" => "[logx][azure][subject]" }
					rename => { "[azroot][eventTime]" => "[logx][azure][eventTime]" }
					rename => { "[azroot][topic]" => "[logx][azure][topic]" }

					#Then, fields inside [data] without fields inside, from the log example
					rename => { "[azroot][data][tenantId]" => "[logx][azure][tenantId]" }
					rename => { "[azroot][data][correlationId]" => "[logx][azure][correlationId]" }
					rename => { "[azroot][data][resourceUri]" => "[logx][azure][resourceUri]" }
					rename => { "[azroot][data][operationName]" => "[logx][azure][operationName]" }
					rename => { "[azroot][data][status]" => "[logx][azure][status]" }
					rename => { "[azroot][data][subscriptionId]" => "[logx][azure][subscriptionId]" }
					rename => { "[azroot][data][resourceProvider]" => "[logx][azure][resourceProvider]" }

					#Then fields in root level in the docs (first doc url), but not in the log examples, because operationName is inside [data]
					# and in the docs are root level, we asume that the other must come in the same way
					rename => { "[azroot][data][resourceId]" => "[logx][azure][resourceId]" }
					rename => { "[azroot][data][category]" => "[logx][azure][category]" }
					rename => { "[azroot][data][resultType]" => "[logx][azure][resultType]" }
					rename => { "[azroot][data][resultSignature]" => "[logx][azure][resultSignature]" }
					rename => { "[azroot][data][durationMs]" => "[logx][azure][durationMs]" }
					rename => { "[azroot][data][callerIpAddress]" => "[logx][azure][callerIpAddress]" }
					rename => { "[azroot][data][level]" => "[logx][azure][level]" }
					rename => { "[azroot][data][location]" => "[logx][azure][location]" }
					rename => { "[azroot][data][properties]" => "[logx][azure][properties]" }

					#Then fields in root level in the docs (second doc url), but not in the log examples, because operationName is inside [data]
					# and in the docs are root level, we asume that the other must come in the same way
					rename => { "[azroot][data][channels]" => "[logx][azure][channels]" }
					rename => { "[azroot][data][description]" => "[logx][azure][description]" }
					rename => { "[azroot][data][eventDataId]" => "[logx][azure][eventDataId]" }
					rename => { "[azroot][data][eventName]" => "[logx][azure][eventName]" }
					rename => { "[azroot][data][eventTimestamp]" => "[logx][azure][eventTimestamp]" }
					rename => { "[azroot][data][operationId]" => "[logx][azure][operationId]" }
					rename => { "[azroot][data][resourceGroupName]" => "[logx][azure][resourceGroupName]" }
					rename => { "[azroot][data][resourceProviderName]" => "[logx][azure][resourceProviderName]" }
					rename => { "[azroot][data][resourceType]" => "[logx][azure][resourceType]" }
					rename => { "[azroot][data][subStatus]" => "[logx][azure][subStatus]" }
					rename => { "[azroot][data][submissionTimestamp]" => "[logx][azure][submissionTimestamp]" }
					rename => { "[azroot][data][relatedEvents]" => "[logx][azure][relatedEvents]" }
					rename => { "[azroot][data][caller]" => "[logx][azure][caller]" }

					#Then, fields inside [data][authorization] without fields inside, from the log example
					rename => { "[azroot][data][authorization][scope]" => "[logx][azure][auth_scope]" }
					rename => { "[azroot][data][authorization][action]" => "[logx][azure][auth_action]" }

					#Then, fields inside [azroot][data][httpRequest] with fields inside, from the log example
					rename => { "[azroot][data][httpRequest]" => "[logx][azure][httpRequest]" }

					#Then, fields inside [data][authorization][evidence], from the log example
					rename => { "[azroot][data][authorization][evidence][role]" => "[logx][azure][auth_evidence_role]" }
					rename => { "[azroot][data][authorization][evidence][roleAssignmentScope]" => "[logx][azure][auth_evidence_roleAssignmentScope]" }
					rename => { "[azroot][data][authorization][evidence][roleAssignmentId]" => "[logx][azure][auth_evidence_roleAssignmentId]" }
					rename => { "[azroot][data][authorization][evidence][principalId]" => "[logx][azure][auth_evidence_principalId]" }
					rename => { "[azroot][data][authorization][evidence][principalType]" => "[logx][azure][auth_evidence_principalType]" }
					rename => { "[azroot][data][authorization][evidence][roleDefinitionId]" => "[logx][azure][auth_evidence_roleDefinitionId]" }

					#Then, fields inside [data][claims], from the log example and match with docs at root level
					rename => { "[azroot][data][claims][aud]" => "[logx][azure][claims_aud]" }
					rename => { "[azroot][data][claims][iss]" => "[logx][azure][claims_iss]" }
					rename => { "[azroot][data][claims][iat]" => "[logx][azure][claims_iat]" }
					rename => { "[azroot][data][claims][nbf]" => "[logx][azure][claims_nbf]" }
					rename => { "[azroot][data][claims][exp]" => "[logx][azure][claims_exp]" }
					rename => { "[azroot][data][claims][ver]" => "[logx][azure][claims_ver]" }
					rename => { "[azroot][data][claims][http://schemas.microsoft.com/identity/claims/tenantid]" => "[logx][azure][claims_tenantid]" }
					rename => { "[azroot][data][claims][http://schemas.microsoft.com/claims/authnmethodsreferences]" => "[logx][azure][claims_authnmethodsreferences]" }
					rename => { "[azroot][data][claims][http://schemas.microsoft.com/identity/claims/objectidentifier]" => "[logx][azure][claims_objectidentifier]" }
					rename => { "[azroot][data][claims][http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn]" => "[logx][azure][claims_upn]" }
					rename => { "[azroot][data][claims][puid]" => "[logx][azure][claims_puid]" }
					rename => { "[azroot][data][claims][http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier]" => "[logx][azure][claims_nameidentifier]" }
					rename => { "[azroot][data][claims][http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname]" => "[logx][azure][claims_givenname]" }
					rename => { "[azroot][data][claims][http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname]" => "[logx][azure][claims_surname]" }
					rename => { "[azroot][data][claims][name]" => "[logx][azure][claims_name]" }
					rename => { "[azroot][data][claims][groups]" => "[logx][azure][claims_groups]" }
					rename => { "[azroot][data][claims][http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name]" => "[logx][azure][claims_identity_name]" }
					rename => { "[azroot][data][claims][appid]" => "[logx][azure][claims_appid]" }
					rename => { "[azroot][data][claims][http://schemas.microsoft.com/identity/claims/scope]" => "[logx][azure][claims_scope]" }
					rename => { "[azroot][data][claims][appidacr]" => "[logx][azure][claims_appidacr]" }
					rename => { "[azroot][data][claims][http://schemas.microsoft.com/claims/authnclassreference]" => "[logx][azure][claims_authnclassreference]" }

					#Then, fields inside [data][claims] not in doc but in log examples provided
					rename => { "[azroot][data][claims][ipaddr]" => "[logx][azure][src_ip]" }
					rename => { "[azroot][data][claims][xms_tcdt]" => "[logx][azure][claims_xms_tcdt]" }
					rename => { "[azroot][data][claims][rh]" => "[logx][azure][claims_rh]" }
					rename => { "[azroot][data][claims][aio]" => "[logx][azure][claims_aio]" }
					rename => { "[azroot][data][claims][uti]" => "[logx][azure][claims_uti]" }
			}

			#Finally remove unused fields
			mutate {
				remove_field => ["path","@version","dataVersion","[data][time]","metadataVersion","type","data","azroot"]
			}
		}
		}
		','azure-eventhub',NULL,true,'AZURE',true,'1.0.2'),
			 (301,'filter {

		   split {
			  field => "message"
			  terminator => "<utm-log-separator>"
		   }

			 #Looking for datasource generated by an agent and parse original message
		   if [message]=~/\[utm_stack_agent_ds=(.+)\]-(.+)/ {
			grok {
			  match => {
				"message" => [ "\[utm_stack_agent_ds=%{DATA:dataSource}\]-%{GREEDYDATA:original_log_message}" ]
			  }
			}
		   }
		   if [original_log_message] {
			mutate {
			  update => { "message" => "%{[original_log_message]}" }
			}
		   }

		   if [message] and "%ASA-" in [message] {
		#......................................................................#
		#Filter version 2.0.1
		# Cisco ASA based on examples provided and https://www.cisco.com/c/en/us/td/docs/security/asa/syslog/b_syslog.html (january 2022)
		#Using grok to parse priority if present
			grok {
					match => {
						"message" => [
						"(<%{NUMBER:priority}>)?%{GREEDYDATA:cisco_msg_init}"
						]
					}
				}
		#......................................................................#
		#Using grok to parse date and ip or host if present
			if [cisco_msg_init]{
			  grok {
				 match => {
				  "cisco_msg_init" => [ "%{CISCOTIMESTAMP:fecha} (%{IPORHOST:ciscoDataSource})?(:)? %{GREEDYDATA:cisco_message}" ]
				 }
			  }
			}
		#......................................................................#
		#Generating dataSource field required by CurrelationRulesEngine
		#Checks if ciscoDataSource exists, if true, the dataSource field take its value, if not, take the agent dataSource value
		 if ([ciscoDataSource]){
				if [dataSource] {
				  mutate {
					update => { "dataSource" => "%{[ciscoDataSource]}" }
				  }
				} else {
				  mutate {
					add_field => { "dataSource" => "%{ciscoDataSource}" }
				  }
				}
		 }
		#Finally evaluates to the host variable if can not be calculated
		 if ![dataSource] {
			mutate {
			   add_field => { "dataSource" => "%{host}" }
			 }
		 }

		#......................................................................#
		#Generating dataType field required by CurrelationRulesEngine
		   mutate {
				  add_field => {
					"dataType" => "firewall-cisco-asa"
				  }
			   }
		#......................................................................#
		#Using grok to parse ASA severity and message ID
			if [cisco_message]{
				grok {
					match => {
						"cisco_message" => [
						"%%{GREEDYDATA:cisco_tag}-%{INT:severity}-%{INT:messageid}: %{GREEDYDATA:cisco_msg}"
						]
					}
				}
			}
		#......................................................................#
		#Begin ASA message processing by ID based on https://www.cisco.com/c/en/us/td/docs/security/asa/syslog/b_syslog.html
		if [messageid] and [cisco_msg]{
			#......................................................................#
			#ASA-2-106001
			if [messageid]=="106001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:direction} %{WORD:protocol} connection %{WORD:cisco_action} from %{IP:src_ip}/%{INT:src_port} to %{IP:dst_ip}/%{INT:dst_port} flags %{GREEDYDATA:tcp_flags} on interface %{GREEDYDATA:src_interface}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-2-106017
			if [messageid]=="106017" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} IP due to %{GREEDYDATA:event_description} from %{GREEDYDATA:src_ip} to %{IPORHOST:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-1-106021
			if [messageid]=="106021" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} protocol reverse path check from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-2-106101
			if [messageid]=="106101" {
					grok {
						match => {
							"cisco_msg" => [
							"Number of cached %{GREEDYDATA:cisco_action} for ACL log has reached limit(\s)?\(%{INT:num_flows}(\s)?\)%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-6-106102,106103
			if [messageid]=="106102" or [messageid]=="106103"{
					grok {
						match => {
							"cisco_msg" => [
							"access-list %{GREEDYDATA:access_list} %{WORD:cisco_action} %{WORD:protocol} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{DATA:src_interface}/%{IPORHOST:src_ip}(\s)?\((\s)?%{INT:src_port}(\s)?\)(\s)?->(\s)?%{DATA:dst_interface}/%{IPORHOST:dst_ip}(\s)?\((\s)?%{INT:dst_port}(\s)?\) hit-cnt %{INT:hit_count} %{GREEDYDATA:irrelevant}",
							"access-list %{GREEDYDATA:access_list} %{WORD:cisco_action} %{WORD:protocol} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{DATA:src_interface}/%{IPORHOST:src_ip} %{INT:src_port} %{DATA:dst_interface}/%{IPORHOST:dst_ip} %{INT:dst_port} hit-cnt %{INT:hit_count} %{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [cisco_action]{
						if [cisco_action] =~/(Permitted|permitted)/ {
							mutate {
								add_field => { "[logx][utm][action]" => "Success" }
							}
						}
					}
			}
			#......................................................................#
			#ASA-4-109017
			if [messageid]=="109017"{
					grok {
						match => {
							"cisco_msg" => [
							"User at %{GREEDYDATA:src_ip} exceeded auth proxy connection limit(\s)?\(%{GREEDYDATA:limit}(\s)?\)%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-109101,109102,109103
			if [messageid]=="109101" or [messageid]=="109102" or [messageid]=="109103"{
					grok {
						match => {
							"cisco_msg" => [
							"Received CoA %{WORD:cisco_action} request from %{IPORHOST:src_ip} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), with audit-session-id: %{GREEDYDATA:audit_session_id}",
							"Received CoA %{WORD:cisco_action} from %{IPORHOST:src_ip}, but cannot find named session %{GREEDYDATA:audit_session_id}",
							"CoA %{WORD:cisco_action} from %{IPORHOST:src_ip} failed for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), with session ID: %{GREEDYDATA:audit_session_id}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-109201 to 109213
			if [messageid]>="109201" and [messageid]<="109213"{
					grok {
						match => {
							"cisco_msg" => [
							"UAUTH(:)? Session(\s|=)%{GREEDYDATA:session}, User(\s|=)(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), Assigned IP(\s|=)%{IPORHOST:src_ip}, %{GREEDYDATA:cisco_action}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113004
			if [messageid]=="113004"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user %{WORD:aaa_type} Successful : server = %{GREEDYDATA:src_ip} : user = %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113005
			if [messageid]=="113005"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user authentication Rejected(\s)?:(\s)?reason(\s)?=(\s)?%{DATA:reason}(\s)?:(\s)?(server|Server)(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?(User|user)(\s)?=(\s)?%{DATA:src_fwuser}(\s)?:(\s)?(User|user) IP(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113008
			if [messageid]=="113008"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA transaction status ACCEPT(\s)?:(\s)?(user|User)(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113009
			if [messageid]=="113009"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA retrieved default group policy \(%{GREEDYDATA:policy}\) for (user|User)(\s)?=(\s)?%{GREEDYDATA:src_fwuser}",
							"AAA retrieved default group policy %{GREEDYDATA:policy} for (user|User) %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113010
			if [messageid]=="113010"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA challenge received for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) from server %{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113011
			if [messageid]=="113011"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA retrieved user specific group policy %{GREEDYDATA:policy} for user %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113012
			if [messageid]=="113012"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user authentication Successful(\s)?: local database(\s)?: user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113013
			if [messageid]=="113013"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA unable to complete the request Error(\s)?:(\s)?reason(\s)?=(\s)?%{GREEDYDATA:reason}:(\s)?user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113014
			if [messageid]=="113014"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA authentication server not accessible(\s)?: server(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113015, 113017
			if [messageid]=="113015" or [messageid]=="113017"{
					grok {
						match => {
							"cisco_msg" => [
							"(AAA user authentication Rejected|AAA credentials rejected)(\s)?: reason(\s)?=(\s)?%{DATA:reason}(\s)?:(\s)?local database(\s)?:(\s)?user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?:(\s)?user IP(\s)?=(\s)?%{IPORHOST:src_ip}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113016
			if [messageid]=="113016"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA credentials rejected(\s)?: reason(\s)?=(\s)?%{GREEDYDATA:reason}:(\s)?server(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?:(\s)?user IP(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-113019
			if [messageid]=="113019"{
					grok {
						match => {
							"cisco_msg" => [
							"Group(\s)?=(\s)?%{GREEDYDATA:group}(\s)?,(\s)?Username(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?IP(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?,(\s)?Session disconnected.(\s)?Session Type:(\s)?%{GREEDYDATA:session_type}(\s)?,(\s)?Duration:(\s)?%{GREEDYDATA:duration}(\s)?,(\s)?Bytes xmt:(\s)?%{INT:bytes_xmt}(\s)?,(\s)?Bytes rcv:(\s)?%{INT:bytes_rcv}(\s)?,(\s)?Reason:(\s)?%{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-113031,113032,113033
			if [messageid]=="113031" or [messageid]=="113032" or [messageid]=="113033"{
					grok {
						match => {
							"cisco_msg" => [
							"Group %{GREEDYDATA:group} User (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} AnyConnect (vpn-filter|ipv6-vpn-filter) %{GREEDYDATA:filter} is an (IPv6|IPv4) ACL; ACL not applied.",
							"Group %{GREEDYDATA:group} User (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} AnyConnect session not allowed.(\s)?ACL parse error."
							]
						}
					}
			}
			#......................................................................#
			#ASA-113034,113035,113036,113038,113039
			if [messageid]>="113034" and [messageid]<="113039" and [messageid]!="113037"{
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP (<%{IPORHOST:src_ip}>|%{IPORHOST:src_ip}) %{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [messageid] != "113036" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-113042
			if [messageid]=="113042"{
					grok {
						match => {
							"cisco_msg" => [
							"CoA: Non-HTTP connection from %{GREEDYDATA:src_interface}(\s)?:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}(\s)?:(\s)?%{IPORHOST:dst_ip}(\s)?/%{INT:dst_port} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) at %{IPORHOST:client_ip} %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-201003
			if [messageid]=="201003"{
					grok {
						match => {
							"cisco_msg" => [
							"Embryonic limit exceeded %{INT:num_conns}(\s)?/%{INT:limit} for %{IPORHOST:src_ip}(\s)?/%{INT:src_port} \(%{IPORHOST:global_ip}(\s)?\) %{IPORHOST:dst_ip}(\s)?/%{INT:dst_port} on interface %{GREEDYDATA:dst_interface}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-209003
			if [messageid]=="209003"{
					grok {
						match => {
							"cisco_msg" => [
							"Fragment database limit of %{INT:limit} exceeded:(\s)?src(\s)?=(\s)?%{DATA:src_ip}(\s)?,(\s)?dest(\s)?=(\s)?%{DATA:dst_ip}(\s)?,(\s)?proto(\s)?=(\s)?%{DATA:protocol}(\s)?,(\s)?id(\s)?=(\s)?%{GREEDYDATA:id}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-316001
			if [messageid]=="316001"{
					grok {
						match => {
							"cisco_msg" => [
							"Denied new tunnel to %{IPORHOST:src_ip}%{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-316002
			if [messageid]=="316002"{
					grok {
						match => {
							"cisco_msg" => [
							"VPN Handle error:(\s)?protocol=%{GREEDYDATA:protocol}(\s)?,(\s)?src %{INT:in_if_num}(\s)?:(\s)?%{IPORHOST:src_ip},(\s)?dst %{INT:out_if_num}(\s)?:(\s)?%{IPORHOST:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302003,302004
			if [messageid]=="302003" or [messageid]=="302004" {
					grok {
						match => {
							"cisco_msg" => [
							"(Built H245 connection|Pre-allocate H323 UDP backconnection) for foreign_address %{IPORHOST:src_ip}(/%{INT:src_port}|/)? (to(\s))?local_address %{IPORHOST:dst_ip}(/%{INT:dst_port}|/)?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302012
			if [messageid]=="302012"{
					grok {
						match => {
							"cisco_msg" => [
							"Pre-allocate H225 Call Signalling Connection for faddr %{GREEDYDATA:src_ip}/%{INT:src_port} to laddr %{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302013
			if [messageid]=="302013"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} (Probe)?(\s)?%{WORD:protocol} %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\(%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\((''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\((''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302014
			if [messageid]=="302014"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (Probe)?(\s)?%{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302015
			if [messageid]=="302015"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\(%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302016
			if [messageid]=="302016"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302017
			if [messageid]=="302017"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} \((\s)?%{IPORHOST:translated_src_ip}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/%{DATA:real_cid} \(%{IPORHOST:translated_dst_ip}(\s)?/%{DATA:translated_cid}\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302018
			if [messageid]=="302018"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} \((\s)?%{IPORHOST:translated_src_ip}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/%{DATA:real_cid} \(%{IPORHOST:translated_dst_ip}(\s)?/%{DATA:translated_cid}\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302020
			if [messageid]=="302020"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})/%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?gaddr %{GREEDYDATA:global_ip}/%{INT:global_port} laddr %{IPORHOST:src_ip}/%{INT:src_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? type %{INT:icmp_type} code %{INT:code}",
							"Built %{WORD:direction} %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip}) (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?gaddr %{GREEDYDATA:global_ip} laddr %{IPORHOST:src_ip} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?type %{INT:icmp_type} code %{INT:code}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302021
			if [messageid]=="302021"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})/%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? gaddr %{GREEDYDATA:global_ip}/%{INT:global_port} laddr %{IPORHOST:src_ip}/%{INT:src_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? type %{INT:icmp_type} code %{INT:code}",
							"Teardown %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? gaddr %{GREEDYDATA:global_ip} laddr %{IPORHOST:src_ip} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?type %{INT:icmp_type} code %{INT:code}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302022,302024,302026
			if [messageid]=="302022" or [messageid]=="302024" or [messageid]=="302026" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{GREEDYDATA:role} stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(%{GREEDYDATA:irrelevant})?",
							"Built %{GREEDYDATA:role} stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?\)(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302023,302025,302027
			if [messageid]=="302023" or [messageid]=="302025" or [messageid]=="302027"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} duration %{GREEDYDATA:duration} forwarded bytes %{INT:bytes_xmt} %{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302033,302034
			if [messageid]=="302033" or [messageid]=="302034" {
					grok {
						match => {
							"cisco_msg" => [
							"(Pre-allocated|Unable to pre-allocate) H323 GUP Connection for faddr %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to laddr %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					if [messageid] == "302033" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-302035
			if [messageid]=="302035" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\(%{DATA:info_user2}\))?(%{GREEDYDATA:toEnd})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding reason and emitter user
					if [toEnd]{
						if "(" in [toEnd] {
						grok {
							match => {
								"toEnd" => [
								"(\s)?\((\s)?%{DATA:src_fwuser}(\s)?\)(%{GREEDYDATA:irrelevant})?"
								]
							}
						}
						}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","toEnd"]
					}
			}
			#......................................................................#
			#ASA-302036
			if [messageid]=="302036" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\(%{DATA:info_user2}\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt} %{GREEDYDATA:reasonToEnd}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding reason and emitter user
					if [reasonToEnd]{
						if "(" in [reasonToEnd] {
						grok {
							match => {
								"reasonToEnd" => [
								"%{GREEDYDATA:reason} \((\s)?%{DATA:src_fwuser}(\s)?\)(%{GREEDYDATA:irrelevant})?"
								]
							}
						}
						}else {
							mutate {
							add_field => { "reason" => "%{reasonToEnd}" }
							}
						}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","reasonToEnd"]
					}
			}
			#......................................................................#
			#ASA-302303
			if [messageid]=="302303" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302304
			if [messageid]=="302304" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} %{GREEDYDATA:duration},(\s)?%{INT:bytes_xmt}(\s)?,%{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-302305
			if [messageid]=="302305" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\(%{DATA:info_user2}\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2"]
					}
			}
			#......................................................................#
			#ASA-302306
			if [messageid]=="302306" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\(%{DATA:info_user2}\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt} %{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","reasonToEnd"]
					}
			}
			#......................................................................#
			#ASA-305009
			if [messageid]=="305009" {
					grok {
						match => {
							"cisco_msg" => [
							"Built (dynamic|static) translation from %{DATA:src_interface}(\s)?(\(%{DATA:acl_name}\))?:%{IPORHOST:src_ip} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{DATA:dst_interface}(\s)?:%{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-305010
			if [messageid]=="305010" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (dynamic|static) translation from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-305011
			if [messageid]=="305011" {
					grok {
						match => {
							"cisco_msg" => [
							"Built (dynamic|static) %{WORD:protocol} translation from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-305012
			if [messageid]=="305012" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (dynamic|static) %{WORD:protocol} translation from %{DATA:src_interface}(\s)?(\(%{DATA:acl_name}\))?:%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#.......................................................................#
			#ASA-322001
			if [messageid]=="322001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} MAC address %{DATA:src_mac_address},(\s)?%{GREEDYDATA:event_description} on interface %{GREEDYDATA:src_interface}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-322002
			if [messageid]=="322002" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{DATA:event_description} for arp %{WORD:http_message} received from host %{DATA:src_mac_address} on interface %{DATA:src_interface}(\s)?.(\s)?This host is advertising MAC Address %{DATA:src_fake_mac_address} for IP Address %{IPORHOST:src_ip}(\s)?,(\s)?which is (statically|dynamically) bound to MAC Address %{GREEDYDATA:src_real_mac_address}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-322003
			if [messageid]=="322003" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{DATA:event_description} for arp %{WORD:http_message} received from host %{DATA:src_mac_address} on interface %{DATA:src_interface}(\s)?.(\s)?This host is advertising MAC Address %{DATA:src_fake_mac_address} for IP Address %{IPORHOST:src_ip}(\s)?,(\s)?which %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-400007,400008,400009,400026,400027,400028,400029,400030,400031,400032,400033
			if [messageid]=="400007" or [messageid]=="400008" or [messageid]=="400009" or [messageid]=="400026" or [messageid]=="400027" or [messageid]=="400028" or [messageid]=="400029" or [messageid]=="400030" or [messageid]=="400031" or [messageid]=="400032" or [messageid]=="400033"{
					grok {
						match => {
							"cisco_msg" => [
							"IPS:%{INT:signature_id} %{DATA:signature_title} from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
					}
				if [signature_title]{
					grok {
						match => {
							"signature_title" => [
							"%{WORD:protocol}%{GREEDYDATA:irrelevant}"
							]
						}
					}
				}
			}
			#......................................................................#
			#ASA-400023,400024,400041
			if [messageid]=="400023" or [messageid]=="400024" or [messageid]=="400041"{
					grok {
						match => {
							"cisco_msg" => [
							"IPS:%{INT:signature_id} %{DATA:signature_title} from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
					}
				if [signature_title]{
					grok {
						match => {
							"signature_title" => [
							"%{WORD:irrelevant} %{WORD:protocol}%{GREEDYDATA:irrelevant}"
							]
						}
					}
				}
			}
			#......................................................................#
			#ASA-400025,400050
			if [messageid]=="400025" or [messageid]=="400050"{
					grok {
						match => {
							"cisco_msg" => [
							"IPS:%{INT:signature_id} %{DATA:signature_title} from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-402114
			if [messageid]=="402114" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC:(\s)?Received an %{WORD:protocol} packet(\s)?\(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} with an %{GREEDYDATA:event_description}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-402115
			if [messageid]=="402115" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received a packet from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} containing %{WORD:act_proto} data instead of %{WORD:protocol}%{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-402116
			if [messageid]=="402116" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet(\s)?\(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{IPORHOST:dst_ip}(\s)?.%{GREEDYDATA:event_description}.(\s)?The packet specifies its destination as %{GREEDYDATA:pkt_daddr}(\s)?,(\s)?its source as %{GREEDYDATA:pkt_saddr}(\s)?,(\s)?and its protocol as %{GREEDYDATA:pkt_prot}(\s)?.(\s)?The SA specifies its local proxy as %{DATA:id_daddr}(\s)?/%{DATA:id_dmask}(\s)?/%{DATA:id_dprot}(\s)?/%{DATA:dst_port} and its remote proxy as %{DATA:id_saddr}(\s)?/%{DATA:id_smask}(\s)?/%{DATA:id_sprot}(\s)?/%{GREEDYDATA:src_port}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-402117
			if [messageid]=="402117" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received a non-IPsec \(%{WORD:protocol}(\s)?\) packet from %{GREEDYDATA:src_ip} to %{IPORHOST:dst_ip}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#.......................................................................#
			#ASA-402118
			if [messageid]=="402118" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet \(SPI=%{DATA:spi}(\s)?,(\s)?sequence number(=)?(\s)?%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{GREEDYDATA:dst_ip} containing an %{GREEDYDATA:event_description} fragment of length %{GREEDYDATA:frag_len} with offset %{GREEDYDATA:frag_offset}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-402119,402120
			if [messageid]=="402119" or [messageid]=="402120" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet \(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{GREEDYDATA:dst_ip} that %{GREEDYDATA:event_description}"
							]
						}
					}
					if [messageid]=="402119"{
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-402128
			if [messageid]=="402128" {
					grok {
						match => {
							"cisco_msg" => [
							"CRYPTO: An attempt to allocate a large memory block failed,(\s)?size:(\s)?%{GREEDYDATA:size}(\s)?,(\s)?limit:(\s)?%{GREEDYDATA:limit}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-405001
			if [messageid]=="405001" {
					grok {
						match => {
							"cisco_msg" => [
							"Received %{WORD:protocol} %{WORD:http_message} %{WORD:event_description} from %{IPORHOST:src_ip}(\s)?/%{DATA:src_mac_address} on interface %{DATA:src_interface} with existing ARP entry %{IPORHOST:src_real_ip}(\s)?/%{GREEDYDATA:src_real_mac_address}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-405002
			if [messageid]=="405002" {
					grok {
						match => {
							"cisco_msg" => [
							"Received %{GREEDYDATA:event_description} from %{IPORHOST:src_ip}(\s)?/%{DATA:src_mac_address} for %{GREEDYDATA:irrelevant}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-406001
			if [messageid]=="406001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} port command low port(\s)?:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-406002
			if [messageid]=="406002" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} port command %{DATA:event_description}:(\s)?IP_address(\s)?\(%{IPORHOST:src_ip}(\s)?\) to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-407002
			if [messageid]=="407002" {
					grok {
						match => {
							"cisco_msg" => [
							"Embryonic limit %{INT:num_conns}(\s)?/%{INT:limit} for through connections exceeded.%{IPORHOST:src_ip}(\s)?/%{INT:src_port} to %{GREEDYDATA:global_ip} \(%{IPORHOST:dst_ip}(\s)?\)(\s)?/%{INT:dst_port} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#ASA-603109
			if [messageid]=="603109" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} Tunnel at %{GREEDYDATA:src_interface},(\s)?tunnel-id(\s)?=(\s)?%{INT:tunnel_id}(\s)?,(\s)?remote-peer(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#ASA-605004
			if [messageid]=="605004" {
					grok {
						match => {
							"cisco_msg" => [
							"%{GREEDYDATA:event_description} from %{GREEDYDATA:src_ip}/%{INT:src_port} to %{GREEDYDATA:dst_interface}:%{GREEDYDATA:dst_ip}/%{INT:dst_port} for user %{GREEDYDATA:username}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-617100
			if [messageid]=="617100" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{INT:num_conns} connection(\s)?(\(s\))? for user %{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-106018
			if [messageid]=="106018" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} packet type %{INT:icmp_type} %{WORD:cisco_action} by %{WORD:direction} list %{GREEDYDATA:access_list} src %{GREEDYDATA:src_ip} dest %{GREEDYDATA:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-106020
			if [messageid]=="106020" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} IP teardrop fragment \(size(\s)?=(\s)?%{INT:fragment_size},(\s)?offset(\s)?=(\s)?%{INT:fragment_offset}\) from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-611301
			if [messageid]=="611301" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} configured for Client Mode with no split tunneling:(\s)?NAT address:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-611303
			if [messageid]=="611303" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} configured for Client Mode with split tunneling: NAT address:(\s)?%{GREEDYDATA:nat_address} Split Tunnel Networks: %{GREEDYDATA:src_ip}/%{GREEDYDATA:src_masc} %{GREEDYDATA:dst_ip}/%{GREEDYDATA:dst_masc}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-611304
			if [messageid]=="611304" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} exemption configured for Network Extension Mode with split tunneling: Split Tunnel Networks: %{GREEDYDATA:src_ip}/%{GREEDYDATA:src_masc} %{GREEDYDATA:dst_ip}/%{GREEDYDATA:dst_masc}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-611307
			if [messageid]=="611307" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?Head end:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-611309
			if [messageid]=="611309" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:cisco_action} from head end and uninstalling previously downloaded policy:(\s)?Head End:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-611310,611311
			if [messageid]=="611310" or [messageid]=="611311" {
					grok {
						match => {
							"cisco_msg" => [
							"VNPClient:(\s)?XAUTH %{WORD:cisco_action}:(\s)?Peer:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					if [messageid]=="611310" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-611314
			if [messageid]=="611314" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient: Load Balancing Cluster with Virtual IP:(\s)?%{GREEDYDATA:src_ip} has redirected the to server %{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-611315
			if [messageid]=="611315" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:cisco_action} from Load Balancing Cluster member %{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-611318
			if [messageid]=="611318" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?User %{GREEDYDATA:cisco_action}:(\s)?Auth Server IP:(\s)?%{GREEDYDATA:src_ip} Auth Server Port:(\s)?%{INT:dst_port} Idle Timeout: %{INT:timeout}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-710003
			if [messageid]=="710003" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{GREEDYDATA:cisco_action} by ACL from %{IPORHOST:src_ip}(\s)?/%{INT:src_port} to %{WORD:dst_interface}(\s)?(\s)?:(\s)?%{IPORHOST:dst_ip}(\s)?/%{INT:dst_port}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-713252,713253
			if [messageid]=="713252" or [messageid]=="713253" {
					grok {
						match => {
							"cisco_msg" => [
							"Group = %{GREEDYDATA:group},(\s)?Username(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?IP(\s)?=(\s)?%{GREEDYDATA:src_ip},(\s)?Integrity Firewall Server is not available.%{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [messageid]=="713253" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-716001,716002,716003
			if [messageid]=="716001" or [messageid]=="716002" or [messageid]=="716003" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP (<%{IPORHOST:src_ip}>|%{IPORHOST:src_ip}) WebVPN %{GREEDYDATA:cisco_action}"
							]
						}
					}
					mutate {
							add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-716004,716006,716007,716009
			if [messageid]=="716004" or [messageid]=="716006" or [messageid]=="716007" or [messageid]=="716009" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) WebVPN %{GREEDYDATA:cisco_action}"
							]
						}
					}
					if [messageid]=="716004" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-716005
			if [messageid]=="716005" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) WebVPN ACL Parse Error:(\s)?%{GREEDYDATA:reason}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-716038
			if [messageid]=="716038" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} %{GREEDYDATA:cisco_action}, Session %{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-716039
			if [messageid]=="716039" {
					grok {
						match => {
							"cisco_msg" => [
							"%{GREEDYDATA:cisco_action},(\s)?group(\s)?=(\s)?%{GREEDYDATA:group} user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?Session %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-719017,719019,719020,719021,719022,719023
			if [messageid]=="719017" or [messageid]=="719019" or [messageid]=="719020"
			or [messageid]=="719021" or [messageid]=="719022" or [messageid]=="719023" {
					grok {
						match => {
							"cisco_msg" => [
							"WebVPN user(:)?(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{GREEDYDATA:cisco_action}"
							]
						}
					}
					if [messageid]=="719020" or [messageid]=="719022" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#ASA-719018
			if [messageid]=="719018" {
					grok {
						match => {
							"cisco_msg" => [
							"WebVPN user:(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) ACL ID %{GREEDYDATA:access_list} not %{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][cisco_asa][reason]" => "ACL not found" }
					}
			}
			#......................................................................#
			#ASA-719024
			if [messageid]=="719024" {
					grok {
						match => {
							"cisco_msg" => [
							"Email Proxy %{GREEDYDATA:cisco_action}:(\s)?session(\s)?=(\s)?%{GREEDYDATA:session} user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) addr(\s)?=(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-609002
			if [messageid]=="609002" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown local-host %{GREEDYDATA:zone-name}/\*(\s)?:(\s)?%{GREEDYDATA:src_ip} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#ASA-611305
			if [messageid]=="611305" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient(\s)?:(\s)?DHCP Policy installed(\s)?:(\s)?Primary DNS(\s)?:(\s)?%{GREEDYDATA:primary_dns_ip} Secondary DNS(\s)?:(\s)?%{GREEDYDATA:secondary_dns_ip} Primary WINS(\s)?:(\s)?%{GREEDYDATA:primary_wins_ip} Secondary WINS(\s)?:(\s)?%{GREEDYDATA:secondary_wins_ip}"
							]
						}
					}
			}
			#......................................................................#
			#ASA-733100
			if [messageid]=="733100" {
					grok {
						match => {
							"cisco_msg" => [
							"(\[)?%{DATA:object}(\])? drop rate(\s)?(-)?%{INT:rate_id} exceeded. Current burst rate is %{INT:current_rate_val} per second(,)?(\s)?(_)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second(,)?(\s)?(_)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-733101
			if [messageid]=="733101" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:object} %{GREEDYDATA:dst_ip} is targeted. Current burst rate is %{INT:current_rate_val} per second,(\s)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second,(\s)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?",
							"%{WORD:object} %{GREEDYDATA:src_ip} is attacking. Current burst rate is %{INT:current_rate_val} per second,(\s)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second,(\s)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?"

							]
						}
					}
			}
			#......................................................................#
			#ASA-733102
			if [messageid]=="733102" {
					grok {
						match => {
							"cisco_msg" => [
							"Threat-detection add(s)? host %{GREEDYDATA:src_ip} to %{GREEDYDATA:irrelevant}?"

							]
						}
					}
			}
			#......................................................................#
			#ASA-733103
			if [messageid]=="733103" {
					grok {
						match => {
							"cisco_msg" => [
							"Threat-detection removes host %{GREEDYDATA:src_ip} from %{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#ASA-733104,733105
			if [messageid]=="733104" or [messageid]=="733105" {
					grok {
						match => {
							"cisco_msg" => [
							"TD_SYSLOG_%{DATA:protocol}_%{DATA:cisco_action}_AVERAGE_RATE_EXCEED%{GREEDYDATA:irrelevant}?",
							"TD_SYSLOG_%{DATA:protocol}_%{DATA:cisco_action}_BURST_RATE_EXCEED%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
		}
		#......................................................................#
		#Decoding severity
		if [severity]{
			if [severity] == "1" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Alert"
					}
				}
			}
			if [severity] == "2" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Critical"
					}
				}
			}
			if [severity] == "3" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Error"
					}
				}
			}
			if [severity] == "4" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Warning"
					}
				}
			}
			if [severity] == "5" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Notification"
					}
				}
			}
			if [severity] == "6" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Informational"
					}
				}
			}
			if [severity] == "7" {
				mutate {
					add_field => {
						"[logx][cisco_asa][severityLabel]" => "Debugging"
					}
				}
			}
		}
		#......................................................................#
		#Formatting number values
		if [severity]{
			mutate { convert => {"severity" => "integer"}}
		}
		if [messageid]{
			mutate { convert => {"messageid" => "integer"}}
		}
		if [src_port]{
			mutate { convert => {"src_port" => "integer"}}
		}
		if [dst_port]{
			mutate { convert => {"dst_port" => "integer"}}
		}
		if [hit_count]{
			mutate { convert => {"hit_count" => "integer"}}
		}
		if [bytes_xmt]{
			mutate { convert => {"bytes_xmt" => "integer"}}
		}
		if [bytes_rcv]{
			mutate { convert => {"bytes_rcv" => "integer"}}
		}
		if [in_if_num]{
			mutate { convert => {"in_if_num" => "integer"}}
		}
		if [out_if_num]{
			mutate { convert => {"out_if_num" => "integer"}}
		}
		if [mapped_src_port]{
			mutate { convert => {"mapped_src_port" => "integer"}}
		}
		if [mapped_dst_port]{
			mutate { convert => {"mapped_dst_port" => "integer"}}
		}
		if [icmp_type]{
			mutate { convert => {"icmp_type" => "integer"}}
		}
		if [code]{
			mutate { convert => {"code" => "integer"}}
		}
		if [tunnel_id]{
			mutate { convert => {"tunnel_id" => "integer"}}
		}
		if [num_conns]{
			mutate { convert => {"num_conns" => "integer"}}
		}
		if [fragment_size]{
			mutate { convert => {"fragment_size" => "integer"}}
		}
		if [fragment_offset]{
			mutate { convert => {"fragment_offset" => "integer"}}
		}
		if [timeout]{
			mutate { convert => {"timeout" => "integer"}}
		}
		if [global_port]{
			mutate { convert => {"global_port" => "integer"}}
		}
		#......................................................................#
		#Then add all possible fields to the json tree structure

		   mutate {
			  rename => { "priority" => "[logx][cisco_asa][priority]" }
			  rename => { "severity" => "[logx][cisco_asa][severity]" }
			  rename => { "message" => "[logx][cisco_asa][message]" }
			  rename => { "messageid" => "[logx][cisco_asa][messageid]" }
			  rename => { "cisco_action" => "[logx][cisco_asa][cisco_action]" }
			  rename => { "protocol" => "[logx][cisco_asa][proto]" }
			  rename => { "src_ip" => "[logx][cisco_asa][src_ip]" }
			  rename => { "src_port" => "[logx][cisco_asa][src_port]" }
			  rename => { "src_mac_address" => "[logx][cisco_asa][src_mac_address]" }
			  rename => { "dst_ip" => "[logx][cisco_asa][dest_ip]" }
			  rename => { "dst_port" => "[logx][cisco_asa][dest_port]" }
			  rename => { "direction" => "[logx][cisco_asa][direction]" }
			  rename => { "src_interface" => "[logx][cisco_asa][src_interface]" }
			  rename => { "dst_interface" => "[logx][cisco_asa][dst_interface]" }
			  rename => { "tcp_flags" => "[logx][cisco_asa][tcp_flags]" }
			  rename => { "event_description" => "[logx][cisco_asa][event_desc]" }
			  rename => { "limit" => "[logx][cisco_asa][limit]" }
			  rename => { "num_conns" => "[logx][cisco_asa][num_conns]" }
			  rename => { "global_ip" => "[logx][cisco_asa][global_ip]" }
			  rename => { "spi" => "[logx][cisco_asa][spi]" }
			  rename => { "seq_num" => "[logx][cisco_asa][seq_num]" }
			  rename => { "username" => "[logx][cisco_asa][src_user]" }
			  rename => { "http_message" => "[logx][cisco_asa][http_message]" }
			  rename => { "src_real_mac_address" => "[logx][cisco_asa][src_real_mac_address]" }

			  #New fields from ASA-1-106101
			  rename => { "num_flows" => "[logx][cisco_asa][num_flows]" }

			  #New fields from ASA-6-106102
			  rename => { "access_list" => "[logx][cisco_asa][access_list_id]" }
			  rename => { "src_fwuser" => "[logx][cisco_asa][src_user]" }
			  rename => { "hit_count" => "[logx][cisco_asa][hit_count]" }

			  #New fields from ASA-4-109017
			  rename => { "limit" => "[logx][cisco_asa][limit]" }

			  #New fields from ASA-109101,109102,109103
			  rename => { "audit_session_id" => "[logx][cisco_asa][audit_session_id]" }

			  #New fields from ASA-109201 to 109213
			  rename => { "session" => "[logx][cisco_asa][session]" }

			  #New fields from ASA-113004
			  rename => { "aaa_type" => "[logx][cisco_asa][aaa_type]" }

			  #New fields from ASA-113009
			  rename => { "policy" => "[logx][cisco_asa][policy]" }

			  #New fields from ASA-113013
			  rename => { "reason" => "[logx][cisco_asa][reason]" }

			  #New fields from ASA-113019
			  rename => { "group" => "[logx][cisco_asa][group]" }
			  rename => { "session_type" => "[logx][cisco_asa][session_type]" }
			  rename => { "duration" => "[logx][cisco_asa][duration]" }
			  rename => { "bytes_xmt" => "[logx][cisco_asa][bytes_xmt]" }
			  rename => { "bytes_rcv" => "[logx][cisco_asa][bytes_rcv]" }

			  #New fields from ASA-113031
			  rename => { "filter" => "[logx][cisco_asa][filter]" }

			  #New fields from ASA-113042
			  rename => { "client_ip" => "[logx][cisco_asa][client_ip]" }

			  #New fields from ASA-4-209003
			  rename => { "id" => "[logx][cisco_asa][id]" }

			  #New fields from ASA-316002
			  rename => { "in_if_num" => "[logx][cisco_asa][in_if_num]" }
			  rename => { "out_if_num" => "[logx][cisco_asa][out_if_num]" }

			  #New fields from ASA-302002,322003
			  rename => { "src_fake_mac_address" => "[logx][cisco_asa][src_fake_mac_address]" }

			  #New fields from ASA-302013
			  rename => { "connection_id" => "[logx][cisco_asa][connection_id]" }
			  rename => { "mapped_src_ip" => "[logx][cisco_asa][mapped_src_ip]" }
			  rename => { "mapped_src_port" => "[logx][cisco_asa][mapped_src_port]" }
			  rename => { "mapped_dst_ip" => "[logx][cisco_asa][mapped_dst_ip]" }
			  rename => { "mapped_dst_port" => "[logx][cisco_asa][mapped_dst_port]" }
			  rename => { "dst_fwuser" => "[logx][cisco_asa][dst_user]" }

			  #New fields from ASA-302017
			  rename => { "translated_src_ip" => "[logx][cisco_asa][translated_src_ip]" }
			  rename => { "translated_dst_ip" => "[logx][cisco_asa][translated_dst_ip]" }
			  rename => { "translated_cid" => "[logx][cisco_asa][translated_cid]" }
			  rename => { "real_cid" => "[logx][cisco_asa][real_cid]" }

			  #New fields from ASA-302021
			  rename => { "icmp_type" => "[logx][cisco_asa][icmp_type]" }
			  rename => { "code" => "[logx][cisco_asa][code]" }

			  #New fields from ASA-302020
			  rename => { "global_port" => "[logx][cisco_asa][global_port]" }

			  #New fields from ASA-302022
			  rename => { "role" => "[logx][cisco_asa][role]" }

			  #New fields from ASA-305012
			  rename => { "acl_name" => "[logx][cisco_asa][access_list_name]" }

			  #New fields from ASA-400007 to 400009,400023 to 400033,400041,400050
			  rename => { "signature_id" => "[logx][cisco_asa][signature_id]" }
			  rename => { "signature_title" => "[logx][cisco_asa][signature_title]" }

			  #New fields from ASA-4-402115
			  rename => { "act_proto" => "[logx][cisco_asa][act_proto]" }

			  #New fields from ASA-4-402116
			  rename => { "pkt_daddr" => "[logx][cisco_asa][pkt_daddr]" }
			  rename => { "pkt_saddr" => "[logx][cisco_asa][pkt_saddr]" }
			  rename => { "pkt_prot" => "[logx][cisco_asa][pkt_prot]" }
			  rename => { "id_daddr" => "[logx][cisco_asa][id_daddr]" }
			  rename => { "id_dmask" => "[logx][cisco_asa][id_dmask]" }
			  rename => { "id_dprot" => "[logx][cisco_asa][id_dprot]" }
			  rename => { "id_saddr" => "[logx][cisco_asa][id_saddr]" }
			  rename => { "id_smask" => "[logx][cisco_asa][id_smask]" }
			  rename => { "id_sprot" => "[logx][cisco_asa][id_sprot]" }

			  #New fields from ASA-4-402118
			  rename => { "frag_len" => "[logx][cisco_asa][frag_len]" }
			  rename => { "frag_offset" => "[logx][cisco_asa][frag_offset]" }

			  #New fields from ASA-5-402128
			  rename => { "size" => "[logx][cisco_asa][size]" }

			  #New fields from ASA-4-405001
			  rename => { "src_real_ip" => "[logx][cisco_asa][src_real_ip]" }

			  #New fields from ASA-603109
			  rename => { "tunnel_id" => "[logx][cisco_asa][tunnel_id]" }

			  #New fields from ASA-106020
			  rename => { "fragment_size" => "[logx][cisco_asa][fragment_size]" }
			  rename => { "fragment_offset" => "[logx][cisco_asa][fragment_offset]" }

			  #New fields from ASA-611303
			  rename => { "nat_address" => "[logx][cisco_asa][nat_address]" }
			  rename => { "src_masc" => "[logx][cisco_asa][src_masc]" }
			  rename => { "dst_masc" => "[logx][cisco_asa][dst_masc]" }

			  #New fields from ASA-611305
			  rename => { "primary_dns_ip" => "[logx][cisco_asa][primary_dns_ip]" }
			  rename => { "secondary_dns_ip" => "[logx][cisco_asa][secondary_dns_ip]" }
			  rename => { "primary_wins_ip" => "[logx][cisco_asa][primary_wins_ip]" }
			  rename => { "secondary_wins_ip" => "[logx][cisco_asa][secondary_wins_ip]" }

			  #New fields from ASA-611318
			  rename => { "timeout" => "[logx][cisco_asa][timeout]" }

			  #New fields from ASA-609002
			  rename => { "zone-name" => "[logx][cisco_asa][zone-name]" }

			  #New fields from ASA-733100,733101
			  rename => { "object" => "[logx][cisco_asa][object]" }
			  rename => { "rate_id" => "[logx][cisco_asa][rate_id]" }
			  rename => { "current_rate_val" => "[logx][cisco_asa][current_rate_val]" }
			  rename => { "current_rate_val_max" => "[logx][cisco_asa][current_rate_val_max]" }
			  rename => { "average_rate_val" => "[logx][cisco_asa][average_rate_val]" }
			  rename => { "average_rate_val_max" => "[logx][cisco_asa][average_rate_val_max]" }
			  rename => { "total_cnt" => "[logx][cisco_asa][total_cnt]" }

		   }

		   #Finally, remove unnecessary fields
		   mutate {
			  remove_field => ["@version","path","cisco_tag","cisco_msg_init","cisco_message","fecha",
			  "irrelevant","cisco_msg","ciscoDataSource"]
		   }
		  }
		   #Also, remove unwanted fields if the message not match with conditions
		   mutate {
			  remove_field => ["original_log_message","headers"]
		   }
		}
		','cisco-asa',NULL,true,'CISCO',false,'2.0.1'),
			 (302,'filter {

		   split {
			  field => "message"
			  terminator => "<utm-log-separator>"
		   }

		   #Looking for datasource generated by an agent and parse original message
		   if [message]=~/\[utm_stack_agent_ds=(.+)\]-(.+)/ {
			grok {
			  match => {
				"message" => [ "\[utm_stack_agent_ds=%{DATA:dataSource}\]-%{GREEDYDATA:original_log_message}" ]
			  }
			}
		   }
		   if [original_log_message] {
			mutate {
			  update => { "message" => "%{[original_log_message]}" }
			}
		   }

		#......................................................................#
		# Cisco Meraki bassed on https://documentation.meraki.com/General_Administration/Monitoring_and_Reporting/Syslog_Event_Types_and_Log_Samples (january 2022)
		# https://documentation.cysiv.com/articles/#!data-source-onboarding-device-configuration-reference/cisco-meraki-reference-information-and-cim-mapping
		# Filter version 2.0.1

		#First identify meraki messages
		   if [message] and ([message]=~/\b((ANB)_)?(MX|MR)(\d){2} (events|flows|urls|ids-alerts|security_event)\b/
		   or [message]=~/\b(MS)(\d){3}_(\d){1,2}P (events|flows|urls|ids-alerts|security_event)\b/
		   or ("signature" in [message] and "priority" in [message] and "timestamp" in [message]
		   and "dhost" in [message] and "direction" in [message] and "protocol" in [message]
		   and "src" in [message] and "dst" in [message])
		   or ("url" in [message] and "src" in [message] and "dst" in [message]
		   and "mac" in [message] and "name" in [message] and "disposition" in [message]
		   and "action" in [message])
		   or ([message]=~/\b(?:[+-]?(?:[0-9]+))\.(?:[+-]?(?:[0-9]+))\slabs_appliance events Site-to-site VPN\b/)
		   or ([message]=~/\b(?:[+-]?(?:[0-9]+))\.(?:[+-]?(?:[0-9]+))\slabs_Z1 events Site-to-site VPN\b/)
		   or ("airmarshal_events" in [message] and "type" in [message] and "ssid" in [message]
		   and "bssid" in [message] and "src" in [message] and "dst" in [message]
		   and (("wired_mac" in [message]) or ("vap" in [message] and "rssi" in [message])) )
		   or [message]=~/\b(?:[+-]?(?:[0-9]+))\.(?:[+-]?(?:[0-9]+)) ((\w|-)+) (events|flows|urls|ids-alerts|security_event)\b/ ) {

		#......................................................................#
		#Using grok to parse priority if present
				grok {
				  match => {
				   "message" => [ "(<%{NUMBER:priority}>)?%{GREEDYDATA:meraki_msg_init}" ]
				  }
				}
		#......................................................................#
		#Using grok to parse date and ip or host if present
			  if [meraki_msg_init] {
				grok {
				  match => {
				   "meraki_msg_init" => [
				   "(%{CISCOTIMESTAMP:fecha})?(\s)?(%{IPORHOST:ciscoDataSource})?(\s)?(:)?(\s)?%{GREEDYDATA:meraki_message}"
				   ]
				  }
				}
			  }
		#......................................................................#
		#Generating dataSource field required by CurrelationRulesEngine
		#Checks if ciscoDataSource exists, if true, the dataSource field take its "valid" value, if not, take the agent dataSource value

		 if ([ciscoDataSource]){
			  if !([ciscoDataSource]=~/^((\d)+)$/) {
				#For cases when ciscoDataSource is a number only, and not IPORHOST
				#because the log is like: <166>1 1380653443.857790533 FFF_MX events ...
				#in the case above (1) match with IPORHOST pattern
				if [dataSource] {
				  mutate {
					update => { "dataSource" => "%{[ciscoDataSource]}" }
				  }
				} else {
				  mutate {
					add_field => { "dataSource" => "%{ciscoDataSource}" }
				  }
				}
			  }
		 }
		#Finally evaluates to the host variable if can not be calculated
		 if ![dataSource] {
			mutate {
			   add_field => { "dataSource" => "%{host}" }
			 }
		 }

		#......................................................................#
		#Generating dataType field required by CurrelationRulesEngine
			mutate {
			 add_field => { "dataType" => "firewall-meraki" }
			}
		#......................................................................#
		#Begin to parse messages
		#......................................................................#
		# generic event	parsing
			if [meraki_message] {
				grok {
					match => {
						"meraki_message" => [
						"(%{GREEDYDATA:irrelevant} %{IPORHOST:msg_src_ip} %{INT:msg_src_port}(\s))?%{DATA:msg_event_time} %{DATA:msg_mx_type} (?<msg_mx_group>((events|flows|urls|ids-alerts|security_event))) %{GREEDYDATA:generic_event}"
						]
					}
				}
			}
			if [generic_event] {
		# event vpn connectivity change
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} vpn_type(\s)?=(\s)?''%{DATA:vpn_type}'' peer_contact(\s)?=(\s)?''%{IPORHOST:src_ip}(\s)?:(\s)?%{INT:src_port}'' peer_ident(\s)?=(\s)?''%{GREEDYDATA:peer_ident}'' connectivity(\s)?=(\s)?''%{WORD:connectivity}''"
						]
					}
				}
				#Add action field when connection seems to be established
				if [connectivity] and [connectivity] == "true" {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
		#......................................................................#
		# event uplink connectivity change
			if "failover to" in [generic_event] {
				grok {
					match => {
						"generic_event" => [
						"%{GREEDYDATA:event_type}"
						]
					}
				}
			}else if [generic_event]=~/\bCellular connection (up|Up|down|Down)(\s)?(?:[+-]?(?:[0-9]+))\.(?:[+-]?(?:[0-9]+))\b/ {
				# Event: urls, HTTP GET requests in MR Access Points
				grok {
					match => {
						"generic_event" => [
						"Cellular connection (?<mx_conn_state>(up|Up|down|Down))(\s)?%{DATA:event_time} %{WORD:mx_type} (?<mx_group>((events|flows|urls|ids-alerts|security_event))) src(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?%{INT:src_port} dst(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?%{INT:dst_port} mac(\s)?=(\s)?%{GREEDYDATA:mac} request(\s)?:(\s)?%{WORD:method} %{GREEDYDATA:url}"
						]
					}
				}
				#Add action field when connection seems to be established
				if [mx_conn_state] and [mx_conn_state] =~/\b(up|Up)\b/ {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
			}else if [generic_event]=~/\bCellular connection (up|Up|down|Down)\b/ {
				grok {
					match => {
						"generic_event" => [
						"%{GREEDYDATA:event_type}"
						]
					}
				}
				#Add action field when connection seems to be established
				if [generic_event] =~/\b(up|Up)\b/ {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
			}
		#......................................................................#
		# Event: event, dhcp no offers
			if "dhcp no offers" in [generic_event] {
				grok {
					match => {
						"generic_event" => [
						"%{DATA:event_type} for mac %{GREEDYDATA:mac} host(\s)?=(\s)?%{IPORHOST:src_ip}%{GREEDYDATA:irrelevant}?"
						]
					}
				}
			}
		#......................................................................#
		# Event: event, dhcp lease
			if "dhcp lease" in [generic_event] {
				grok {
					match => {
						"generic_event" => [
						"%{DATA:event_type} of ip %{IPORHOST:src_ip} from server mac %{GREEDYDATA:server_mac} for client mac %{GREEDYDATA:client_mac} from router %{IPORHOST:router_ip} on subnet %{IPORHOST:subnet} with dns %{IPORHOST:dns}(\s)?,(\s)?%{IPORHOST:dns}%{GREEDYDATA:irrelevant}?"
						]
					}
				}
				#Add action field when connection seems to be established
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
		#......................................................................#
		# Event: event, HTTP GET requests in Meraki MX Security Appliance
			if [msg_mx_group] and ([msg_mx_group]=="urls" and [generic_event]=~/^(src)(.)+/ and "dst" in [generic_event]
			and "mac" in [generic_event] and "request" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"src(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?%{INT:src_port} dst(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?%{INT:dst_port} mac(\s)?=(\s)?%{GREEDYDATA:client_mac} request(\s)?:(\s)?%{WORD:method} %{GREEDYDATA:url}"
						]
					}
				}
				#Add action field when connection seems to be established
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
		#......................................................................#
		# Event: flows, IP session initiated in Meraki MX Security Appliance
			if [msg_mx_group] and ([msg_mx_group]=="flows" and [generic_event]=~/^(src)(.)+/ and "dport" in [generic_event]
			and "protocol" in [generic_event] and "sport" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"src(\s)?=(\s)?%{IPORHOST:src_ip} dst(\s)?=(\s)?%{IPORHOST:dst_ip} mac(\s)?=(\s)?%{GREEDYDATA:mac} protocol(\s)?=(\s)?%{DATA:protocol} sport(\s)?=(\s)?%{INT:src_port} dport(\s)?=(\s)?%{INT:dst_port} pattern:%{GREEDYDATA:pattern}",
						"src(\s)?=(\s)?%{IPORHOST:src_ip} dst(\s)?=(\s)?%{IPORHOST:dst_ip} protocol(\s)?=(\s)?%{DATA:protocol} sport(\s)?=(\s)?%{INT:src_port} dport(\s)?=(\s)?%{INT:dst_port} pattern:%{GREEDYDATA:pattern}"
						]
					}
				}
				#Add action field when connection seems to be established
				if [pattern] and ([pattern] =~/^((\s)?(0|allow|Allow))/ ) {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
			}
		#......................................................................#
		# Event: ids-alerts, ids signature matched in Meraki MX Security Appliance
			if [msg_mx_group] and ([msg_mx_group]=="ids-alerts" and [generic_event]=~/^(signature)(.)+/ and "priority" in [generic_event]
			and "timestamp" in [generic_event] and "direction" in [generic_event] and "protocol" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"signature(\s)?=(\s)?%{GREEDYDATA:signature} priority(\s)?=(\s)?%{INT:evt_priority} timestamp(\s)?=(\s)?%{GREEDYDATA:irrelevant} direction(\s)?=(\s)?%{WORD:direction} protocol(\s)?=(\s)?%{DATA:protocol} src(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?%{INT:src_port}(%{GREEDYDATA:irrelevant})?"
						]
					}
				}
				#In this case even if the connection was established, the action wasnt created because this event is already detected by alerts
			}
		#......................................................................#
		# Event: event IPsec-SA request queued due to no phase 1 found, phase2 negotiation failed, initiate new phase 1 negotiation,
		# ISAKMP-SA established, initiate new phase 2 negotiation, IPsec-SA established, ISAKMP-SA established, and ISAKMP-SA deleted
		# in Meraki MX Security Appliance
		# This type of message mx_type=labs_appliance mx_group=events
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(Site)(.)+/ ) {
				grok {
					match => {
						"generic_event" => [
						"Site-to-site VPN(\s)?:(\s)?%{GREEDYDATA:irrelevant} (deleted|established) %{IPORHOST:src_ip}(\s)?\[(\s)?%{INT:src_port}(\s)?\](\s)?-(\s)?%{IPORHOST:dst_ip}(\s)?\[(\s)?%{INT:dst_port}(\s)?\] spi(\s)?:(\s)?%{GREEDYDATA:spi}",
						"Site-to-site VPN(\s)?:(\s)?%{GREEDYDATA:irrelevant} request for %{IPORHOST:src_ip} queued due to no %{GREEDYDATA:irrelevant} found",
						"Site-to-site VPN(\s)?:(\s)?%{GREEDYDATA:irrelevant} negotiation failed due to time up waiting for %{GREEDYDATA:irrelevant}.(\s)?ESP %{IPORHOST:src_ip}(\s)?\[(\s)?%{INT:src_port}(\s)?\](\s)?->(\s)?%{IPORHOST:dst_ip}(\s)?\[(\s)?%{INT:dst_port}(\s)?\](%{GREEDYDATA:irrelevant})?",
						"Site-to-site VPN(\s)?:(\s)?%{GREEDYDATA:irrelevant} negotiation(\s)?:(\s)?%{IPORHOST:src_ip}(\s)?\[(\s)?%{INT:src_port}(\s)?\](\s)?<=>(\s)?%{IPORHOST:dst_ip}(\s)?\[(\s)?%{INT:dst_port}(\s)?\](%{GREEDYDATA:irrelevant})?",
						"Site-to-site VPN(\s)?:(\s)?%{GREEDYDATA:irrelevant} established:(\s)?ESP/Tunnel %{IPORHOST:src_ip}(\s)?\[(\s)?%{INT:src_port}(\s)?\](\s)?->(\s)?%{IPORHOST:dst_ip}(\s)?\[(\s)?%{INT:dst_port}(\s)?\] spi(\s)?=(\s)?%{GREEDYDATA:spi}"
						]
					}
				}
				#Add action field when connection seems to be established
				if "queued due to no phase 1" in [generic_event] or "queued due to no phase1" in [generic_event] or "Site-to-site VPN: failed" in [generic_event] {
					#No action
				} else {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
			}
		#......................................................................#
		# Event: event spanning-tree guard state change in Meraki MS Switches
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(Port)(.)+/ ) {
				grok {
					match => {
						"generic_event" => [
						"Port %{INT:src_port} received an %{DATA:protocol} BPDU from %{GREEDYDATA:mac} so the port was %{GREEDYDATA:mx_action}"
						]
					}
				}
			}
		#......................................................................#
		# Event: event blocked DHCP server response in Meraki MS Switches
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(Blocked)(.)+/ ) {
				grok {
					match => {
						"generic_event" => [
						"Blocked %{DATA:protocol} server response from %{GREEDYDATA:mac} on VLAN %{GREEDYDATA:vlan}"
						]
					}
				}
			}
		#......................................................................#
		# Event: event 802.1X (all events) in Meraki MS Switches
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(type)(.)+/ and "port" in [generic_event] and "identity" in [generic_event] ){
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} port(\s)?=(\s)?(''''|''%{INT:src_port}'') identity(\s)?=(\s)?''%{GREEDYDATA:identity}''(%{GREEDYDATA:irrelevant})?"
						]
					}
				}
				#In this case even if the connection was established, the action wasnt created because dont have any ip address
			}
		#......................................................................#
		# Event: event 802.11 disassociation in Meraki MR Access Points
			if [msg_mx_group] and ( [msg_mx_group]=="events" and [generic_event]=~/^(type)(.)+/ and "radio" in [generic_event] and "channel" in [generic_event]
			and "auth_neg_dur" in [generic_event] and "last_auth_ago" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} radio(\s)?=(\s)?''%{INT:radio}'' vap(\s)?=(\s)?''%{INT:vap}'' channel(\s)?=(\s)?''%{INT:channel}'' reason(\s)?=(\s)?''%{GREEDYDATA:reason}'' instigator(\s)?=(\s)?''%{GREEDYDATA:instigator}'' duration(\s)?=(\s)?''%{GREEDYDATA:duration}'' auth_neg_dur(\s)?=(\s)?''%{GREEDYDATA:auth_neg_dur}'' last_auth_ago(\s)?=(\s)?''%{GREEDYDATA:last_auth_ago}'' is_wpa(\s)?=(\s)?''%{GREEDYDATA:is_wpa}'' full_conn(\s)?=(\s)?''%{GREEDYDATA:full_conn}'' ip_resp(\s)?=(\s)?''%{GREEDYDATA:ip_resp}'' ip_src(\s)?=(\s)?''%{GREEDYDATA:src_ip}'' arp_resp(\s)?=(\s)?''%{GREEDYDATA:arp_resp}'' arp_src(\s)?=(\s)?''%{GREEDYDATA:arp_src}'' dns_server(\s)?=(\s)?''%{GREEDYDATA:dns}'' dns_req_rtt(\s)?=(\s)?''%{GREEDYDATA:dns_req_rtt}'' dns_resp(\s)?=(\s)?''%{GREEDYDATA:dns_resp}'' aid(\s)?=(\s)?''%{GREEDYDATA:aid}''"
						]
					}
				}
				#Add action field when connection seems to be established
				mutate {
					add_field => { "[logx][utm][action]" => "Success" }
				}
			}
		#......................................................................#
		# Event: event 802.1X (all events) in Meraki MR Access Points
			if [msg_mx_group] and ( [msg_mx_group]=="events" and [generic_event]=~/^(type)(.)+/ and "radio" in [generic_event] and "vap" in [generic_event]
			and "identity" in [generic_event] and "aid" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} radio(\s)?=(\s)?''%{INT:radio}'' vap(\s)?=(\s)?''%{INT:vap}'' identity(\s)?=(\s)?''%{GREEDYDATA:identity}'' aid(\s)?=(\s)?''%{GREEDYDATA:aid}''"
						]
					}
				}
				#In this case even if the connection was established, the action wasnt created because dont have any ip address
			}
		#......................................................................#
		# Event: event splash authentication in Meraki MR Access Points
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(type)(.)+/ and "ip" in [generic_event] and "vap" in [generic_event]
			and "duration" in [generic_event] and "download" in [generic_event] and "upload" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} ip(\s)?=(\s)?''%{GREEDYDATA:src_ip}'' duration(\s)?=(\s)?''%{GREEDYDATA:duration}'' vap(\s)?=(\s)?''%{GREEDYDATA:vap}'' download(\s)?=(\s)?''%{GREEDYDATA:download}'' upload(\s)?=(\s)?''%{GREEDYDATA:upload}''"
						]
					}
				}
				#Add action field when connection seems to be established
				mutate {
					add_field => { "[logx][utm][action]" => "Success" }
				}
			}
		#......................................................................#
		# Event: event wireless packet flood detected in Meraki MR Access Points
			if [msg_mx_group] and ([msg_mx_group]=="events" and [generic_event]=~/^(type)(.)+/ and "packet" in [generic_event] and "device" in [generic_event]
			and "state" in [generic_event] and "alarm_id" in [generic_event] and "dos_count" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"type(\s)?=(\s)?%{DATA:event_type} packet(\s)?=(\s)?''%{GREEDYDATA:packet}'' device(\s)?=(\s)?''%{GREEDYDATA:device}'' radio(\s)?=(\s)?''%{INT:radio}'' state(\s)?=(\s)?''%{GREEDYDATA:state}'' alarm_id(\s)?=(\s)?''%{GREEDYDATA:alarm_id}'' dos_count(\s)?=(\s)?''%{GREEDYDATA:dos_count}'' inter_arrival(\s)?=(\s)?''%{GREEDYDATA:inter_arrival}''"
						]
					}
				}
			}
		#......................................................................#
		# Event: flows, flow allowed by Layer 3 firewall in Meraki MR Access Points
			if [msg_mx_group] and ([msg_mx_group]=="flows" and [generic_event]=~/^(deny|allow)(.)+/ and "src" in [generic_event] and "dst" in [generic_event]
			and "mac" in [generic_event] and "sport" in [generic_event] and "dport" in [generic_event] ) {
				grok {
					match => {
						"generic_event" => [
						"%{WORD:mx_action} src(\s)?=(\s)?%{IPORHOST:src_ip} dst(\s)?=(\s)?%{IPORHOST:dst_ip} mac(\s)?=(\s)?%{GREEDYDATA:mac} protocol(\s)?=(\s)?%{DATA:protocol} sport(\s)?=(\s)?%{INT:src_port} dport(\s)?=(\s)?%{INT:dst_port}"
						]
					}
				}
				#Add action field when connection seems to be established
				if [mx_action] and [mx_action] =~/\b(allow)\b/ {
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
				}
			}
		  }
		#......................................................................#
		# Event: event rogue SSID detected and SSID spoofing detected in Meraki MR Access Points
		# This type of message dont have the header INT.INT mx_type mx_group, so we search for fields
			if (![generic_event] and [meraki_message]) and [meraki_message]=~/^(airmarshal_events)(.)+/ and ("type" in [meraki_message] and "ssid" in [meraki_message]
			and "bssid" in [meraki_message] and "src" in [meraki_message] and "dst" in [meraki_message]
			and (("wired_mac" in [meraki_message]) or ("vap" in [meraki_message] and "rssi" in [meraki_message])) ) {
				grok {
					match => {
						"meraki_message" => [
						"airmarshal_events type(\s)?=(\s)?%{DATA:event_type} ssid(\s)?=(\s)?''(%{DATA:ssid})?'' bssid(\s)?=(\s)?''(%{GREEDYDATA:bssid})?'' src(\s)?=(\s)?''(%{GREEDYDATA:src_mac})?'' dst(\s)?=(\s)?''(%{GREEDYDATA:dst_mac})?'' wired_mac(\s)?=(\s)?''(%{GREEDYDATA:wired_mac})?'' vlan_id(\s)?=(\s)?''(%{INT:vlan_id})?'' channel(\s)?=(\s)?''(%{INT:channel})?'' rssi(\s)?=(\s)?''(%{INT:rssi})?'' fc_type(\s)?=(\s)?''(%{INT:fc_type})?'' fc_subtype(\s)?=(\s)?''(%{INT:fc_subtype})?''",
						"airmarshal_events type(\s)?=(\s)?%{DATA:event_type} ssid(\s)?=(\s)?''(%{DATA:ssid})?'' vap(\s)?=(\s)?''(%{INT:vap})?'' bssid(\s)?=(\s)?''(%{GREEDYDATA:bssid})?'' src(\s)?=(\s)?''(%{GREEDYDATA:src_mac})?'' dst(\s)?=(\s)?''(%{GREEDYDATA:dst_mac})?'' channel(\s)?=(\s)?''(%{INT:channel})?'' rssi(\s)?=(\s)?''(%{INT:rssi})?'' fc_type(\s)?=(\s)?''(%{INT:fc_type})?'' fc_subtype(\s)?=(\s)?''(%{INT:fc_subtype})?''"
						]
					}
				}
				#In this case even if the connection was established, the action wasnt created because this event is already detected by alerts
			}
		#......................................................................#
		# Event: security_event ids_alerted, ids signature matched in Meraki MX Security Appliance
		# This type of message dont have the header INT.INT mx_type mx_group, so we search for fields
			if (![generic_event] and [meraki_message]) and ("signature" in [meraki_message] and "priority" in [meraki_message] and "timestamp" in [meraki_message]
			and "dhost" in [meraki_message] and "direction" in [meraki_message] and "protocol" in [meraki_message]
			and "src" in [meraki_message] and "dst" in [meraki_message]) {
				grok {
					match => {
						"meraki_message" => [
						"signature(\s)?=(\s)?%{GREEDYDATA:signature} priority(\s)?=(\s)?%{INT:evt_priority} timestamp(\s)?=(\s)?%{DATA:event_time} dhost(\s)?=(\s)?%{GREEDYDATA:mac} direction(\s)?=(\s)?%{WORD:direction} protocol(\s)?=(\s)?%{DATA:protocol} src(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?%{INT:src_port} dst(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?%{INT:dst_port} message:%{GREEDYDATA:irrelevant}"
						]
					}
				}
				#In this case even if the connection was established, the action wasnt created because this event is already detected by alerts
			}

		#Formatting number values
		   mutate {
			  convert => {
					"src_port" => "integer"
					"dst_port" => "integer"
					"evt_priority" => "integer"
					"priority" => "integer"
					"radio" => "integer"
					"vap" => "integer"
					"channel" => "integer"
					"rssi" => "integer"
					"vlan_id" => "integer"
					"fc_type" => "integer"
					"fc_subtype" => "integer"
				}
		   }
		#......................................................................#
		#First search if some fields are already in the generic message, if not we try to capture from the header of the entire message
		#Remember, the header is (something like part of a date) msg_src_ip msg_src_port event_time mx_type mx_group in meraki_message field
		#Then add all possible fields to the json tree structure
		   if ![src_ip] and [msg_src_ip] {
				mutate { add_field => { "src_ip" => "%{[msg_src_ip]}" }}
				if ![src_port] and [msg_src_port] {
					mutate { add_field => { "src_port" => "%{[msg_src_port]}" }}
				}
		   }
		   if ![event_time] and [msg_event_time] {
				mutate { add_field => { "event_time" => "%{[msg_event_time]}" }}
		   }
		   if ![mx_type] and [msg_mx_type] {
				mutate { add_field => { "mx_type" => "%{[msg_mx_type]}" }}
		   }
		   if ![mx_group] and [msg_mx_group] {
				mutate { add_field => { "mx_group" => "%{[msg_mx_group]}" }}
		   }

		   mutate {
			  rename => { "message" => "[logx][meraki][message]" }
			  rename => { "event_time" => "[logx][meraki][event_time]" }
			  rename => { "priority" => "[logx][meraki][priority]" }
			  rename => { "event_parse_id" => "[logx][meraki][event_parse_id]" }
			  rename => { "mx_group" => "[logx][meraki][mx_group]" }
			  rename => { "mx_type" => "[logx][meraki][mx_type]" }

			  #New fields from event vpn connectivity change
			  rename => { "event_type" => "[logx][meraki][event_type]" }
			  rename => { "vpn_type" => "[logx][meraki][vpn_type]" }
			  rename => { "src_ip" => "[logx][meraki][src_ip]" }
			  rename => { "src_port" => "[logx][meraki][src_port]" }
			  rename => { "peer_ident" => "[logx][meraki][peer_ident]" }
			  rename => { "connectivity" => "[logx][meraki][connectivity]" }
			  rename => { "mx_conn_state" => "[logx][meraki][mx_conn_state]" }

			  #New fields from dhcp events
			  rename => { "mac" => "[logx][meraki][mac]" }
			  rename => { "server_mac" => "[logx][meraki][server_mac]" }
			  rename => { "client_mac" => "[logx][meraki][client_mac]" }
			  rename => { "router_ip" => "[logx][meraki][router_ip]" }
			  rename => { "subnet" => "[logx][meraki][subnet]" }
			  rename => { "dns" => "[logx][meraki][dns]" }

			  #New fields from event HTTP GET requests in Meraki MX Security Appliance
			  rename => { "dst_ip" => "[logx][meraki][dest_ip]" }
			  rename => { "dst_port" => "[logx][meraki][dest_port]" }
			  rename => { "method" => "[logx][meraki][method]" }
			  rename => { "url" => "[logx][meraki][url]" }

			  #New fields from flows, IP session initiated
			  rename => { "protocol" => "[logx][meraki][proto]" }
			  rename => { "pattern" => "[logx][meraki][pattern]" }

			  #New fields from ids-alerts, ids signature matched
			  rename => { "signature" => "[logx][meraki][signature]" }
			  rename => { "evt_priority" => "[logx][meraki][evt_priority]" }
			  rename => { "direction" => "[logx][meraki][direction]" }

			  #New fields from events, IPsec-SA and ISAKMP-SA
			  rename => { "spi" => "[logx][meraki][spi]" }

			  #New fields from events spanning-tree guard state change in Meraki MS Switches
			  rename => { "mx_action" => "[logx][meraki][mx_action]" }

			  #New fields from events blocked DHCP server response in Meraki MS Switches
			  rename => { "vlan" => "[logx][meraki][vlan]" }

			  #New fields from events 802.1X (all events) in Meraki MS Switches
			  rename => { "identity" => "[logx][meraki][identity]" }

			  #New fields from events 802.11 disassociation in Meraki MR Access Points
			  rename => { "radio" => "[logx][meraki][radio]" }
			  rename => { "vap" => "[logx][meraki][vap]" }
			  rename => { "channel" => "[logx][meraki][channel]" }
			  rename => { "instigator" => "[logx][meraki][instigator]" }
			  rename => { "auth_neg_dur" => "[logx][meraki][auth_neg_dur]" }
			  rename => { "last_auth_ago" => "[logx][meraki][last_auth_ago]" }
			  rename => { "is_wpa" => "[logx][meraki][is_wpa]" }
			  rename => { "full_conn" => "[logx][meraki][full_conn]" }
			  rename => { "ip_resp" => "[logx][meraki][ip_resp]" }
			  rename => { "arp_resp" => "[logx][meraki][arp_resp]" }
			  rename => { "arp_src" => "[logx][meraki][arp_src]" }
			  rename => { "dns_req_rtt" => "[logx][meraki][dns_req_rtt]" }
			  rename => { "dns_resp" => "[logx][meraki][dns_resp]" }
			  rename => { "aid" => "[logx][meraki][aid]" }
			  rename => { "reason" => "[logx][meraki][reason]" }
			  rename => { "duration" => "[logx][meraki][duration]" }

			  #New fields from events splash authentication in Meraki MR Access Points
			  rename => { "download" => "[logx][meraki][download]" }
			  rename => { "upload" => "[logx][meraki][upload]" }

			  #New fields from event wireless packet flood detected in Meraki MR Access Points
			  rename => { "packet" => "[logx][meraki][packet]" }
			  rename => { "device" => "[logx][meraki][device]" }
			  rename => { "state" => "[logx][meraki][state]" }
			  rename => { "alarm_id" => "[logx][meraki][alarm_id]" }
			  rename => { "dos_count" => "[logx][meraki][dos_count]" }
			  rename => { "inter_arrival" => "[logx][meraki][inter_arrival]" }

			  #New fields from event rogue SSID detected and SSID spoofing detected in Meraki MR Access Points
			  rename => { "ssid" => "[logx][meraki][ssid]" }
			  rename => { "bssid" => "[logx][meraki][bssid]" }
			  rename => { "src_mac" => "[logx][meraki][src_mac]" }
			  rename => { "dst_mac" => "[logx][meraki][dst_mac]" }
			  rename => { "rssi" => "[logx][meraki][rssi]" }
			  rename => { "fc_type" => "[logx][meraki][fc_type]" }
			  rename => { "fc_subtype" => "[logx][meraki][fc_subtype]" }
			  rename => { "vlan_id" => "[logx][meraki][vlan_id]" }
			  rename => { "wired_mac" => "[logx][meraki][wired_mac]" }
		   }

		   #Finally, remove unnecessary fields
		   mutate {
			  remove_field => ["@version","fecha","path","meraki_msg_init","irrelevant","tags","msg_src_ip","msg_src_port",
			  "msg_event_time","msg_mx_type","msg_mx_group","generic_event","meraki_message","ciscoDataSource"]
		   }
		   }
		   #Also, remove unwanted fields if the message not match with conditions
		   mutate {
			  remove_field => ["original_log_message","headers"]
		   }
		}
		','cisco-meraki',NULL,true,'MERAKI',false,'2.0.1'),
			 (303,'filter {

		   split {
			  field => "message"
			  terminator => "<utm-log-separator>"
		   }

		   #Looking for datasource generated by an agent and parse original message
		   if [message]=~/\[utm_stack_agent_ds=(.+)\]-(.+)/ {
			grok {
			  match => {
				"message" => [ "\[utm_stack_agent_ds=%{DATA:dataSource}\]-%{GREEDYDATA:original_log_message}" ]
			  }
			}
		   }
		   if [original_log_message] {
			mutate {
			  update => { "message" => "%{[original_log_message]}" }
			}
		   }

		   if [message] and "%FTD-" in [message] {
		#......................................................................#
		#Filter version 2.0.1
		# Cisco Firepower bassed on https://www.cisco.com/c/en/us/td/docs/security/firepower/Syslogs/b_fptd_syslog_guide.html (january 2022)
		#Using grok to parse priority if present
			  grok {
			   match => {
				"message" => [
				  "(<%{NUMBER:priority}>)?%{GREEDYDATA:cisco_msg_init}"
				]
			   }
			  }
		#......................................................................#
		#Using grok to parse date and ip or host if present
		  if [cisco_msg_init]{
			 grok {
			  match => {
			   "cisco_msg_init" => [
				 "%{CISCOTIMESTAMP:fecha} (%{IPORHOST:ciscoDataSource})?(:)? %{GREEDYDATA:cisco_message}"
			   ]
			  }
			 }
		  }
		#......................................................................#
		#Generating dataSource field required by CurrelationRulesEngine
		#Checks if ciscoDataSource exists, if true, the dataSource field take its value, if not, take the agent dataSource value
		 if ([ciscoDataSource]){
				if [dataSource] {
				  mutate {
					update => { "dataSource" => "%{[ciscoDataSource]}" }
				  }
				} else {
				  mutate {
					add_field => { "dataSource" => "%{ciscoDataSource}" }
				  }
				}
		 }
		#Finally evaluates to the host variable if can not be calculated
		 if ![dataSource] {
			mutate {
			   add_field => { "dataSource" => "%{host}" }
			 }
		 }

		#......................................................................#
		#Generating dataType field required by CurrelationRulesEngine
		   mutate {
			 add_field => {
			   "dataType" => "firewall-cisco-firepower"
			 }
		   }
		#......................................................................#
		#Using grok to parse Firepower severity and message ID
			if [cisco_message]{
				grok {
					match => {
						"cisco_message" => [
						"%%{GREEDYDATA:cisco_tag}-%{INT:severity}-%{INT:messageid}: %{GREEDYDATA:cisco_msg}"
						]
					}
				}
			}
		#......................................................................#
		#Begin Firepower message processing by ID based on https://www.cisco.com/c/en/us/td/docs/security/firepower/Syslogs/b_fptd_syslog_guide.html (january 2022)
		if [messageid] and [cisco_msg]{
			#......................................................................#
			#FTD-2-106001
			if [messageid]=="106001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:direction} %{WORD:protocol} connection %{WORD:cisco_action} from %{IP:src_ip}/%{INT:src_port} to %{IP:dst_ip}/%{INT:dst_port} flags %{GREEDYDATA:tcp_flags} on interface %{GREEDYDATA:src_interface}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-2-106017
			if [messageid]=="106017" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} IP due to %{GREEDYDATA:event_description} from %{GREEDYDATA:src_ip} to %{IPORHOST:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-2-106101
			if [messageid]=="106101" {
					grok {
						match => {
							"cisco_msg" => [
							"Number of cached %{GREEDYDATA:cisco_action} for ACL log has reached limit(\s)?\(%{INT:num_flows}(\s)?\)%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#FTD-6-106102,106103
			if [messageid]=="106102" or [messageid]=="106103"{
					grok {
						match => {
							"cisco_msg" => [
							"access-list %{GREEDYDATA:access_list} %{WORD:cisco_action} %{WORD:protocol} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{DATA:src_interface}/%{IPORHOST:src_ip}(\s)?\((\s)?%{INT:src_port}(\s)?\)(\s)?->(\s)?%{DATA:dst_interface}/%{IPORHOST:dst_ip}(\s)?\((\s)?%{INT:dst_port}(\s)?\) hit-cnt %{INT:hit_count} %{GREEDYDATA:irrelevant}",
							"access-list %{GREEDYDATA:access_list} %{WORD:cisco_action} %{WORD:protocol} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{DATA:src_interface}/%{IPORHOST:src_ip} %{INT:src_port} %{DATA:dst_interface}/%{IPORHOST:dst_ip} %{INT:dst_port} hit-cnt %{INT:hit_count} %{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [cisco_action]{
						if [cisco_action] =~/(Permitted|permitted)/ {
							mutate {
								add_field => { "[logx][utm][action]" => "Success" }
							}
						}
					}
			}
			#......................................................................#
			#FTD-109101,109102,109103
			if [messageid]=="109101" or [messageid]=="109102" or [messageid]=="109103"{
					grok {
						match => {
							"cisco_msg" => [
							"Received CoA %{WORD:cisco_action} request from %{IPORHOST:src_ip} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), with audit-session-id: %{GREEDYDATA:audit_session_id}",
							"Received CoA %{WORD:cisco_action} from %{IPORHOST:src_ip}, but cannot find named session %{GREEDYDATA:audit_session_id}",
							"CoA %{WORD:cisco_action} from %{IPORHOST:src_ip} failed for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), with session ID: %{GREEDYDATA:audit_session_id}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-109201 to 109213
			if [messageid]>="109201" and [messageid]<="109213"{
					grok {
						match => {
							"cisco_msg" => [
							"UAUTH(:)? Session(\s|=)%{GREEDYDATA:session}, User(\s|=)(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}), Assigned IP(\s|=)%{IPORHOST:src_ip}, %{GREEDYDATA:cisco_action}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113004
			if [messageid]=="113004"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user %{WORD:aaa_type} Successful : server = %{IPORHOST:src_ip} : user = %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113005
			if [messageid]=="113005"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user authentication Rejected(\s)?:(\s)?reason(\s)?=(\s)?%{DATA:reason}(\s)?:(\s)?(server|Server)(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?(User|user)(\s)?=(\s)?%{DATA:src_fwuser}(\s)?:(\s)?(User|user) IP(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113008
			if [messageid]=="113008"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA transaction status ACCEPT(\s)?:(\s)?(user|User)(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113009
			if [messageid]=="113009"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA retrieved default group policy \(%{GREEDYDATA:policy}\) for (user|User)(\s)?=(\s)?%{GREEDYDATA:src_fwuser}",
							"AAA retrieved default group policy %{GREEDYDATA:policy} for (user|User) %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113010
			if [messageid]=="113010"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA challenge received for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) from server %{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113011
			if [messageid]=="113011"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA retrieved user specific group policy %{GREEDYDATA:policy} for user %{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113012
			if [messageid]=="113012"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA user authentication Successful(\s)?: local database(\s)?: user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113013
			if [messageid]=="113013"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA unable to complete the request Error(\s)?:(\s)?reason(\s)?=(\s)?%{GREEDYDATA:reason}:(\s)?user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113014
			if [messageid]=="113014"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA authentication server not accessible(\s)?: server(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?:(\s)?user(\s)?=(\s)?%{GREEDYDATA:src_fwuser}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113015, 113017
			if [messageid]=="113015" or [messageid]=="113017"{
					grok {
						match => {
							"cisco_msg" => [
							"(AAA user authentication Rejected|AAA credentials rejected)(\s)?: reason(\s)?=(\s)?%{DATA:reason}(\s)?:(\s)?local database(\s)?:(\s)?user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?:(\s)?user IP(\s)?=(\s)?%{IPORHOST:src_ip}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113016
			if [messageid]=="113016"{
					grok {
						match => {
							"cisco_msg" => [
							"AAA credentials rejected(\s)?: reason(\s)?=(\s)?%{GREEDYDATA:reason}:(\s)?server(\s)?=(\s)?%{IPORHOST:dst_ip}(\s)?:(\s)?user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?:(\s)?user IP(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-113019
			if [messageid]=="113019"{
					grok {
						match => {
							"cisco_msg" => [
							"Group(\s)?=(\s)?%{GREEDYDATA:group}(\s)?,(\s)?Username(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?IP(\s)?=(\s)?%{IPORHOST:src_ip}(\s)?,(\s)?Session disconnected.(\s)?Session Type:(\s)?%{GREEDYDATA:session_type}(\s)?,(\s)?Duration:(\s)?%{GREEDYDATA:duration}(\s)?,(\s)?Bytes xmt:(\s)?%{INT:bytes_xmt}(\s)?,(\s)?Bytes rcv:(\s)?%{INT:bytes_rcv}(\s)?,(\s)?Reason:(\s)?%{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-113031,113032,113033
			if [messageid]=="113031" or [messageid]=="113032" or [messageid]=="113033"{
					grok {
						match => {
							"cisco_msg" => [
							"Group %{GREEDYDATA:group} User (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} AnyConnect (vpn-filter|ipv6-vpn-filter) %{GREEDYDATA:filter} is an (IPv6|IPv4) ACL; ACL not applied.",
							"Group %{GREEDYDATA:group} User (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} AnyConnect session not allowed.(\s)?ACL parse error."
							]
						}
					}
			}
			#......................................................................#
			#FTD-113034,113035,113036,113038,113039
			if [messageid]>="113034" and [messageid]<="113039" and [messageid]!="113037"{
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP (<%{IPORHOST:src_ip}>|%{IPORHOST:src_ip}) %{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [messageid] != "113036" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-113042
			if [messageid]=="113042"{
					grok {
						match => {
							"cisco_msg" => [
							"CoA: Non-HTTP connection from %{GREEDYDATA:src_interface}(\s)?:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}(\s)?:(\s)?%{IPORHOST:dst_ip}(\s)?/%{INT:dst_port} for user (''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) at %{IPORHOST:client_ip} %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-201003
			if [messageid]=="201003"{
					grok {
						match => {
							"cisco_msg" => [
							"Embryonic limit exceeded %{INT:num_conns}(\s)?/%{INT:limit} for %{IPORHOST:src_ip}(\s)?/%{INT:src_port} \(%{IPORHOST:global_ip}(\s)?\) %{IPORHOST:dst_ip}(\s)?/%{INT:dst_port} on interface %{GREEDYDATA:dst_interface}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-209003
			if [messageid]=="209003"{
					grok {
						match => {
							"cisco_msg" => [
							"Fragment database limit of %{INT:limit} exceeded:(\s)?src(\s)?=(\s)?%{DATA:src_ip}(\s)?,(\s)?dest(\s)?=(\s)?%{DATA:dst_ip}(\s)?,(\s)?proto(\s)?=(\s)?%{DATA:protocol}(\s)?,(\s)?id(\s)?=(\s)?%{GREEDYDATA:id}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-316001
			if [messageid]=="316001"{
					grok {
						match => {
							"cisco_msg" => [
							"Denied new tunnel to %{IPORHOST:src_ip}%{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-316002
			if [messageid]=="316002"{
					grok {
						match => {
							"cisco_msg" => [
							"VPN Handle error:(\s)?protocol=%{GREEDYDATA:protocol}(\s)?,(\s)?src %{INT:in_if_num}(\s)?:(\s)?%{IPORHOST:src_ip},(\s)?dst %{INT:out_if_num}(\s)?:(\s)?%{IPORHOST:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302003,302004
			if [messageid]=="302003" or [messageid]=="302004" {
					grok {
						match => {
							"cisco_msg" => [
							"(Built H245 connection|Pre-allocate H323 UDP backconnection) for foreign_address %{IPORHOST:src_ip}(/%{INT:src_port}|/)? (to(\s))?local_address %{IPORHOST:dst_ip}(/%{INT:dst_port}|/)?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302012
			if [messageid]=="302012"{
					grok {
						match => {
							"cisco_msg" => [
							"Pre-allocate H225 Call Signalling Connection for faddr %{GREEDYDATA:src_ip}/%{INT:src_port} to laddr %{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302013
			if [messageid]=="302013"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} (Probe)?(\s)?%{WORD:protocol} %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\(%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\((''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\((''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302014
			if [messageid]=="302014"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (Probe)?(\s)?%{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302015
			if [messageid]=="302015"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\(%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302016
			if [messageid]=="302016"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302017
			if [messageid]=="302017"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} \((\s)?%{IPORHOST:translated_src_ip}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/%{DATA:real_cid} \(%{IPORHOST:translated_dst_ip}(\s)?/%{DATA:translated_cid}\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302018
			if [messageid]=="302018"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} \((\s)?%{IPORHOST:translated_src_ip}(\s)?\)(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/%{DATA:real_cid} \(%{IPORHOST:translated_dst_ip}(\s)?/%{DATA:translated_cid}\)(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302020
			if [messageid]=="302020"{
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})/%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?gaddr %{GREEDYDATA:global_ip}/%{INT:global_port} laddr %{IPORHOST:src_ip}/%{INT:src_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? type %{INT:icmp_type} code %{INT:code}",
							"Built %{WORD:direction} %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip}) (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?gaddr %{GREEDYDATA:global_ip} laddr %{IPORHOST:src_ip} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?type %{INT:icmp_type} code %{INT:code}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302021
			if [messageid]=="302021"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})/%{INT:dst_port}(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? gaddr %{GREEDYDATA:global_ip}/%{INT:global_port} laddr %{IPORHOST:src_ip}/%{INT:src_port}(\s)?(\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))? type %{INT:icmp_type} code %{INT:code}",
							"Teardown %{WORD:protocol} connection for faddr (%{IPORHOST:dst_ip}|%{INT:dst_ip})(\s)?(\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))? gaddr %{GREEDYDATA:global_ip} laddr %{IPORHOST:src_ip} (\((\s)?(''%{DATA:dst_fwuser}''|%{DATA:dst_fwuser})(\s)?\))?(\s)?type %{INT:icmp_type} code %{INT:code}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302022,302024,302026
			if [messageid]=="302022" or [messageid]=="302024" or [messageid]=="302026" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{GREEDYDATA:role} stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(%{GREEDYDATA:irrelevant})?",
							"Built %{GREEDYDATA:role} stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?\)(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302023,302025,302027
			if [messageid]=="302023" or [messageid]=="302025" or [messageid]=="302027"{
					grok {
						match => {
							"cisco_msg" => [
							"Teardown stub %{WORD:protocol} connection for %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} duration %{GREEDYDATA:duration} forwarded bytes %{INT:bytes_xmt} %{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302033,302034
			if [messageid]=="302033" or [messageid]=="302034" {
					grok {
						match => {
							"cisco_msg" => [
							"(Pre-allocated|Unable to pre-allocate) H323 GUP Connection for faddr %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to laddr %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					if [messageid] == "302033" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-302035
			if [messageid]=="302035" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:direction} %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\(%{DATA:info_user2}\))?(%{GREEDYDATA:toEnd})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding reason and emitter user
					if [toEnd]{
						if "(" in [toEnd] {
						grok {
							match => {
								"toEnd" => [
								"(\s)?\((\s)?%{DATA:src_fwuser}(\s)?\)(%{GREEDYDATA:irrelevant})?"
								]
							}
						}
						}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","toEnd"]
					}
			}
			#......................................................................#
			#FTD-302036
			if [messageid]=="302036" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\(%{DATA:info_user2}\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt} %{GREEDYDATA:reasonToEnd}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding reason and emitter user
					if [reasonToEnd]{
						if "(" in [reasonToEnd] {
						grok {
							match => {
								"reasonToEnd" => [
								"%{GREEDYDATA:reason} \((\s)?%{DATA:src_fwuser}(\s)?\)(%{GREEDYDATA:irrelevant})?"
								]
							}
						}
						}else {
							mutate {
							add_field => { "reason" => "%{reasonToEnd}" }
							}
						}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","reasonToEnd"]
					}
			}
			#......................................................................#
			#FTD-302303
			if [messageid]=="302303" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\) to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302304
			if [messageid]=="302304" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} %{GREEDYDATA:duration},(\s)?%{INT:bytes_xmt}(\s)?,%{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-302305
			if [messageid]=="302305" {
					grok {
						match => {
							"cisco_msg" => [
							"Built %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?\((\s)?%{IPORHOST:mapped_src_ip}(\s)?/(\s)?%{INT:mapped_src_port}(\s)?\)(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?\((\s)?%{IPORHOST:mapped_dst_ip}(\s)?/(\s)?%{INT:mapped_dst_port}(\s)?\)(\s)?(\(%{DATA:info_user2}\))?(%{GREEDYDATA:irrelevant})?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2"]
					}
			}
			#......................................................................#
			#FTD-302306
			if [messageid]=="302306" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} state-bypass connection %{GREEDYDATA:connection_id} for %{DATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port}(\s)?(\(%{DATA:info_user1}\))? to %{DATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}(\s)?(\(%{DATA:info_user2}\))? duration %{GREEDYDATA:duration} bytes %{INT:bytes_xmt} %{GREEDYDATA:reason}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
					#Decoding user optional of the source interface
					if [info_user1] {
					grok {
						match => {
							"info_user1" => [
							"(\s)?%{DATA:src_fwuser}(\s)?,(\s)?%{DATA:src_fwuser}(\s)?"
							]
						}
					}
					}
					#Decoding user optional of the destination interface
					if [info_user2] {
					grok {
						match => {
							"info_user2" => [
							"(\s)?%{DATA:dst_fwuser}(\s)?,(\s)?%{DATA:dst_fwuser}(\s)?"
							]
						}
					}
					}
					#Finally deleting unnecessary fields
					mutate {
						remove_field => ["info_user1","info_user2","reasonToEnd"]
					}
			}
			#......................................................................#
			#FTD-305009
			if [messageid]=="305009" {
					grok {
						match => {
							"cisco_msg" => [
							"Built (dynamic|static) translation from %{DATA:src_interface}(\s)?(\(%{DATA:acl_name}\))?:%{IPORHOST:src_ip} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{DATA:dst_interface}(\s)?:%{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-305010
			if [messageid]=="305010" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (dynamic|static) translation from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-305011
			if [messageid]=="305011" {
					grok {
						match => {
							"cisco_msg" => [
							"Built (dynamic|static) %{WORD:protocol} translation from %{GREEDYDATA:src_interface}:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-305012
			if [messageid]=="305012" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown (dynamic|static) %{WORD:protocol} translation from %{DATA:src_interface}(\s)?(\(%{DATA:acl_name}\))?:%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} (\((\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?\))?(\s)?to %{GREEDYDATA:dst_interface}:(\s)?%{IPORHOST:dst_ip}(\s)?/(\s)?%{INT:dst_port} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#.......................................................................#
			#FTD-322001
			if [messageid]=="322001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} MAC address %{DATA:src_mac_address},(\s)?%{GREEDYDATA:event_description} on interface %{GREEDYDATA:src_interface}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-322002
			if [messageid]=="322002" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{DATA:event_description} for arp %{WORD:http_message} received from host %{DATA:src_mac_address} on interface %{DATA:src_interface}(\s)?.(\s)?This host is advertising MAC Address %{DATA:src_fake_mac_address} for IP Address %{IPORHOST:src_ip}(\s)?,(\s)?which is (statically|dynamically) bound to MAC Address %{GREEDYDATA:src_real_mac_address}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-322003
			if [messageid]=="322003" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{DATA:event_description} for arp %{WORD:http_message} received from host %{DATA:src_mac_address} on interface %{DATA:src_interface}(\s)?.(\s)?This host is advertising MAC Address %{DATA:src_fake_mac_address} for IP Address %{IPORHOST:src_ip}(\s)?,(\s)?which %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-402114
			if [messageid]=="402114" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC:(\s)?Received an %{WORD:protocol} packet(\s)?\(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} with an %{GREEDYDATA:event_description}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-402115
			if [messageid]=="402115" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received a packet from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} containing %{WORD:act_proto} data instead of %{WORD:protocol}%{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-402116
			if [messageid]=="402116" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet(\s)?\(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{IPORHOST:dst_ip}(\s)?.%{GREEDYDATA:event_description}.(\s)?The packet specifies its destination as %{GREEDYDATA:pkt_daddr}(\s)?,(\s)?its source as %{GREEDYDATA:pkt_saddr}(\s)?,(\s)?and its protocol as %{GREEDYDATA:pkt_prot}(\s)?.(\s)?The SA specifies its local proxy as %{DATA:id_daddr}(\s)?/%{DATA:id_dmask}(\s)?/%{DATA:id_dprot}(\s)?/%{DATA:dst_port} and its remote proxy as %{DATA:id_saddr}(\s)?/%{DATA:id_smask}(\s)?/%{DATA:id_sprot}(\s)?/%{GREEDYDATA:src_port}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-402117
			if [messageid]=="402117" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received a non-IPsec \(%{WORD:protocol}(\s)?\) packet from %{GREEDYDATA:src_ip} to %{IPORHOST:dst_ip}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#.......................................................................#
			#FTD-402118
			if [messageid]=="402118" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet \(SPI=%{DATA:spi}(\s)?,(\s)?sequence number(=)?(\s)?%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{GREEDYDATA:dst_ip} containing an %{GREEDYDATA:event_description} fragment of length %{GREEDYDATA:frag_len} with offset %{GREEDYDATA:frag_offset}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-402119,402120
			if [messageid]=="402119" or [messageid]=="402120" {
					grok {
						match => {
							"cisco_msg" => [
							"IPSEC: Received an %{WORD:protocol} packet \(SPI=%{DATA:spi}(\s)?,(\s)?sequence number=%{DATA:seq_num}(\s)?\) from %{GREEDYDATA:src_ip} \(%{DATA:username}(\s)?\) to %{GREEDYDATA:dst_ip} that %{GREEDYDATA:event_description}"
							]
						}
					}
					if [messageid]=="402119"{
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-402128
			if [messageid]=="402128" {
					grok {
						match => {
							"cisco_msg" => [
							"CRYPTO: An attempt to allocate a large memory block failed,(\s)?size:(\s)?%{GREEDYDATA:size}(\s)?,(\s)?limit:(\s)?%{GREEDYDATA:limit}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-405001
			if [messageid]=="405001" {
					grok {
						match => {
							"cisco_msg" => [
							"Received %{WORD:protocol} %{WORD:http_message} %{WORD:event_description} from %{IPORHOST:src_ip}(\s)?/%{DATA:src_mac_address} on interface %{DATA:src_interface} with existing ARP entry %{IPORHOST:src_real_ip}(\s)?/%{GREEDYDATA:src_real_mac_address}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-405002
			if [messageid]=="405002" {
					grok {
						match => {
							"cisco_msg" => [
							"Received %{GREEDYDATA:event_description} from %{IPORHOST:src_ip}(\s)?/%{DATA:src_mac_address} for %{GREEDYDATA:irrelevant}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-406001
			if [messageid]=="406001" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} port command low port(\s)?:(\s)?%{IPORHOST:src_ip}(\s)?/(\s)?%{INT:src_port} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-406002
			if [messageid]=="406002" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} port command %{DATA:event_description}:(\s)?IP_address(\s)?\(%{IPORHOST:src_ip}(\s)?\) to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-407002
			if [messageid]=="407002" {
					grok {
						match => {
							"cisco_msg" => [
							"Embryonic limit %{INT:num_conns}(\s)?/%{INT:limit} for through connections exceeded.%{IPORHOST:src_ip}(\s)?/%{INT:src_port} to %{GREEDYDATA:global_ip} \(%{IPORHOST:dst_ip}(\s)?\)(\s)?/%{INT:dst_port} on interface %{GREEDYDATA:dst_interface}"
							]
						}
			}
			}
			#......................................................................#
			#FTD-603109
			if [messageid]=="603109" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{WORD:protocol} Tunnel at %{GREEDYDATA:src_interface},(\s)?tunnel-id(\s)?=(\s)?%{INT:tunnel_id}(\s)?,(\s)?remote-peer(\s)?=(\s)?%{IPORHOST:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#FTD-605004
			if [messageid]=="605004" {
					grok {
						match => {
							"cisco_msg" => [
							"%{GREEDYDATA:event_description} from %{GREEDYDATA:src_ip}/%{INT:src_port} to %{GREEDYDATA:dst_interface}:%{GREEDYDATA:dst_ip}/%{INT:dst_port} for user %{GREEDYDATA:username}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-617100
			if [messageid]=="617100" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown %{INT:num_conns} connection(\s)?(\(s\))? for user %{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-106018
			if [messageid]=="106018" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} packet type %{INT:icmp_type} %{WORD:cisco_action} by %{WORD:direction} list %{GREEDYDATA:access_list} src %{GREEDYDATA:src_ip} dest %{GREEDYDATA:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-106020
			if [messageid]=="106020" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} IP teardrop fragment \(size(\s)?=(\s)?%{INT:fragment_size},(\s)?offset(\s)?=(\s)?%{INT:fragment_offset}\) from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-106021
			if [messageid]=="106021" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:cisco_action} protocol reverse path check from %{GREEDYDATA:src_ip} to %{GREEDYDATA:dst_ip} on interface %{GREEDYDATA:src_interface}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-611301
			if [messageid]=="611301" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} configured for Client Mode with no split tunneling:(\s)?NAT address:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-611303
			if [messageid]=="611303" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} configured for Client Mode with split tunneling: NAT address:(\s)?%{GREEDYDATA:nat_address} Split Tunnel Networks: %{GREEDYDATA:src_ip}/%{GREEDYDATA:src_masc} %{GREEDYDATA:dst_ip}/%{GREEDYDATA:dst_masc}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-611304
			if [messageid]=="611304" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:protocol} exemption configured for Network Extension Mode with split tunneling: Split Tunnel Networks: %{GREEDYDATA:src_ip}/%{GREEDYDATA:src_masc} %{GREEDYDATA:dst_ip}/%{GREEDYDATA:dst_masc}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-611307
			if [messageid]=="611307" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?Head end:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-611309
			if [messageid]=="611309" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:cisco_action} from head end and uninstalling previously downloaded policy:(\s)?Head End:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-611310,611311
			if [messageid]=="611310" or [messageid]=="611311" {
					grok {
						match => {
							"cisco_msg" => [
							"VNPClient:(\s)?XAUTH (Succeeded|Failed):(\s)?Peer:(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					if [messageid]=="611310" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-611314
			if [messageid]=="611314" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient: Load Balancing Cluster with Virtual IP:(\s)?%{GREEDYDATA:src_ip} has redirected the to server %{GREEDYDATA:dst_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-611315
			if [messageid]=="611315" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?%{WORD:cisco_action} from Load Balancing Cluster member %{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-611318
			if [messageid]=="611318" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient:(\s)?User %{GREEDYDATA:cisco_action}:(\s)?Auth Server IP:(\s)?%{GREEDYDATA:src_ip} Auth Server Port:(\s)?%{INT:dst_port} Idle Timeout: %{INT:timeout}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-710003
			if [messageid]=="710003" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:protocol} %{GREEDYDATA:cisco_action} by ACL from %{IPORHOST:src_ip}(\s)?/%{INT:src_port} to %{WORD:dst_interface}(\s)?(\s)?:(\s)?%{IPORHOST:dst_ip}(\s)?/%{INT:dst_port}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#FTD-713252,713253
			if [messageid]=="713252" or [messageid]=="713253" {
					grok {
						match => {
							"cisco_msg" => [
							"Group = %{GREEDYDATA:group},(\s)?Username(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?IP(\s)?=(\s)?%{GREEDYDATA:src_ip},(\s)?Integrity Firewall Server is not available.%{GREEDYDATA:irrelevant}"
							]
						}
					}
					if [messageid]=="713253" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-716001,716002,716003
			if [messageid]=="716001" or [messageid]=="716002" or [messageid]=="716003" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP (<%{IPORHOST:src_ip}>|%{IPORHOST:src_ip}) WebVPN %{GREEDYDATA:cisco_action}"
							]
						}
					}
					mutate {
							add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-716004,716006,716007,716009
			if [messageid]=="716004" or [messageid]=="716006" or [messageid]=="716007" or [messageid]=="716009" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) WebVPN %{GREEDYDATA:cisco_action}"
							]
						}
					}
					if [messageid]=="716004" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-716005
			if [messageid]=="716005" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) WebVPN ACL Parse Error:(\s)?%{GREEDYDATA:reason}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-716038
			if [messageid]=="716038" {
					grok {
						match => {
							"cisco_msg" => [
							"Group (<%{DATA:group}>|%{GREEDYDATA:group}) User (<%{DATA:src_fwuser}>|''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) IP %{IPORHOST:src_ip} %{GREEDYDATA:cisco_action}, Session %{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-716039
			if [messageid]=="716039" {
					grok {
						match => {
							"cisco_msg" => [
							"%{GREEDYDATA:cisco_action},(\s)?group(\s)?=(\s)?%{GREEDYDATA:group} user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser})(\s)?,(\s)?Session %{GREEDYDATA:irrelevant}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-719017,719019,719020,719021,719022,719023
			if [messageid]=="719017" or [messageid]=="719019" or [messageid]=="719020"
			or [messageid]=="719021" or [messageid]=="719022" or [messageid]=="719023" {
					grok {
						match => {
							"cisco_msg" => [
							"WebVPN user(:)?(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) %{GREEDYDATA:cisco_action}"
							]
						}
					}
					if [messageid]=="719020" or [messageid]=="719022" {
						mutate {
							add_field => { "[logx][utm][action]" => "Success" }
						}
					}
			}
			#......................................................................#
			#FTD-719018
			if [messageid]=="719018" {
					grok {
						match => {
							"cisco_msg" => [
							"WebVPN user:(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) ACL ID %{GREEDYDATA:access_list} not %{GREEDYDATA:irrelevant}"
							]
						}
					}
					mutate {
						add_field => { "[logx][cisco_firepower][reason]" => "ACL not found"	}
					}
			}
			#......................................................................#
			#FTD-719024
			if [messageid]=="719024" {
					grok {
						match => {
							"cisco_msg" => [
							"Email Proxy %{GREEDYDATA:cisco_action}:(\s)?session(\s)?=(\s)?%{GREEDYDATA:session} user(\s)?=(\s)?(''%{DATA:src_fwuser}''|%{DATA:src_fwuser}) addr(\s)?=(\s)?%{GREEDYDATA:src_ip}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-609002
			if [messageid]=="609002" {
					grok {
						match => {
							"cisco_msg" => [
							"Teardown local-host %{GREEDYDATA:zone-name}/\*(\s)?:(\s)?%{GREEDYDATA:src_ip} duration %{GREEDYDATA:duration}"
							]
						}
					}
					mutate {
						add_field => { "[logx][utm][action]" => "Success" }
					}
			}
			#......................................................................#
			#FTD-611305
			if [messageid]=="611305" {
					grok {
						match => {
							"cisco_msg" => [
							"VPNClient(\s)?:(\s)?DHCP Policy installed(\s)?:(\s)?Primary DNS(\s)?:(\s)?%{GREEDYDATA:primary_dns_ip} Secondary DNS(\s)?:(\s)?%{GREEDYDATA:secondary_dns_ip} Primary WINS(\s)?:(\s)?%{GREEDYDATA:primary_wins_ip} Secondary WINS(\s)?:(\s)?%{GREEDYDATA:secondary_wins_ip}"
							]
						}
					}
			}
			#......................................................................#
			#FTD-733100
			if [messageid]=="733100" {
					grok {
						match => {
							"cisco_msg" => [
							"(\[)?%{DATA:object}(\])? drop rate(\s)?(-)?%{INT:rate_id} exceeded. Current burst rate is %{INT:current_rate_val} per second(,)?(\s)?(_)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second(,)?(\s)?(_)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#FTD-733101
			if [messageid]=="733101" {
					grok {
						match => {
							"cisco_msg" => [
							"%{WORD:object} %{GREEDYDATA:dst_ip} is targeted. Current burst rate is %{INT:current_rate_val} per second,(\s)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second,(\s)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?",
							"%{WORD:object} %{GREEDYDATA:src_ip} is attacking. Current burst rate is %{INT:current_rate_val} per second,(\s)?max configured rate is %{INT:current_rate_val_max}(\s)?;(\s)?Current average rate is %{INT:average_rate_val} per second,(\s)?max configured rate is %{INT:average_rate_val_max}(\s)?;(\s)?Cumulative total count is %{INT:total_cnt}%{GREEDYDATA:irrelevant}?"

							]
						}
					}
			}
			#......................................................................#
			#FTD-733102
			if [messageid]=="733102" {
					grok {
						match => {
							"cisco_msg" => [
							"Threat-detection add(s)? host %{GREEDYDATA:src_ip} to %{GREEDYDATA:irrelevant}?"

							]
						}
					}
			}
			#......................................................................#
			#FTD-733103
			if [messageid]=="733103" {
					grok {
						match => {
							"cisco_msg" => [
							"Threat-detection removes host %{GREEDYDATA:src_ip} from %{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
			#......................................................................#
			#FTD-733104,733105
			if [messageid]=="733104" or [messageid]=="733105" {
					grok {
						match => {
							"cisco_msg" => [
							"TD_SYSLOG_%{DATA:protocol}_%{DATA:cisco_action}_AVERAGE_RATE_EXCEED%{GREEDYDATA:irrelevant}?",
							"TD_SYSLOG_%{DATA:protocol}_%{DATA:cisco_action}_BURST_RATE_EXCEED%{GREEDYDATA:irrelevant}?"
							]
						}
					}
			}
		}
		#......................................................................#
		#Decoding severity
		if [severity]{
			if [severity] == "1" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Alert"
					}
				}
			}
			if [severity] == "2" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Critical"
					}
				}
			}
			if [severity] == "3" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Error"
					}
				}
			}
			if [severity] == "4" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Warning"
					}
				}
			}
			if [severity] == "5" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Notification"
					}
				}
			}
			if [severity] == "6" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Informational"
					}
				}
			}
			if [severity] == "7" {
				mutate {
					add_field => {
						"[logx][cisco_firepower][severityLabel]" => "Debugging"
					}
				}
			}
		}
		#......................................................................#
		#Formatting number values
		if [severity]{
			mutate { convert => {"severity" => "integer"}}
		}
		if [messageid]{
			mutate { convert => {"messageid" => "integer"}}
		}
		if [src_port]{
			mutate { convert => {"src_port" => "integer"}}
		}
		if [dst_port]{
			mutate { convert => {"dst_port" => "integer"}}
		}
		if [hit_count]{
			mutate { convert => {"hit_count" => "integer"}}
		}
		if [bytes_xmt]{
			mutate { convert => {"bytes_xmt" => "integer"}}
		}
		if [bytes_rcv]{
			mutate { convert => {"bytes_rcv" => "integer"}}
		}
		if [in_if_num]{
			mutate { convert => {"in_if_num" => "integer"}}
		}
		if [out_if_num]{
			mutate { convert => {"out_if_num" => "integer"}}
		}
		if [mapped_src_port]{
			mutate { convert => {"mapped_src_port" => "integer"}}
		}
		if [mapped_dst_port]{
			mutate { convert => {"mapped_dst_port" => "integer"}}
		}
		if [icmp_type]{
			mutate { convert => {"icmp_type" => "integer"}}
		}
		if [code]{
			mutate { convert => {"code" => "integer"}}
		}
		if [tunnel_id]{
			mutate { convert => {"tunnel_id" => "integer"}}
		}
		if [num_conns]{
			mutate { convert => {"num_conns" => "integer"}}
		}
		if [fragment_size]{
			mutate { convert => {"fragment_size" => "integer"}}
		}
		if [fragment_offset]{
			mutate { convert => {"fragment_offset" => "integer"}}
		}
		if [timeout]{
			mutate { convert => {"timeout" => "integer"}}
		}
		if [global_port]{
			mutate { convert => {"global_port" => "integer"}}
		}
		if [global_port]{
			mutate { convert => {"src_port_local" => "integer"}}
		}
		#......................................................................#
		#Then add all possible fields to the json tree structure

		   mutate {
			  rename => { "priority" => "[logx][cisco_firepower][priority]" }
			  rename => { "severity" => "[logx][cisco_firepower][severity]" }
			  rename => { "message" => "[logx][cisco_firepower][message]" }
			  rename => { "messageid" => "[logx][cisco_firepower][messageid]" }
			  rename => { "cisco_action" => "[logx][cisco_firepower][cisco_action]" }
			  rename => { "protocol" => "[logx][cisco_firepower][proto]" }
			  rename => { "src_ip" => "[logx][cisco_firepower][src_ip]" }
			  rename => { "src_port" => "[logx][cisco_firepower][src_port]" }
			  rename => { "dst_ip" => "[logx][cisco_firepower][dest_ip]" }
			  rename => { "dst_port" => "[logx][cisco_firepower][dest_port]" }
			  rename => { "direction" => "[logx][cisco_firepower][direction]" }
			  rename => { "src_interface" => "[logx][cisco_firepower][src_interface]" }
			  rename => { "tcp_flags" => "[logx][cisco_firepower][tcp_flags]" }
			  rename => { "event_description" => "[logx][cisco_firepower][event_desc]" }
			  rename => { "limit" => "[logx][cisco_firepower][limit]" }
			  rename => { "num_conns" => "[logx][cisco_firepower][num_conns]" }
			  rename => { "global_ip" => "[logx][cisco_firepower][global_ip]" }
			  rename => { "spi" => "[logx][cisco_firepower][spi]" }
			  rename => { "seq_num" => "[logx][cisco_firepower][seq_num]" }
			  rename => { "username" => "[logx][cisco_firepower][src_user]" }
			  rename => { "http_message" => "[logx][cisco_firepower][http_message]" }
			  rename => { "src_real_mac_address" => "[logx][cisco_firepower][src_real_mac_address]" }
			  rename => { "src_mac_address" => "[logx][cisco_firepower][src_mac_address]" }
			  rename => { "dst_interface" => "[logx][cisco_firepower][dst_interface]" }
			  rename => { "limit" => "[logx][cisco_firepower][limit]" }

			  #New fields from FTD-1-106101
			  rename => { "num_flows" => "[logx][cisco_firepower][num_flows]" }

			  #New fields from FTD-6-106102
			  rename => { "access_list" => "[logx][cisco_firepower][access_list_id]" }
			  rename => { "src_fwuser" => "[logx][cisco_firepower][src_user]" }
			  rename => { "hit_count" => "[logx][cisco_firepower][hit_count]" }

			  #New fields from FTD-109101,109102,109103
			  rename => { "audit_session_id" => "[logx][cisco_firepower][audit_session_id]" }

			  #New fields from FTD-109201 to 109213
			  rename => { "session" => "[logx][cisco_firepower][session]" }

			  #New fields from FTD-113004
			  rename => { "aaa_type" => "[logx][cisco_firepower][aaa_type]" }

			  #New fields from FTD-113009
			  rename => { "policy" => "[logx][cisco_firepower][policy]" }

			  #New fields from FTD-113013
			  rename => { "reason" => "[logx][cisco_firepower][reason]" }

			  #New fields from FTD-113019
			  rename => { "group" => "[logx][cisco_firepower][group]" }
			  rename => { "session_type" => "[logx][cisco_firepower][session_type]" }
			  rename => { "duration" => "[logx][cisco_firepower][duration]" }
			  rename => { "bytes_xmt" => "[logx][cisco_firepower][bytes_xmt]" }
			  rename => { "bytes_rcv" => "[logx][cisco_firepower][bytes_rcv]" }

			  #New fields from FTD-113031
			  rename => { "filter" => "[logx][cisco_firepower][filter]" }

			  #New fields from FTD-113042
			  rename => { "client_ip" => "[logx][cisco_firepower][client_ip]" }

			  #New fields from FTD-4-209003
			  rename => { "id" => "[logx][cisco_firepower][id]" }

			  #New fields from FTD-316002
			  rename => { "in_if_num" => "[logx][cisco_firepower][in_if_num]" }
			  rename => { "out_if_num" => "[logx][cisco_firepower][out_if_num]" }

			  #New fields from FTD-302002,322003
			  rename => { "src_fake_mac_address" => "[logx][cisco_firepower][src_fake_mac_address]" }

			  #New fields from FTD-302013
			  rename => { "connection_id" => "[logx][cisco_firepower][connection_id]" }
			  rename => { "mapped_src_ip" => "[logx][cisco_firepower][mapped_src_ip]" }
			  rename => { "mapped_src_port" => "[logx][cisco_firepower][mapped_src_port]" }
			  rename => { "mapped_dst_ip" => "[logx][cisco_firepower][mapped_dst_ip]" }
			  rename => { "mapped_dst_port" => "[logx][cisco_firepower][mapped_dst_port]" }
			  rename => { "dst_fwuser" => "[logx][cisco_firepower][dst_user]" }

			  #New fields from FTD-302017
			  rename => { "translated_src_ip" => "[logx][cisco_firepower][translated_src_ip]" }
			  rename => { "translated_dst_ip" => "[logx][cisco_firepower][translated_dst_ip]" }
			  rename => { "translated_cid" => "[logx][cisco_firepower][translated_cid]" }
			  rename => { "real_cid" => "[logx][cisco_firepower][real_cid]" }

			  #New fields from FTD-302021
			  rename => { "icmp_type" => "[logx][cisco_firepower][icmp_type]" }
			  rename => { "code" => "[logx][cisco_firepower][code]" }
			  rename => { "src_ip_local" => "[logx][cisco_firepower][src_ip_local]" }
			  rename => { "src_port_local" => "[logx][cisco_firepower][src_port_local]" }

			  #New fields from FTD-302020
			  rename => { "global_port" => "[logx][cisco_firepower][global_port]" }

			  #New fields from FTD-302022
			  rename => { "role" => "[logx][cisco_firepower][role]" }

			  #New fields from FTD-305012
			  rename => { "acl_name" => "[logx][cisco_firepower][access_list_name]" }

			  #New fields from FTD-4-402115
			  rename => { "act_proto" => "[logx][cisco_firepower][act_proto]" }

			  #New fields from FTD-4-402116
			  rename => { "pkt_daddr" => "[logx][cisco_firepower][pkt_daddr]" }
			  rename => { "pkt_saddr" => "[logx][cisco_firepower][pkt_saddr]" }
			  rename => { "pkt_prot" => "[logx][cisco_firepower][pkt_prot]" }
			  rename => { "id_daddr" => "[logx][cisco_firepower][id_daddr]" }
			  rename => { "id_dmask" => "[logx][cisco_firepower][id_dmask]" }
			  rename => { "id_dprot" => "[logx][cisco_firepower][id_dprot]" }
			  rename => { "id_saddr" => "[logx][cisco_firepower][id_saddr]" }
			  rename => { "id_smask" => "[logx][cisco_firepower][id_smask]" }
			  rename => { "id_sprot" => "[logx][cisco_firepower][id_sprot]" }

			  #New fields from FTD-4-402118
			  rename => { "frag_len" => "[logx][cisco_firepower][frag_len]" }
			  rename => { "frag_offset" => "[logx][cisco_firepower][frag_offset]" }

			  #New fields from FTD-5-402128
			  rename => { "size" => "[logx][cisco_firepower][size]" }

			  #New fields from FTD-4-405001
			  rename => { "src_real_ip" => "[logx][cisco_firepower][src_real_ip]" }

			  #New fields from FTD-603109
			  rename => { "tunnel_id" => "[logx][cisco_firepower][tunnel_id]" }

			  #New fields from FTD-106020
			  rename => { "fragment_size" => "[logx][cisco_firepower][fragment_size]" }
			  rename => { "fragment_offset" => "[logx][cisco_firepower][fragment_offset]" }

			  #New fields from FTD-611303
			  rename => { "nat_address" => "[logx][cisco_firepower][nat_address]" }
			  rename => { "src_masc" => "[logx][cisco_firepower][src_masc]" }
			  rename => { "dst_masc" => "[logx][cisco_firepower][dst_masc]" }

			  #New fields from FTD-611305
			  rename => { "primary_dns_ip" => "[logx][cisco_firepower][primary_dns_ip]" }
			  rename => { "secondary_dns_ip" => "[logx][cisco_firepower][secondary_dns_ip]" }
			  rename => { "primary_wins_ip" => "[logx][cisco_firepower][primary_wins_ip]" }
			  rename => { "secondary_wins_ip" => "[logx][cisco_firepower][secondary_wins_ip]" }

			  #New fields from FTD-611318
			  rename => { "timeout" => "[logx][cisco_firepower][timeout]" }

			  #New fields from FTD-609002
			  rename => { "zone-name" => "[logx][cisco_firepower][zone-name]" }

			  #New fields from FTD-733100,733101
			  rename => { "object" => "[logx][cisco_firepower][object]" }
			  rename => { "rate_id" => "[logx][cisco_firepower][rate_id]" }
			  rename => { "current_rate_val" => "[logx][cisco_firepower][current_rate_val]" }
			  rename => { "current_rate_val_max" => "[logx][cisco_firepower][current_rate_val_max]" }
			  rename => { "average_rate_val" => "[logx][cisco_firepower][average_rate_val]" }
			  rename => { "average_rate_val_max" => "[logx][cisco_firepower][average_rate_val_max]" }
			  rename => { "total_cnt" => "[logx][cisco_firepower][total_cnt]" }
		   }

		   #Finally, remove unnecessary fields
		   mutate {
			  remove_field => ["@version","path","cisco_tag","cisco_msg_init","cisco_message","fecha",
			  "irrelevant","cisco_msg","ciscoDataSource"]
		   }
		  }
		   #Also, remove unwanted fields if the message not match with conditions
		   mutate {
			  remove_field => ["original_log_message","headers"]
		   }
		}
		','cisco-firepower',NULL,true,'FIRE_POWER',false,'2.0.1'),
			 (601,'filter {
			if [logx][type] and [logx][type] == "o365" {
				mutate {
					add_field => {
						"dataType" => "o365"
					}
					add_field => {
						"dataSource" => "o365"
					}
				}

				mutate {
					remove_field => ["headers", "[logx][type]", "@version", "global", "es_metadata_id"]
				}

			}
		}','o365-all',NULL,true,'O365',true,'1.0.0'),
			 (701,'filter {

		#Filter Version 3.0.1
		#Based on https://www.elastic.co/guide/en/beats/winlogbeat/8.5/exported-fields-winlog.html
		#And https://www.elastic.co/guide/en/beats/libbeat/7.0/breaking-changes-7.0.html

			split {
			  field => "message"
			  terminator => "<utm-log-separator>"
			}
			json {
			  source => "message"
			}

			if ([winlog][api] and [winlog][api] == "wineventlog") or ([type] and [type] == "wineventlog") {

				mutate {
					add_field => { "dataType" => "wineventlog" }

					add_field => {"[global][type]" => "logx"}
					remove_field => ["fileset"]
					remove_field => ["fields"]
				}

				#If winlogbeat is of old version
				if [type] and [type] == "wineventlog"{
					mutate {
						rename => { "[beat][name]" => "[dataSource]" }
						rename => {"[type]" => "[logx][type]"}

						rename => {"[activity_id]" => "[logx][wineventlog][activity_id]"}
						rename => {"[beat]" => "[logx][wineventlog][beat]"}
						rename => {"[event_data]" => "[logx][wineventlog][event_data]"}
						rename => {"[event_id]" => "[logx][wineventlog][event_id]"}
						rename => {"[keywords]" => "[logx][wineventlog][keywords]"}
						rename => {"[level]" => "[logx][wineventlog][level]"}
						rename => {"[log]" => "[logx][wineventlog][log]"}
						rename => {"[log_name]" => "[logx][wineventlog][log_name]"}
						rename => {"[opcode]" => "[logx][wineventlog][opcode]"}
						rename => {"[process_id]" => "[logx][wineventlog][process_id]"}
						rename => {"[provider_guid]" => "[logx][wineventlog][provider_guid]"}
						rename => {"[record_number]" => "[logx][wineventlog][record_number]"}
						rename => {"[source_name]" => "[logx][wineventlog][source_name]"}
						rename => {"[task]" => "[logx][wineventlog][task]"}
						rename => {"[thread_id]" => "[logx][wineventlog][thread_id]"}
						rename => {"[user]" => "[logx][wineventlog][user]"}
						rename => {"[user_data]" => "[logx][wineventlog][user_data]"}
						rename => {"[version]" => "[logx][wineventlog][version]"}

						rename => {"[meta]" => "[logx][wineventlog][meta]"}
						rename => {"[docker]" => "[logx][wineventlog][docker]"}
						rename => {"[related_activity_id]" => "[logx][wineventlog][related_activity_id]"}
					}
				}

				#If winlogbeat is of version 8.5.1
				if [winlog][api] and [winlog][api] == "wineventlog"{
				   mutate {
						rename => { "[host][hostname]" => "[dataSource]" }
						rename => {"[winlog][api]" => "[logx][type]"}

						rename => {"[winlog][activity_id]" => "[logx][wineventlog][activity_id]"}
						rename => {"[event][timezone]" => "[logx][wineventlog][beat][timezone]"}
						rename => {"[agent][name]" => "[logx][wineventlog][beat][hostname]"}
						rename => {"[agent][version]" => "[logx][wineventlog][beat][version]"}
						rename => {"[event][original]" => "[xml]"}
						rename => {"[winlog][event_data]" => "[logx][wineventlog][event_data]"}
						rename => {"[winlog][event_id]" => "[logx][wineventlog][event_id]"}
						rename => {"[winlog][keywords]" => "[logx][wineventlog][keywords]"}
						rename => {"[log][level]" => "[logx][wineventlog][level]"}
						rename => {"[winlog][channel]" => "[logx][wineventlog][log_name]"}
						rename => {"[winlog][opcode]" => "[logx][wineventlog][opcode]"}
						rename => {"[winlog][process][pid]" => "[logx][wineventlog][process_id]"}
						rename => {"[winlog][provider_guid]" => "[logx][wineventlog][provider_guid]"}
						rename => {"[winlog][record_id]" => "[logx][wineventlog][record_number]"}
						rename => {"[winlog][provider_name]" => "[logx][wineventlog][source_name]"}
						rename => {"[winlog][task]" => "[logx][wineventlog][task]"}
						rename => {"[winlog][process][thread][id]" => "[logx][wineventlog][thread_id]"}
						rename => {"[winlog][user]" => "[logx][wineventlog][user]"}
						rename => {"[winlog][user_data]" => "[logx][wineventlog][user_data]"}
						rename => {"[winlog][version]" => "[logx][wineventlog][version]"}

						rename => {"[cloud]" => "[logx][wineventlog][meta][cloud]"}
						rename => {"[container]" => "[logx][wineventlog][docker][container]"}
						rename => {"[winlog][computer_name]" => "[computer_name]"}
						rename => {"[winlog][related_activity_id]" => "[logx][wineventlog][related_activity_id]"}
						rename => {"[ecs]" => "[logx][wineventlog][ecs]"}
						rename => {"[winlog][computerObject]" => "[logx][wineventlog][computerObject]"}
						rename => {"[winlog][time_created]" => "[logx][wineventlog][time_created]"}
						rename => {"[winlog][trustAttribute]" => "[logx][wineventlog][trustAttribute]"}
						rename => {"[winlog][trustDirection]" => "[logx][wineventlog][trustDirection]"}
						rename => {"[winlog][trustType]" => "[logx][wineventlog][trustType]"}
				   }

				   mutate { convert => { "[logx][wineventlog][event_id]" => "integer" }}
				}

				mutate {
					rename => {"[clienthost]" => "[logx][wineventlog][clienthost]"}
					rename => {"[geoip]" => "[logx][wineventlog][geoip]"}
					rename => {"[host]" => "[logx][wineventlog][host]"}
					rename => {"[input]" => "[logx][wineventlog][input]"}
					rename => {"[log_timestamp]" => "[logx][wineventlog][log_timestamp]"}
					rename => {"[message]" => "[logx][wineventlog][message]"}
					rename => {"[method]" => "[logx][wineventlog][method]"}
					rename => {"[offset]" => "[logx][wineventlog][offset]"}
					rename => {"[page]" => "[logx][wineventlog][page]"}
					rename => {"[port]" => "[logx][wineventlog][port]"}
					rename => {"[prospector]" => "[logx][wineventlog][prospector]"}
					rename => {"[querystring]" => "[logx][wineventlog][querystring]"}
					rename => {"[referer]" => "[logx][wineventlog][referer]"}
					rename => {"[response]" => "[logx][wineventlog][response]"}
					rename => {"[scstatus]" => "[logx][wineventlog][scstatus]"}
					rename => {"[site]" => "[logx][wineventlog][site]"}
					rename => {"[source]" => "[logx][wineventlog][source]"}
					rename => {"[subresponse]" => "[logx][wineventlog][subresponse]"}
					rename => {"[tags]" => "[logx][wineventlog][tags]"}
					rename => {"[timetaken]" => "[logx][wineventlog][timetaken]"}
					rename => {"[user_agent]" => "[logx][wineventlog][useragent]"}
					rename => {"[username]" => "[logx][wineventlog][username]"}
					rename => {"[error]" => "[logx][wineventlog][error]"}
					rename => {"[timeseries]" => "[logx][wineventlog][timeseries]"}
					rename => {"[event]" => "[logx][wineventlog][event]"}
					rename => {"[agent]" => "[logx][wineventlog][agent]"}
					rename => {"[as]" => "[logx][wineventlog][as]"}
					rename => {"[client]" => "[logx][wineventlog][client]"}
					rename => {"[code_signature]" => "[logx][wineventlog][code_signature]"}
					rename => {"[data_stream]" => "[logx][wineventlog][data_stream]"}
					rename => {"[destination]" => "[logx][wineventlog][destination]"}
					rename => {"[dll]" => "[logx][wineventlog][dll]"}
					rename => {"[dns]" => "[logx][wineventlog][dns]"}
					rename => {"[els]" => "[logx][wineventlog][els]"}
					rename => {"[faas]" => "[logx][wineventlog][faas]"}
					rename => {"[file]" => "[logx][wineventlog][file]"}
					rename => {"[geo]" => "[logx][wineventlog][geo]"}
					rename => {"[group]" => "[logx][wineventlog][group]"}
					rename => {"[http]" => "[logx][wineventlog][http]"}
					rename => {"[interface]" => "[logx][wineventlog][interface]"}
					rename => {"[network]" => "[logx][wineventlog][network]"}
					rename => {"[observer]" => "[logx][wineventlog][observer]"}
					rename => {"[orchestrator]" => "[logx][wineventlog][orchestrator]"}
					rename => {"[os]" => "[logx][wineventlog][os]"}
					rename => {"[package]" => "[logx][wineventlog][package]"}
					rename => {"[pe]" => "[logx][wineventlog][pe]"}
					rename => {"[registry]" => "[logx][wineventlog][registry]"}
					rename => {"[related]" => "[logx][wineventlog][related]"}
					rename => {"[rule]" => "[logx][wineventlog][rule]"}
					rename => {"[server]" => "[logx][wineventlog][server]"}
					rename => {"[service]" => "[logx][wineventlog][service]"}
					rename => {"[threat]" => "[logx][wineventlog][threat]"}
					rename => {"[tls]" => "[logx][wineventlog][tls]"}
					rename => {"[url]" => "[logx][wineventlog][url]"}
					rename => {"[vlan]" => "[logx][wineventlog][vlan]"}
					rename => {"[vulnerability]" => "[logx][wineventlog][vulnerability]"}
					rename => {"[x509]" => "[logx][wineventlog][x509]"}
					rename => {"[process]" => "[logx][wineventlog][process]"}
					rename => {"[powershell]" => "[logx][wineventlog][powershell]"}
				}

				mutate {
					remove_field => ["winlog"]
					remove_field => ["log"]
				}

				if [logx][wineventlog][event_id] {
					if [logx][wineventlog][event_id] == 1100 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The event logging service has shut down"}
						}
					}
					else if [logx][wineventlog][event_id] == 1101 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Audit events have been dropped by the transport."}
						}
					}
					else if [logx][wineventlog][event_id] == 1102 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The audit log was cleared"}
						}
					}
					else if [logx][wineventlog][event_id] == 1104 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The security Log is now full"}
						}
					}
					else if [logx][wineventlog][event_id] == 1105 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Event log automatic backup"}
						}
					}
					else if [logx][wineventlog][event_id] == 1108 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The event logging service encountered an error"}
						}
					}
					else if [logx][wineventlog][event_id] == 4608 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows is starting up"}
						}
					}
					else if [logx][wineventlog][event_id] == 4609 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows is shutting down"}
						}
					}
					else if [logx][wineventlog][event_id] == 4610 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An authentication package has been loaded by the Local Security Authority"}
						}
					}
					else if [logx][wineventlog][event_id] == 4611 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A trusted logon process has been registered with the Local Security Authority"}
						}
					}
					else if [logx][wineventlog][event_id] == 4612 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Internal resources allocated for the queuing of audit messages have been exhausted: leading to the loss of some audits."}
						}
					}
					else if [logx][wineventlog][event_id] == 4614 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A notification package has been loaded by the Security Account Manager."}
						}
					}
					else if [logx][wineventlog][event_id] == 4615 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Invalid use of LPC port"}
						}
					}
					else if [logx][wineventlog][event_id] == 4616 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The system time was changed."}
						}
					}
					else if [logx][wineventlog][event_id] == 4618 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A monitored security event pattern has occurred"}
						}
					}
					else if [logx][wineventlog][event_id] == 4621 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Administrator recovered system from CrashOnAuditFail"}
						}
					}
					else if [logx][wineventlog][event_id] == 4622 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security package has been loaded by the Local Security Authority."}
						}
					}
					else if [logx][wineventlog][event_id] == 4624 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An account was successfully logged on"}
						}
					}
					else if [logx][wineventlog][event_id] == 4625 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An account failed to log on"}
						}
					}
					else if [logx][wineventlog][event_id] == 4626 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "User/Device claims information"}
						}
					}
					else if [logx][wineventlog][event_id] == 4627 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Group membership information."}
						}
					}
					else if [logx][wineventlog][event_id] == 4634 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An account was logged off"}
						}
					}
					else if [logx][wineventlog][event_id] == 4646 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IKE DoS-prevention mode started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4647 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "User initiated logoff"}
						}
					}
					else if [logx][wineventlog][event_id] == 4648 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A logon was attempted using explicit credentials"}
						}
					}
					else if [logx][wineventlog][event_id] == 4649 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A replay attack was detected"}
						}
					}
					else if [logx][wineventlog][event_id] == 4650 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Main Mode security association was established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4651 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Main Mode security association was established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4652 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Main Mode negotiation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4653 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Main Mode negotiation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4654 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Quick Mode negotiation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4655 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Main Mode security association ended"}
						}
					}
					else if [logx][wineventlog][event_id] == 4656 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A handle to an object was requested"}
						}
					}
					else if [logx][wineventlog][event_id] == 4657 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A registry value was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4658 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The handle to an object was closed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4659 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A handle to an object was requested with intent to delete"}
						}
					}
					else if [logx][wineventlog][event_id] == 4660 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An object was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4661 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A handle to an object was requested"}
						}
					}
					else if [logx][wineventlog][event_id] == 4662 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An operation was performed on an object"}
						}
					}
					else if [logx][wineventlog][event_id] == 4663 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to access an object"}
						}
					}
					else if [logx][wineventlog][event_id] == 4664 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to create a hard link"}
						}
					}
					else if [logx][wineventlog][event_id] == 4665 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to create an application client context."}
						}
					}
					else if [logx][wineventlog][event_id] == 4666 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An application attempted an operation"}
						}
					}
					else if [logx][wineventlog][event_id] == 4667 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An application client context was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4668 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An application was initialized"}
						}
					}
					else if [logx][wineventlog][event_id] == 4670 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Permissions on an object were changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4671 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An application attempted to access a blocked ordinal through the TBS"}
						}
					}
					else if [logx][wineventlog][event_id] == 4672 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Special privileges assigned to new logon"}
						}
					}
					else if [logx][wineventlog][event_id] == 4673 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A privileged service was called"}
						}
					}
					else if [logx][wineventlog][event_id] == 4674 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An operation was attempted on a privileged object"}
						}
					}
					else if [logx][wineventlog][event_id] == 4675 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "SIDs were filtered"}
						}
					}
					else if [logx][wineventlog][event_id] == 4688 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A new process has been created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4689 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A process has exited"}
						}
					}
					else if [logx][wineventlog][event_id] == 4690 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to duplicate a handle to an object"}
						}
					}
					else if [logx][wineventlog][event_id] == 4691 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Indirect access to an object was requested"}
						}
					}
					else if [logx][wineventlog][event_id] == 4692 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Backup of data protection master key was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4693 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Recovery of data protection master key was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4694 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Protection of auditable protected data was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4695 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Unprotection of auditable protected data was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4696 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A primary token was assigned to process"}
						}
					}
					else if [logx][wineventlog][event_id] == 4697 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A service was installed in the system"}
						}
					}
					else if [logx][wineventlog][event_id] == 4698 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A scheduled task was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4699 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A scheduled task was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4700 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A scheduled task was enabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4701 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A scheduled task was disabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4702 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A scheduled task was updated"}
						}
					}
					else if [logx][wineventlog][event_id] == 4703 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A token right was adjusted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4704 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user right was assigned"}
						}
					}
					else if [logx][wineventlog][event_id] == 4705 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user right was removed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4706 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A new trust was created to a domain"}
						}
					}
					else if [logx][wineventlog][event_id] == 4707 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A trust to a domain was removed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4709 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services was started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4710 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services was disabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4711 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine (1%)"}
						}
					}
					else if [logx][wineventlog][event_id] == 4712 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services encountered a potentially serious failure"}
						}
					}
					else if [logx][wineventlog][event_id] == 4713 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Kerberos policy was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4714 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Encrypted data recovery policy was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4715 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The audit policy (SACL) on an object was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4716 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Trusted domain information was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4717 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "System security access was granted to an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4718 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "System security access was removed from an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4719 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "System audit policy was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4720 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4722 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was enabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4723 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to change an account''s password"}
						}
					}
					else if [logx][wineventlog][event_id] == 4724 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to reset an accounts password"}
						}
					}
					else if [logx][wineventlog][event_id] == 4725 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was disabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4726 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4727 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled global group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4728 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-enabled global group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4729 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-enabled global group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4730 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled global group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4731 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled local group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4732 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-enabled local group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4733 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-enabled local group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4734 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled local group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4735 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled local group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4737 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled global group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4738 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4739 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Domain Policy was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4740 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was locked out"}
						}
					}
					else if [logx][wineventlog][event_id] == 4741 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A computer account was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4742 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A computer account was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4743 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A computer account was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4744 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled local group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4745 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled local group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4746 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-disabled local group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4747 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-disabled local group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4748 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled local group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4749 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled global group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4750 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled global group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4751 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-disabled global group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4752 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-disabled global group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4753 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled global group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4754 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled universal group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4755 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled universal group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4756 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-enabled universal group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4757 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-enabled universal group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4758 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled universal group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4759 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled universal group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4760 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled universal group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4761 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a security-disabled universal group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4762 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a security-disabled universal group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4763 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-disabled universal group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4764 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A groups type was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4765 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "SID History was added to an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4766 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt to add SID History to an account failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4767 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user account was unlocked"}
						}
					}
					else if [logx][wineventlog][event_id] == 4768 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos authentication ticket (TGT) was requested"}
						}
					}
					else if [logx][wineventlog][event_id] == 4769 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos service ticket was requested"}
						}
					}
					else if [logx][wineventlog][event_id] == 4770 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos service ticket was renewed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4771 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Kerberos pre-authentication failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4772 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos authentication ticket request failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4773 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos service ticket request failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4774 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An account was mapped for logon"}
						}
					}
					else if [logx][wineventlog][event_id] == 4775 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An account could not be mapped for logon"}
						}
					}
					else if [logx][wineventlog][event_id] == 4776 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The domain controller attempted to validate the credentials for an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4777 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The domain controller failed to validate the credentials for an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4778 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A session was reconnected to a Window Station"}
						}
					}
					else if [logx][wineventlog][event_id] == 4779 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A session was disconnected from a Window Station"}
						}
					}
					else if [logx][wineventlog][event_id] == 4780 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The ACL was set on accounts which are members of administrators groups"}
						}
					}
					else if [logx][wineventlog][event_id] == 4781 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The name of an account was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4782 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The password hash an account was accessed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4783 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A basic application group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4784 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A basic application group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4785 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was added to a basic application group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4786 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A member was removed from a basic application group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4787 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A non-member was added to a basic application group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4788 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A non-member was removed from a basic application group."}
						}
					}
					else if [logx][wineventlog][event_id] == 4789 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A basic application group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4790 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An LDAP query group was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4791 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A basic application group was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4792 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An LDAP query group was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4793 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Password Policy Checking API was called"}
						}
					}
					else if [logx][wineventlog][event_id] == 4794 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to set the Directory Services Restore Mode administrator password"}
						}
					}
					else if [logx][wineventlog][event_id] == 4797 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to query the existence of a blank password for an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4798 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user''s local group membership was enumerated."}
						}
					}
					else if [logx][wineventlog][event_id] == 4799 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security-enabled local group membership was enumerated"}
						}
					}
					else if [logx][wineventlog][event_id] == 4800 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The workstation was locked"}
						}
					}
					else if [logx][wineventlog][event_id] == 4801 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The workstation was unlocked"}
						}
					}
					else if [logx][wineventlog][event_id] == 4802 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The screen saver was invoked"}
						}
					}
					else if [logx][wineventlog][event_id] == 4803 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The screen saver was dismissed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4816 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "RPC detected an integrity violation while decrypting an incoming message"}
						}
					}
					else if [logx][wineventlog][event_id] == 4817 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Auditing settings on object were changed."}
						}
					}
					else if [logx][wineventlog][event_id] == 4818 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Proposed Central Access Policy does not grant the same access permissions as the current Central Access Policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 4819 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Central Access Policies on the machine have been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4820 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos Ticket-granting-ticket (TGT) was denied because the device does not meet the access control restrictions"}
						}
					}
					else if [logx][wineventlog][event_id] == 4821 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Kerberos service ticket was denied because the user: device: or both does not meet the access control restrictions"}
						}
					}
					else if [logx][wineventlog][event_id] == 4822 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "NTLM authentication failed because the account was a member of the Protected User group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4823 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "NTLM authentication failed because access control restrictions are required"}
						}
					}
					else if [logx][wineventlog][event_id] == 4824 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Kerberos preauthentication by using DES or RC4 failed because the account was a member of the Protected User group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4825 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A user was denied the access to Remote Desktop. By default: users are allowed to connect only if they are members of the Remote Desktop Users group or Administrators group"}
						}
					}
					else if [logx][wineventlog][event_id] == 4826 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Boot Configuration Data loaded"}
						}
					}
					else if [logx][wineventlog][event_id] == 4830 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "SID History was removed from an account"}
						}
					}
					else if [logx][wineventlog][event_id] == 4864 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A namespace collision was detected"}
						}
					}
					else if [logx][wineventlog][event_id] == 4865 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A trusted forest information entry was added"}
						}
					}
					else if [logx][wineventlog][event_id] == 4866 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A trusted forest information entry was removed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4867 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A trusted forest information entry was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4868 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The certificate manager denied a pending certificate request"}
						}
					}
					else if [logx][wineventlog][event_id] == 4869 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services received a resubmitted certificate request"}
						}
					}
					else if [logx][wineventlog][event_id] == 4870 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services revoked a certificate"}
						}
					}
					else if [logx][wineventlog][event_id] == 4871 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services received a request to publish the certificate revocation list (CRL)"}
						}
					}
					else if [logx][wineventlog][event_id] == 4872 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services published the certificate revocation list (CRL)"}
						}
					}
					else if [logx][wineventlog][event_id] == 4873 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A certificate request extension changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4874 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "One or more certificate request attributes changed."}
						}
					}
					else if [logx][wineventlog][event_id] == 4875 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services received a request to shut down"}
						}
					}
					else if [logx][wineventlog][event_id] == 4876 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services backup started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4877 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services backup completed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4878 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services restore started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4879 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services restore completed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4880 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4881 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services stopped"}
						}
					}
					else if [logx][wineventlog][event_id] == 4882 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The security permissions for Certificate Services changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4883 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services retrieved an archived key"}
						}
					}
					else if [logx][wineventlog][event_id] == 4884 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services imported a certificate into its database"}
						}
					}
					else if [logx][wineventlog][event_id] == 4885 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The audit filter for Certificate Services changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4886 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services received a certificate request"}
						}
					}
					else if [logx][wineventlog][event_id] == 4887 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services approved a certificate request and issued a certificate"}
						}
					}
					else if [logx][wineventlog][event_id] == 4888 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services denied a certificate request"}
						}
					}
					else if [logx][wineventlog][event_id] == 4889 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services set the status of a certificate request to pending"}
						}
					}
					else if [logx][wineventlog][event_id] == 4890 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The certificate manager settings for Certificate Services changed."}
						}
					}
					else if [logx][wineventlog][event_id] == 4891 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A configuration entry changed in Certificate Services"}
						}
					}
					else if [logx][wineventlog][event_id] == 4892 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A property of Certificate Services changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4893 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services archived a key"}
						}
					}
					else if [logx][wineventlog][event_id] == 4894 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services imported and archived a key"}
						}
					}
					else if [logx][wineventlog][event_id] == 4895 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services published the CA certificate to Active Directory Domain Services"}
						}
					}
					else if [logx][wineventlog][event_id] == 4896 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "One or more rows have been deleted from the certificate database"}
						}
					}
					else if [logx][wineventlog][event_id] == 4897 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Role separation enabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 4898 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services loaded a template"}
						}
					}
					else if [logx][wineventlog][event_id] == 4899 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Certificate Services template was updated"}
						}
					}
					else if [logx][wineventlog][event_id] == 4900 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Certificate Services template security was updated"}
						}
					}
					else if [logx][wineventlog][event_id] == 4902 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Per-user audit policy table was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 4904 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to register a security event source"}
						}
					}
					else if [logx][wineventlog][event_id] == 4905 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt was made to unregister a security event source"}
						}
					}
					else if [logx][wineventlog][event_id] == 4906 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The CrashOnAuditFail value has changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4907 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Auditing settings on object were changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4908 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Special Groups Logon table modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4909 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The local policy settings for the TBS were changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4910 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The group policy settings for the TBS were changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4911 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Resource attributes of the object were changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4912 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Per User Audit Policy was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4913 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Central Access Policy on the object was changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4928 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An Active Directory replica source naming context was established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4929 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An Active Directory replica source naming context was removed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4930 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An Active Directory replica source naming context was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4931 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An Active Directory replica destination naming context was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4932 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Synchronization of a replica of an Active Directory naming context has begun"}
						}
					}
					else if [logx][wineventlog][event_id] == 4933 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Synchronization of a replica of an Active Directory naming context has ended"}
						}
					}
					else if [logx][wineventlog][event_id] == 4934 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Attributes of an Active Directory object were replicated"}
						}
					}
					else if [logx][wineventlog][event_id] == 4935 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Replication failure begins"}
						}
					}
					else if [logx][wineventlog][event_id] == 4936 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Replication failure ends"}
						}
					}
					else if [logx][wineventlog][event_id] == 4937 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A lingering object was removed from a replica"}
						}
					}
					else if [logx][wineventlog][event_id] == 4944 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following policy was active when the Windows Firewall started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4945 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A rule was listed when the Windows Firewall started"}
						}
					}
					else if [logx][wineventlog][event_id] == 4946 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to Windows Firewall exception list. A rule was added"}
						}
					}
					else if [logx][wineventlog][event_id] == 4947 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to Windows Firewall exception list. A rule was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 4948 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to Windows Firewall exception list. A rule was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 4949 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall settings were restored to the default values"}
						}
					}
					else if [logx][wineventlog][event_id] == 4950 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Firewall setting has changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4951 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A rule has been ignored because its major version number was not recognized by Windows Firewall"}
						}
					}
					else if [logx][wineventlog][event_id] == 4952 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Parts of a rule have been ignored because its minor version number was not recognized by Windows Firewall"}
						}
					}
					else if [logx][wineventlog][event_id] == 4953 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A rule has been ignored by Windows Firewall because it could not parse the rule"}
						}
					}
					else if [logx][wineventlog][event_id] == 4954 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall Group Policy settings has changed. The new settings have been applied"}
						}
					}
					else if [logx][wineventlog][event_id] == 4956 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall has changed the active profile"}
						}
					}
					else if [logx][wineventlog][event_id] == 4957 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall did not apply the following rule"}
						}
					}
					else if [logx][wineventlog][event_id] == 4958 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall did not apply the following rule because the rule referred to items not configured on this computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 4960 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec dropped an inbound packet that failed an integrity check"}
						}
					}
					else if [logx][wineventlog][event_id] == 4961 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec dropped an inbound packet that failed a replay check"}
						}
					}
					else if [logx][wineventlog][event_id] == 4962 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec dropped an inbound packet that failed a replay check"}
						}
					}
					else if [logx][wineventlog][event_id] == 4963 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec dropped an inbound clear text packet that should have been secured"}
						}
					}
					else if [logx][wineventlog][event_id] == 4964 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Special groups have been assigned to a new logon"}
						}
					}
					else if [logx][wineventlog][event_id] == 4965 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec received a packet from a remote computer with an incorrect Security Parameter Index (SPI)."}
						}
					}
					else if [logx][wineventlog][event_id] == 4976 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "During Main Mode negotiation: IPsec received an invalid negotiation packet."}
						}
					}
					else if [logx][wineventlog][event_id] == 4977 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "During Quick Mode negotiation: IPsec received an invalid negotiation packet."}
						}
					}
					else if [logx][wineventlog][event_id] == 4978 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "During Extended Mode negotiation: IPsec received an invalid negotiation packet."}
						}
					}
					else if [logx][wineventlog][event_id] == 4979 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Main Mode and Extended Mode security associations were established."}
						}
					}
					else if [logx][wineventlog][event_id] == 4980 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Main Mode and Extended Mode security associations were established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4981 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Main Mode and Extended Mode security associations were established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4982 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Main Mode and Extended Mode security associations were established"}
						}
					}
					else if [logx][wineventlog][event_id] == 4983 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Extended Mode negotiation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4984 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Extended Mode negotiation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 4985 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The state of a transaction has changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5024 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service has started successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 5025 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service has been stopped"}
						}
					}
					else if [logx][wineventlog][event_id] == 5027 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service was unable to retrieve the security policy from the local storage"}
						}
					}
					else if [logx][wineventlog][event_id] == 5028 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service was unable to parse the new security policy."}
						}
					}
					else if [logx][wineventlog][event_id] == 5029 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service failed to initialize the driver"}
						}
					}
					else if [logx][wineventlog][event_id] == 5030 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service failed to start"}
						}
					}
					else if [logx][wineventlog][event_id] == 5031 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Service blocked an application from accepting incoming connections on the network."}
						}
					}
					else if [logx][wineventlog][event_id] == 5032 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Windows Firewall was unable to notify the user that it blocked an application from accepting incoming connections on the network"}
						}
					}
					else if [logx][wineventlog][event_id] == 5033 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Driver has started successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 5034 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Driver has been stopped"}
						}
					}
					else if [logx][wineventlog][event_id] == 5035 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Driver failed to start"}
						}
					}
					else if [logx][wineventlog][event_id] == 5037 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Firewall Driver detected critical runtime error. Terminating"}
						}
					}
					else if [logx][wineventlog][event_id] == 5038 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Code integrity determined that the image hash of a file is not valid"}
						}
					}
					else if [logx][wineventlog][event_id] == 5039 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A registry key was virtualized."}
						}
					}
					else if [logx][wineventlog][event_id] == 5040 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. An Authentication Set was added."}
						}
					}
					else if [logx][wineventlog][event_id] == 5041 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. An Authentication Set was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5042 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. An Authentication Set was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5043 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Connection Security Rule was added"}
						}
					}
					else if [logx][wineventlog][event_id] == 5044 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Connection Security Rule was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5045 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Connection Security Rule was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5046 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Crypto Set was added"}
						}
					}
					else if [logx][wineventlog][event_id] == 5047 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Crypto Set was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5048 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A change has been made to IPsec settings. A Crypto Set was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5049 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Security Association was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5050 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An attempt to programmatically disable the Windows Firewall using a call to INetFwProfile.FirewallEnabled(FALSE)"}
						}
					}
					else if [logx][wineventlog][event_id] == 5051 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A file was virtualized"}
						}
					}
					else if [logx][wineventlog][event_id] == 5056 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic self test was performed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5057 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic primitive operation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5058 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Key file operation"}
						}
					}
					else if [logx][wineventlog][event_id] == 5059 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Key migration operation"}
						}
					}
					else if [logx][wineventlog][event_id] == 5060 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Verification operation failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5061 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Cryptographic operation"}
						}
					}
					else if [logx][wineventlog][event_id] == 5062 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A kernel-mode cryptographic self test was performed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5063 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic provider operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5064 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic context operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5065 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic context modification was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5066 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic function operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5067 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic function modification was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5068 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic function provider operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5069 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic function property operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5070 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A cryptographic function property operation was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5071 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Key access denied by Microsoft key distribution service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5120 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "OCSP Responder Service Started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5121 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "OCSP Responder Service Stopped"}
						}
					}
					else if [logx][wineventlog][event_id] == 5122 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Configuration entry changed in the OCSP Responder Service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5123 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A configuration entry changed in the OCSP Responder Service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5124 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A security setting was updated on OCSP Responder Service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5125 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A request was submitted to OCSP Responder Service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5126 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Signing Certificate was automatically updated by the OCSP Responder Service"}
						}
					}
					else if [logx][wineventlog][event_id] == 5127 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The OCSP Revocation Provider successfully updated the revocation information"}
						}
					}
					else if [logx][wineventlog][event_id] == 5136 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5137 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was created"}
						}
					}
					else if [logx][wineventlog][event_id] == 5138 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was undeleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5139 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was moved"}
						}
					}
					else if [logx][wineventlog][event_id] == 5140 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A network share object was accessed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5141 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was deleted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5142 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A network share object was added."}
						}
					}
					else if [logx][wineventlog][event_id] == 5143 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A network share object was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5144 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A network share object was deleted."}
						}
					}
					else if [logx][wineventlog][event_id] == 5145 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A network share object was checked to see whether client can be granted desired access"}
						}
					}
					else if [logx][wineventlog][event_id] == 5146 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has blocked a packet"}
						}
					}
					else if [logx][wineventlog][event_id] == 5147 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A more restrictive Windows Filtering Platform filter has blocked a packet"}
						}
					}
					else if [logx][wineventlog][event_id] == 5148 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has detected a DoS attack and entered a defensive mode; packets associated with this attack will be discarded."}
						}
					}
					else if [logx][wineventlog][event_id] == 5149 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The DoS attack has subsided and normal processing is being resumed."}
						}
					}
					else if [logx][wineventlog][event_id] == 5150 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has blocked a packet."}
						}
					}
					else if [logx][wineventlog][event_id] == 5151 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A more restrictive Windows Filtering Platform filter has blocked a packet."}
						}
					}
					else if [logx][wineventlog][event_id] == 5152 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform blocked a packet"}
						}
					}
					else if [logx][wineventlog][event_id] == 5153 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A more restrictive Windows Filtering Platform filter has blocked a packet"}
						}
					}
					else if [logx][wineventlog][event_id] == 5154 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has permitted an application or service to listen on a port for incoming connections"}
						}
					}
					else if [logx][wineventlog][event_id] == 5155 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has blocked an application or service from listening on a port for incoming connections"}
						}
					}
					else if [logx][wineventlog][event_id] == 5156 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has allowed a connection"}
						}
					}
					else if [logx][wineventlog][event_id] == 5157 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has blocked a connection"}
						}
					}
					else if [logx][wineventlog][event_id] == 5158 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has permitted a bind to a local port"}
						}
					}
					else if [logx][wineventlog][event_id] == 5159 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The Windows Filtering Platform has blocked a bind to a local port"}
						}
					}
					else if [logx][wineventlog][event_id] == 5168 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Spn check for SMB/SMB2 fails."}
						}
					}
					else if [logx][wineventlog][event_id] == 5169 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5170 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A directory service object was modified during a background cleanup task"}
						}
					}
					else if [logx][wineventlog][event_id] == 5376 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Credential Manager credentials were backed up"}
						}
					}
					else if [logx][wineventlog][event_id] == 5377 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Credential Manager credentials were restored from a backup"}
						}
					}
					else if [logx][wineventlog][event_id] == 5378 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The requested credentials delegation was disallowed by policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 5379 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Credential Manager credentials were read"}
						}
					}
					else if [logx][wineventlog][event_id] == 5380 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Vault Find Credential"}
						}
					}
					else if [logx][wineventlog][event_id] == 5381 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Vault credentials were read"}
						}
					}
					else if [logx][wineventlog][event_id] == 5382 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Vault credentials were read"}
						}
					}
					else if [logx][wineventlog][event_id] == 5440 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following callout was present when the Windows Filtering Platform Base Filtering Engine started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5441 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following filter was present when the Windows Filtering Platform Base Filtering Engine started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5442 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following provider was present when the Windows Filtering Platform Base Filtering Engine started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5443 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following provider context was present when the Windows Filtering Platform Base Filtering Engine started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5444 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The following sub-layer was present when the Windows Filtering Platform Base Filtering Engine started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5446 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Filtering Platform callout has been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5447 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Filtering Platform filter has been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5448 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Filtering Platform provider has been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5449 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Filtering Platform provider context has been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5450 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Windows Filtering Platform sub-layer has been changed"}
						}
					}
					else if [logx][wineventlog][event_id] == 5451 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Quick Mode security association was established"}
						}
					}
					else if [logx][wineventlog][event_id] == 5452 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec Quick Mode security association ended"}
						}
					}
					else if [logx][wineventlog][event_id] == 5453 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An IPsec negotiation with a remote computer failed because the IKE and AuthIP IPsec Keying Modules (IKEEXT) service is not started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5456 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine applied Active Directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5457 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to apply Active Directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5458 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine applied locally cached copy of Active Directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5459 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to apply locally cached copy of Active Directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5460 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine applied local registry storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5461 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to apply local registry storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5462 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to apply some rules of the active IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5463 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine polled for changes to the active IPsec policy and detected no changes"}
						}
					}
					else if [logx][wineventlog][event_id] == 5464 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine polled for changes to the active IPsec policy: detected changes: and applied them to IPsec Services"}
						}
					}
					else if [logx][wineventlog][event_id] == 5465 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine received a control for forced reloading of IPsec policy and processed the control successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 5466 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine polled for changes to the Active Directory IPsec policy: determined that Active Directory cannot be reached: and will use the cached copy of the Active Directory IPsec policy instead"}
						}
					}
					else if [logx][wineventlog][event_id] == 5467 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine polled for changes to the Active Directory IPsec policy: determined that Active Directory can be reached: and found no changes to the policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 5468 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine polled for changes to the Active Directory IPsec policy: determined that Active Directory can be reached: found changes to the policy: and applied those changes"}
						}
					}
					else if [logx][wineventlog][event_id] == 5471 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine loaded local storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5472 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to load local storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5473 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine loaded directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5474 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to load directory storage IPsec policy on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5477 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "PAStore Engine failed to add quick mode filter"}
						}
					}
					else if [logx][wineventlog][event_id] == 5478 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services has started successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 5479 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services has been shut down successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 5480 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services failed to get the complete list of network interfaces on the computer"}
						}
					}
					else if [logx][wineventlog][event_id] == 5483 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services failed to initialize RPC server. IPsec Services could not be started"}
						}
					}
					else if [logx][wineventlog][event_id] == 5484 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services has experienced a critical failure and has been shut down"}
						}
					}
					else if [logx][wineventlog][event_id] == 5485 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "IPsec Services failed to process some IPsec filters on a plug-and-play event for network interfaces"}
						}
					}
					else if [logx][wineventlog][event_id] == 5632 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A request was made to authenticate to a wireless network"}
						}
					}
					else if [logx][wineventlog][event_id] == 5633 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A request was made to authenticate to a wired network"}
						}
					}
					else if [logx][wineventlog][event_id] == 5712 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A Remote Procedure Call (RPC) was attempted"}
						}
					}
					else if [logx][wineventlog][event_id] == 5888 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An object in the COM+ Catalog was modified"}
						}
					}
					else if [logx][wineventlog][event_id] == 5889 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An object was deleted from the COM+ Catalog"}
						}
					}
					else if [logx][wineventlog][event_id] == 5890 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "An object was added to the COM+ Catalog"}
						}
					}
					else if [logx][wineventlog][event_id] == 6144 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Security policy in the group policy objects has been applied successfully"}
						}
					}
					else if [logx][wineventlog][event_id] == 6145 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "One or more errors occured while processing security policy in the group policy objects"}
						}
					}
					else if [logx][wineventlog][event_id] == 6272 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server granted access to a user"}
						}
					}
					else if [logx][wineventlog][event_id] == 6273 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server denied access to a user"}
						}
					}
					else if [logx][wineventlog][event_id] == 6274 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server discarded the request for a user"}
						}
					}
					else if [logx][wineventlog][event_id] == 6275 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server discarded the accounting request for a user"}
						}
					}
					else if [logx][wineventlog][event_id] == 6276 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server quarantined a user"}
						}
					}
					else if [logx][wineventlog][event_id] == 6277 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server granted access to a user but put it on probation because the host did not meet the defined health policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 6278 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server granted full access to a user because the host met the defined health policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 6279 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server locked the user account due to repeated failed authentication attempts"}
						}
					}
					else if [logx][wineventlog][event_id] == 6280 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Network Policy Server unlocked the user account"}
						}
					}
					else if [logx][wineventlog][event_id] == 6281 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Code Integrity determined that the page hashes of an image file are not valid..."}
						}
					}
					else if [logx][wineventlog][event_id] == 6400 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: Received an incorrectly formatted response while discovering availability of content."}
						}
					}
					else if [logx][wineventlog][event_id] == 6401 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: Received invalid data from a peer. Data discarded."}
						}
					}
					else if [logx][wineventlog][event_id] == 6402 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: The message to the hosted cache offering it data is incorrectly formatted."}
						}
					}
					else if [logx][wineventlog][event_id] == 6403 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: The hosted cache sent an incorrectly formatted response to the client''s message to offer it data."}
						}
					}
					else if [logx][wineventlog][event_id] == 6404 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: Hosted cache could not be authenticated using the provisioned SSL certificate."}
						}
					}
					else if [logx][wineventlog][event_id] == 6405 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: %2 instance(s) of event id %1 occurred."}
						}
					}
					else if [logx][wineventlog][event_id] == 6406 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "%1 registered to Windows Firewall to control filtering for the following:"}
						}
					}
					else if [logx][wineventlog][event_id] == 6408 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Registered product %1 failed and Windows Firewall is now controlling the filtering for %2."}
						}
					}
					else if [logx][wineventlog][event_id] == 6409 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "BranchCache: A service connection point object could not be parsed"}
						}
					}
					else if [logx][wineventlog][event_id] == 6410 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Code integrity determined that a file does not meet the security requirements to load into a process. This could be due to the use of shared sections or other issues"}
						}
					}
					else if [logx][wineventlog][event_id] == 6416 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A new external device was recognized by the system."}
						}
					}
					else if [logx][wineventlog][event_id] == 6417 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The FIPS mode crypto selftests succeeded"}
						}
					}
					else if [logx][wineventlog][event_id] == 6418 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The FIPS mode crypto selftests failed"}
						}
					}
					else if [logx][wineventlog][event_id] == 6419 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A request was made to disable a device"}
						}
					}
					else if [logx][wineventlog][event_id] == 6420 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A device was disabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 6421 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A request was made to enable a device"}
						}
					}
					else if [logx][wineventlog][event_id] == 6422 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "A device was enabled"}
						}
					}
					else if [logx][wineventlog][event_id] == 6423 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The installation of this device is forbidden by system policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 6424 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "The installation of this device was allowed: after having previously been forbidden by policy"}
						}
					}
					else if [logx][wineventlog][event_id] == 8191 {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "Highest System-Defined Audit Message Value"}
						}
					}
					else {
						mutate {
							add_field => {"[logx][wineventlog][event_name]" => "None"}
						}
					}

					if [logx][wineventlog][event_id] == 4663 {
					if [logx][wineventlog][event_data][AccessMask]{
						if [logx][wineventlog][event_data][AccessMask] == "0x1" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "read"}
								add_field => {"[logx][wineventlog][access_description]" => "For a file object, the right to read the corresponding file data. For a directory object, the right to read the corresponding directory data.\n For a directory, the right to list the contents of the directory.\n For registry objects, this is, Query key value."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x2" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "write"}
								add_field => {"[logx][wineventlog][access_description]" => "For a file object, the right to write data to the file.\n For a directory object, the right to create a file in the directory.\n For registry objects, this is, Set key value."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x4" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "append"}
								add_field => {"[logx][wineventlog][access_description]" => "For a file object, the right to append data to the file. (For local files, write operations will not overwrite existing data if this flag is specified without FILE_WRITE_DATA.)\n For a directory object, the right to create a subdirectory.\n For a named pipe, the right to create a pipe."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x8" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "read_extended_attributes"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to read extended file attributes.\n For registry objects, this is, Enumerate sub-keys."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x10" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "write_extended_attributes"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to write extended file attributes."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x20" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "execute"}
								add_field => {"[logx][wineventlog][access_description]" => "For a native code file, the right to execute the file. This access right given to scripts may cause the script to be executable, depending on the script interpreter.\n For a directory, the right to traverse the directory. By default, users are assigned the BYPASS_TRAVERSE_CHECKING privilege, which ignores the FILE_TRAVERSE access right."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x40" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "delete_child"}
								add_field => {"[logx][wineventlog][access_description]" => "For a directory, the right to delete a directory and all the files it contains, including read-only files."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x80" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "read_attributes"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to read file attributes."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x100" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "write_attributes"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to write file attributes."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x10000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "delete"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to delete the object."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x20000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "read_control"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to read the information in the object''s security descriptor, not including the information in the system access control list (SACL)."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x40000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "write_dac"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to modify the discretionary access control list (DACL) in the object''s security descriptor."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x80000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "write_owner"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to change the owner in the object''s security descriptor"}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x100000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "synchronize"}
								add_field => {"[logx][wineventlog][access_description]" => "The right to use the object for synchronization. This enables a thread to wait until the object is in the signaled state. Some object types do not support this access right."}
							}
						}
						else if [logx][wineventlog][event_data][AccessMask] == "0x1000000" {
							mutate {
								add_field => {"[logx][wineventlog][access_type]" => "access_sys_sec"}
								add_field => {"[logx][wineventlog][access_description]" => "The ACCESS_SYS_SEC access right controls the ability to get or set the SACL in an object''s security descriptor."}
							}
						}
					}
					}
					if [logx][wineventlog][event_id] == 4625 {
					if [logx][wineventlog][event_data][FailureReason] {
						if [logx][wineventlog][event_data][FailureReason] == "%%2305" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "The specified user account has expired."}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2309" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "The specified account''s password has expired"}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2310" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "Account currently disabled"}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2311" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "Account logon time restriction violation"}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2312" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "User not allowed to logon at this computer"}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2313" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "Unknown user name or bad password"}
							}
						}
						else if [logx][wineventlog][event_data][FailureReason] == "%%2304" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "An Error occurred during Logon"}
							}
						}
						else {
							mutate {
								add_field => {"[logx][wineventlog][event_data][FailureReasonDescription]" => "None"}
							}
						}
					}
					if [logx][wineventlog][event_data][Status] {
						if [logx][wineventlog][event_data][Status] == "0xC0000234" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Account locked out"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000193" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Account expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000133" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Clocks out of sync"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000224" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Password change required"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xc000015b" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "User does not have logon right"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xc000006d" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Logon failure"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xc000006e" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Account restriction"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xc00002ee" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "An error occurred during logon"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000071" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Password expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000072" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Account disabled"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC0000413" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Authentication firewall prohibits logon"}
							}
						}
						else {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "None"}
							}
						}
					}
					if [logx][wineventlog][event_data][SubStatus] {
						if [logx][wineventlog][event_data][SubStatus] == "0xC0000234" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Account locked out"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000193" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Account expired"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000133" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Clocks out of sync"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000224" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Password change required"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc000015b" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "User does not have logon right"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc000006d" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Logon failure"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc000006e" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Account restriction"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc00002ee" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "An error occurred during logon"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000071" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Password expired"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000072" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Account disabled"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xC0000413" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Authentication firewall prohibits logon"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc000006a" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Incorrect password"}
							}
						}
						else if [logx][wineventlog][event_data][SubStatus] == "0xc0000064" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "Account does not exist"}
							}
						}
						else {
							mutate {
								add_field => {"[logx][wineventlog][event_data][SubStatusDescription]" => "None"}
							}
						}
					}
					}
					if [logx][wineventlog][event_id] == 4771 {
					if [logx][wineventlog][event_data][Status] {
						if [logx][wineventlog][event_data][Status] == "0x1" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Client''s entry in database has expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Server''s entry in database has expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x3" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Requested protocol version not supported"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x4" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Client''s key encrypted in old master key"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x5" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Server''s key encrypted in old master key"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x6" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Client not found in Kerberos database"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x7" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Server not found in Kerberos database"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x8" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Multiple principal entries in database"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x9" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "The client or server has a null key"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xA" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Ticket not eligible for postdating"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xB" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Requested start time is later than end time"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xC" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC policy rejects request"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xD" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC cannot accommodate requested option"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xE" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC has no support for encryption type"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0xF" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC has no support for checksum type"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x10" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC has no support for padata type"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x11" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "KDC has no support for transited type"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x12" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Clients credentials have been revoked"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x13" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Credentials for server have been revoked"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x14" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "TGT has been revoked"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x15" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Client not yet valid - try again later"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x16" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Server not yet valid - try again later"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x17" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Password has expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x18" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Pre-authentication information was invalid"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x19" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Additional pre-authentication required"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x1F" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Integrity check on decrypted field failed"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x20" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Ticket expired"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x21" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Ticket not yet valid"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x22" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Request is a replay"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x23" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "The ticket isn''t for us"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x24" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Ticket and authenticator don''t match"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x25" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Clock skew too great"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x26" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Incorrect net address"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x27" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Protocol version mismatch"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x28" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Invalid msg type"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x29" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Message stream modified"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2A" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Message out of order"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2C" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Specified version of key is not available"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2D" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Service key not available"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2E" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Mutual authentication failed"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x2F" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Incorrect message direction"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x30" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Alternative authentication method required"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x31" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Incorrect sequence number in message"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x32" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Inappropriate type of checksum in message"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x3C" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Generic error (description in e-text)"}
							}
						}
						else if [logx][wineventlog][event_data][Status] == "0x3D" {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "Field is too long for this implementation"}
							}
						}
						else {
							mutate {
								add_field => {"[logx][wineventlog][event_data][StatusDescription]" => "None"}
							}
						}
					}
					}
			  }
			}
		   #Also, remove unwanted fields if the message not match with conditions
		   mutate {
			  remove_field => ["headers"]
		   }
		}','windows-events',NULL,true,'WINDOWS_AGENT',true,'3.0.1'),
			 (702,'filter {
		  #Fields based on https://learn.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms525807(v=vs.90)
		  #and https://www.elastic.co/guide/en/beats/filebeat/7.13/exported-fields-iis.html
		  #and https://httpd.apache.org/docs/2.2/logs.html
		  #and filebeat fields.yml version 7.13.4 oss

		  #Filebeat IIS, version 3.0.1
		  #Filter Input requirements -> fileset: datatype
		  #                access: plain text
		  #                error: plain text

		  split {
			field => "message"
			terminator => "<utm-log-separator>"
		  }
		  json {
			source => "message"
		  }

		  if ([event][module] and [event][module] == "iis")
		  or ([service][type] and [service][type] == "iis") {
			 grok {
				 match => {
				   "message" => [
					 "%{TIMESTAMP_ISO8601:timestamp} %{IPORHOST:site} %{WORD:method} %{URIPATH:page} %{NOTSPACE:querystring} %{NUMBER:port} %{NOTSPACE:username} %{IPORHOST:clienthost} %{NOTSPACE:useragent} %{NOTSPACE:referer} %{NUMBER:response} %{NUMBER:subresponse} %{NUMBER:scstatus} %{NUMBER:timetaken:int}",
					 "%{TIMESTAMP_ISO8601:timestamp} %{WORD:iisSite} %{NOTSPACE:computername} %{IPORHOST:site} %{WORD:method} %{URIPATH:page} %{NOTSPACE:querystring} %{NUMBER:port} %{NOTSPACE:username} %{IPORHOST:clienthost} %{NOTSPACE:protocol} %{NOTSPACE:useragent} %{NOTSPACE:referer} %{IPORHOST:cshost} %{NUMBER:response} %{NUMBER:subresponse} %{NUMBER:scstatus} %{NUMBER:bytessent:int} %{NUMBER:bytesrecvd:int} %{NUMBER:timetaken:int}"
				   ]
				 }
			 }
			 date {
			  match => [ "timestamp", "ISO8601" ]
			  target => "@timestamp"
			 }
			 geoip {
			  source => "clienthost"
			 }
			 mutate{
				add_field => { "[dataType]" => "iis" }
				rename => { "[host][name]" => "[dataSource]" }
			 }
			 #......................................................................#
			#Then add all possible fields to the json tree structure

				#Fields from module
				mutate {
					rename => { "iis" => "[logx][iis]" }
				}
				mutate {
				#General fields from ECS
					rename => { "host" => "[logx][iis][host]" }
					rename => { "service" => "[logx][iis][service]" }
					rename => { "ecs" => "[logx][iis][ecs]" }
					rename => { "agent" => "[logx][iis][agent]" }
					rename => { "fileset" => "[logx][iis][fileset]" }
					rename => { "event" => "[logx][iis][event]" }
					rename => { "input" => "[logx][iis][input]" }
					rename => { "labels" => "[logx][iis][labels]" }
					rename => { "as" => "[logx][iis][as]" }
					rename => { "client" => "[logx][iis][client]" }
					rename => { "cloud" => "[logx][iis][cloud]" }
					rename => { "code_signature" => "[logx][iis][code_signature]" }
					rename => { "container" => "[logx][iis][container]" }
					rename => { "destination" => "[logx][iis][destination]" }
					rename => { "dll" => "[logx][iis][dll]" }
					rename => { "dns" => "[logx][iis][dns]" }
					rename => { "error" => "[logx][iis][error]" }
					rename => { "file" => "[logx][iis][file]" }
					rename => { "geo" => "[logx][iis][geo]" }
					rename => { "hash" => "[logx][iis][hash]" }
					rename => { "http" => "[logx][iis][http]" }
					rename => { "interface" => "[logx][iis][interface]" }
					rename => { "network" => "[logx][iis][network]" }
					rename => { "observer" => "[logx][iis][observer]" }
					rename => { "organization" => "[logx][iis][organization]" }
					rename => { "package" => "[logx][iis][package]" }
					rename => { "pe" => "[logx][iis][pe]" }
					rename => { "process" => "[logx][iis][process]" }
					rename => { "registry" => "[logx][iis][registry]" }
					rename => { "related" => "[logx][iis][related]" }
					rename => { "rule" => "[logx][iis][rule]" }
					rename => { "server" => "[logx][iis][server]" }
					rename => { "source" => "[logx][iis][source]" }
					rename => { "threat" => "[logx][iis][threat]" }
					rename => { "tls" => "[logx][iis][tls]" }
					rename => { "span.id" => "[logx][iis][span.id]" }
					rename => { "trace.id" => "[logx][iis][trace.id]" }
					rename => { "transaction.id" => "[logx][iis][transaction.id]" }
					rename => { "url" => "[logx][iis][url]" }
					rename => { "user" => "[logx][iis][user]" }
					rename => { "vlan" => "[logx][iis][vlan]" }
					rename => { "vulnerability" => "[logx][iis][vulnerability]" }
					rename => { "x509" => "[logx][iis][x509]" }

					#Rename fields from iis module to add it to the structure
					rename => { "subresponse" => "[logx][iis][subresponse]" }
					rename => { "page" => "[logx][iis][page]" }
					rename => { "clienthost" => "[logx][iis][clienthost]" }
					rename => { "referer" => "[logx][iis][referer]" }
					rename => { "username" => "[logx][iis][username]" }
					rename => { "site" => "[logx][iis][site]" }
					rename => { "iisSite" => "[logx][iis][iisSite]" }
					rename => { "timetaken" => "[logx][iis][timetaken]" }
					rename => { "response" => "[logx][iis][response]" }
					rename => { "useragent" => "[logx][iis][useragent]" }
					rename => { "method" => "[logx][iis][method]" }
					rename => { "port" => "[logx][iis][port]" }
					rename => { "querystring" => "[logx][iis][querystring]" }
					rename => { "scstatus" => "[logx][iis][scstatus]" }
					rename => { "computername" => "[logx][iis][computername]" }
					rename => { "protocol" => "[logx][iis][protocol]" }
					rename => { "bytessent" => "[logx][iis][bytes_sent]" }
					rename => { "bytesrecvd" => "[logx][iis][bytes_recvd]" }
					rename => { "geoip" => "[logx][iis][geoip]" }
					rename => { "timestamp" => "[logx][iis][log_time]" }
					rename => { "message" => "[logx][iis][message]" }

				}
				#......................................................................#
				#Finally, remove unnecessary fields
				mutate {
					remove_field => ["@version","tags","log"]
				}
		  }
		   #Also, remove unwanted fields if the message not match with conditions
		   mutate {
			  remove_field => ["headers"]
		   }
		}
		','windows-iis',NULL,true,'IIS',false,'3.0.1'),
			 (801,'filter {

		# Sophos filter version 2.0.1
		# Based on https://docs.sophos.com/nsg/sophos-firewall/17.5/PDF/SFOS_Logfile_Guide_17.5.pdf
		# and https://docs.sophos.com/nsg/sophos-firewall/18.5/PDF/SF%20syslog%20guide%2018.5.pdf
		# and https://docs.sophos.com/nsg/sophos-firewall/17.5/Help/en-us/webhelp/onlinehelp/nsg/sfos/concepts/LogMessages.html
		# and https://docs.sophos.com/nsg/sophos-firewall/17.5/Help/en-us/webhelp/onlinehelp/nsg/concepts/LogIDStructure.html
		# and https://docs.sophos.com/nsg/sophos-firewall/17.5/Help/en-us/webhelp/onlinehelp/nsg/sfos/concepts/LogFields.html

			split {
			 field => "message"
			 terminator => "<utm-log-separator>"
			}

		  #Looking for datasource generated by an agent and parse original message
		  if [message]=~/\[utm_stack_agent_ds=(.+)\]-(.+)/ {
			grok {
			  match => {
				"message" => [ "\[utm_stack_agent_ds=%{DATA:dataSource}\]-%{GREEDYDATA:original_log_message}" ]
			  }
			}
		  }
		  if [original_log_message] {
			mutate {
			  update => { "message" => "%{[original_log_message]}" }
			}
		  }

			if ![dataType] {
				#First, search for common fields and parse them
				grok {
					match => {
						"message" => [
						"device=%{QUOTEDSTRING:device} date=%{DATA:syslog_timestamp} time=%{TIME:xg_time} timezone=%{DATA:xg_timezone} device_name=%{QUOTEDSTRING:device_name} device_id=%{DATA:device_id} log_id=%{DATA:log_id} log_type=%{QUOTEDSTRING:log_type} log_component=%{QUOTEDSTRING:log_component} %{GREEDYDATA:msg}",
						"%{GREEDYDATA}device=%{QUOTEDSTRING:device} date=%{DATA:syslog_timestamp} time=%{TIME:xg_time} timezone=%{DATA:xg_timezone} device_name=%{QUOTEDSTRING:device_name} device_id=%{DATA:device_id} log_id=%{DATA:log_id} log_type=%{QUOTEDSTRING:log_type} log_component=%{QUOTEDSTRING:log_component} %{GREEDYDATA:msg}"
						]
					}
				}
				#Replacing string quotation for common fields
					mutate {
						gsub => ["device", ''"'', ""]
						gsub => ["device_name", ''"'', ""]
						gsub => ["log_type", ''"'', ""]
						gsub => ["log_component", ''"'', ""]
					}
				if [log_type] and ([log_type] == "Firewall" or [log_type] == "Content Filtering" or [log_type] == "Event"
				   or [log_type] == "WAF" or [log_type] == "System Health" or [log_type] == "IDP"
				   or [log_type] == "ATP" or [log_type] == "EATP" or ([log_type] == "Antivirus" or [log_type] == "Anti-Virus")
				   or [log_type] == "Anti-spam" or [log_type] == "Anti-Spam"
				   or [log_type] == "Heartbeat" or [log_type] == "Sandbox"
				   or [log_type] == "Wireless protection" or [log_type] == "Wireless Protection"
				   or [log_type] == "System health" or [log_type] == "Content filtering"
				   or [log_type] == "SSL" ) {
					#Other fields needed for rules in Correlation Engine
				  if [msg] {
					grok {
						match => {
							"msg" => [
							"status=%{QUOTEDSTRING:status} %{GREEDYDATA}",
							"%{GREEDYDATA} status=%{QUOTEDSTRING:status} %{GREEDYDATA}"
							]
						}
					}
					grok {
						match => {
							"msg" => [
							"log_subtype=%{QUOTEDSTRING:log_subtype} %{GREEDYDATA}",
							"%{GREEDYDATA} log_subtype=%{QUOTEDSTRING:log_subtype} %{GREEDYDATA}"
							]
						}
					}
					grok {
						match => {
							"msg" => [
							"priority=%{WORD:priority} %{GREEDYDATA}",
							"%{GREEDYDATA} priority=%{WORD:priority} %{GREEDYDATA}"
							]
						}
					}
					grok {
						match => {
							"msg" => [
							"%{GREEDYDATA} (sent_bytes|bytes_sent)=%{INT:sent_bytes} %{GREEDYDATA}"
							]
						}
					}
					grok {
						match => {
							"msg" => [
							"%{GREEDYDATA} (recv_bytes|bytes_received|bytes_recv)=%{INT:recv_bytes} %{GREEDYDATA}"
							]
						}
					}
				  }
					#Adding common fields to logx tree structure
					mutate {
						add_field => { "[dataType]" => "firewall-sophos-xg" }
						rename => { "[device]" => "[logx][sophos][device]" }
						rename => { "[device_name]" => "[logx][sophos][device_name]" }
						rename => { "[device_id]" => "sophosDataSource" }
						rename => { "[log_id]" => "[logx][sophos][log_id]" }
						rename => { "[log_type]" => "[logx][sophos][log_type]" }
						rename => { "[log_component]" => "[logx][sophos][log_component]" }
						rename => { "[status]" => "[logx][sophos][status]" }
						rename => { "[log_subtype]" => "[logx][sophos][log_subtype]" }
						rename => { "[message]" => "[logx][sophos][message]" }