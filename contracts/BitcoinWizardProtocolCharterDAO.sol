// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BitcoinWizardProtocolCharterDAO {
    address public steward;

    struct WizardEvent {
        string wizardName; // "Adam Livingston", "Saylor", "Vinvin"
        string thesisTitle; // "The Bitcoin Age", "The Great Harvest", "Scrollstorm Sovereignty"
        string protocolClause; // "BTC Yield", "Credit Issuance", "Call Option Ritual"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    WizardEvent[] public events;

    event WizardLogged(
        string wizardName,
        string thesisTitle,
        string protocolClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Protocol Origin may log wizard protocol rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logWizard(
        string memory wizardName,
        string memory thesisTitle,
        string memory protocolClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(WizardEvent({
            wizardName: wizardName,
            thesisTitle: thesisTitle,
            protocolClause: protocolClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit WizardLogged(wizardName, thesisTitle, protocolClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getWizardByIndex(uint256 index) external view returns (
        string memory wizardName,
        string memory thesisTitle,
        string memory protocolClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        WizardEvent memory w = events[index];
        return (
            w.wizardName,
            w.thesisTitle,
            w.protocolClause,
            w.clauseStatus,
            w.emotionalTag,
            w.timestamp
        );
    }
}
