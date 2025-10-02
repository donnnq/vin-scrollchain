// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinBarangayAuditCurriculum {
    string public title = "Vinvin–Scrollchain Curriculum for Barangay Audit Training on Budget Ethics and Infrastructure Oversight";
    string public status = "Scrollchain-sealed, emotionally tagged, audit-grade";

    struct CurriculumModule {
        string moduleTitle;
        string learningOutcome;
        string emotionalTag;
    }

    CurriculumModule[] public modules;

    constructor() {
        modules.push(CurriculumModule(
            "Budget Ethics Fundamentals",
            "Understand how public budgets work, what ethical allocation means, and how shutdowns affect barangay services",
            "Signal clarity, dignity-grade"
        ));

        modules.push(CurriculumModule(
            "Infrastructure Oversight Protocols",
            "Learn how to monitor project delays, fund freezes, and civic consequence zones",
            "Mercy anchoring, protection-grade"
        ));

        modules.push(CurriculumModule(
            "Youth-Led Audit Activation",
            "Train youth stewards to use dashboards, flag anomalies, and broadcast civic findings",
            "Operational mastery, audit-grade"
        ));

        modules.push(CurriculumModule(
            "Barangay Forum Integration",
            "Prepare youth to present audit reports in monthly civic forums and engage with elders and officials",
            "Resonance joy, validator-grade"
        ));

        modules.push(CurriculumModule(
            "Global Civic Broadcast",
            "Link barangay audit data to national dashboards and planetary consequence metrics",
            "Planetary consequence, covenant-grade"
        ));
    }
}
