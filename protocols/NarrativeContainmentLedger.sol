// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeContainmentLedger {
    address public steward;

    struct ContainmentEntry {
        string narrativeTheme;
        string distortionVector;
        string containmentProtocol;
        string emotionalTag;
    }

    ContainmentEntry[] public ledger;

    event NarrativeContained(string narrativeTheme, string distortionVector, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory narrativeTheme,
        string memory distortionVector,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ContainmentEntry(narrativeTheme, distortionVector, containmentProtocol, emotionalTag));
        emit NarrativeContained(narrativeTheme, distortionVector, containmentProtocol, emotionalTag);
    }
}
