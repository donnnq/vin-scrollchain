// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilizationTransparencyLedger {
    address public steward;

    struct MobilizationEntry {
        string protestName;
        string participantGroup;
        string transparencyProtocol;
        string emotionalTag;
    }

    MobilizationEntry[] public ledger;

    event MobilizationTransparencyTagged(string protestName, string participantGroup, string transparencyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMobilization(
        string memory protestName,
        string memory participantGroup,
        string memory transparencyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MobilizationEntry(protestName, participantGroup, transparencyProtocol, emotionalTag));
        emit MobilizationTransparencyTagged(protestName, participantGroup, transparencyProtocol, emotionalTag);
    }
}
