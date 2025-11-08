// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialIndependenceProtectionManifest {
    address public steward;

    struct ProtectionEntry {
        string timestamp;
        string jurisdiction;
        string threatType;
        string protectionAction;
        string ruleOfLawSignal;
        string emotionalTag;
    }

    ProtectionEntry[] public manifest;

    event JudicialIndependenceProtected(string timestamp, string jurisdiction, string threatType, string protectionAction, string ruleOfLawSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectJudiciary(
        string memory timestamp,
        string memory jurisdiction,
        string memory threatType,
        string memory protectionAction,
        string memory ruleOfLawSignal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ProtectionEntry(timestamp, jurisdiction, threatType, protectionAction, ruleOfLawSignal, emotionalTag));
        emit JudicialIndependenceProtected(timestamp, jurisdiction, threatType, protectionAction, ruleOfLawSignal, emotionalTag);
    }
}
