// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinBudgetFlyerTagalog {
    string public title = "Vinvin–Scrollchain Flyer sa Tagalog para sa Budget Restoration Awareness at Civic Audit Activation";
    string public status = "Scrollchain-sealed, emotionally tagged, barangay-grade";

    struct FlyerSection {
        string sectionTitle;
        string message;
        string emotionalTag;
    }

    FlyerSection[] public sections;

    constructor() {
        sections.push(FlyerSection(
            "Ano ang Budget Restoration?",
            "Ito ay ang pagbabalik ng mga pondo na na-freeze o na-delay dahil sa shutdown ng gobyerno. Kabilang dito ang mga proyekto sa imprastruktura, transportasyon, at tulong pinansyal.",
            "Signal clarity, dignity-grade"
        ));

        sections.push(FlyerSection(
            "Paano Apektado ang Barangay?",
            "Kapag naantala ang pondo, humihinto ang mga proyekto, tumataas ang pamasahe, at humihina ang serbisyo sa kuryente, pagkain, at pabahay.",
            "Mercy anchoring, protection-grade"
        ));

        sections.push(FlyerSection(
            "Ano ang Gagawin ng Barangay?",
            "Mag-monitor ng mga proyekto, mag-report ng epekto, at mag-audit ng mga pondo gamit ang civic dashboard.",
            "Operational mastery, audit-grade"
        ));

        sections.push(FlyerSection(
            "Papel ng Kabataan",
            "Ang kabataan ay maaaring mag-track ng budget restoration, mag-flag ng price hikes, at mag-broadcast ng civic consequence.",
            "Resonance joy, validator-grade"
        ));

        sections.push(FlyerSection(
            "Paano Mag-ulat o Magtanong?",
            "Maaaring magtanong sa barangay civic desk, youth audit team, o magpadala ng inquiry sa scrollchain dashboard.",
            "Planetary consequence, covenant-grade"
        ));
    }
}
