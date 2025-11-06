// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RelocationTransparencyLedger {
    address public steward;

    struct RelocationEntry {
        string projectName;
        string familyName;
        string compensationStatus;
        string consultationProtocol;
        string emotionalTag;
    }

    RelocationEntry[] public ledger;

    event RelocationTagged(string projectName, string familyName, string compensationStatus, string consultationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelocation(
        string memory projectName,
        string memory familyName,
        string memory compensationStatus,
        string memory consultationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RelocationEntry(projectName, familyName, compensationStatus, consultationProtocol, emotionalTag));
        emit RelocationTagged(projectName, familyName, compensationStatus, consultationProtocol, emotionalTag);
    }
}
