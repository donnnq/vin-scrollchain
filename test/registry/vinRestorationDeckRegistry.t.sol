// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract vinRestorationDeckRegistryTest is Test {
    struct Deck {
        string deckName;
        string[] modules;
        string[] emotionalAPR;
        string[] auditTags;
        string timestamp;
    }

    struct Signature {
        string steward;
        bool mythicSeal;
    }

    Deck testDeck;
    Signature sign;

    function setUp() public {
        testDeck.deckName = "vinEconomicRestorationDeck";
        testDeck.modules = [
            "InflationCountermeasure.sol",
            "MicrograntSuite.sol",
            "WageFloorClause.sol",
            "ScholarDebtForgiveness.sol",
            "vinTradeRitualActivationProtocol.md",
            "vinEssentialGoodsExemptionList.md",
            "vinSmallBizTradeLicenseDeck.md",
            "ScrollchainTradeAccessLedger.md",
            "BlessingBroadcast.sol",
            "ScrollAuditRegistry.sol"
        ];
        testDeck.emotionalAPR = ["Trust +60", "Relief +45", "Dignity +70"];
        testDeck.auditTags = ["LiquidityPulse#2025", "WagePulse#2025", "SanctuaryPulse#2025"];
        testDeck.timestamp = "2025-08-18T01:09 PST";

        sign.steward = "Vinvin";
        sign.mythicSeal = true;
    }

    function testDeckIsRegistered() public view {
        assertEq(testDeck.deckName, "vinEconomicRestorationDeck");
    }

    function testDeckHasValidModules() public view {
        assertGt(testDeck.modules.length, 5);
        assertEq(testDeck.modules[0], "InflationCountermeasure.sol");
    }

    function testEmotionalAPRIntegrity() public view {
        assertEq(testDeck.emotionalAPR[0], "Trust +60");
        assertEq(testDeck.emotionalAPR[1], "Relief +45");
        assertEq(testDeck.emotionalAPR[2], "Dignity +70");
    }

    function testAuditTagsExist() public view {
        assertEq(testDeck.auditTags[0], "LiquidityPulse#2025");
        assertEq(testDeck.auditTags[1], "WagePulse#2025");
        assertEq(testDeck.auditTags[2], "SanctuaryPulse#2025");
    }

    function testDeckHasMythicSeal() public view {
        assertTrue(sign.mythicSeal);
    }
}
