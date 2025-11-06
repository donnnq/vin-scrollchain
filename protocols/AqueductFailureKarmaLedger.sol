// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AqueductFailureKarmaLedger {
    address public steward;

    struct FailureEntry {
        string aqueductName;
        string failureCause;
        string civicImpact;
        string emotionalTag;
    }

    FailureEntry[] public ledger;

    event AqueductFailureTagged(string aqueductName, string failureCause, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFailure(
        string memory aqueductName,
        string memory failureCause,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FailureEntry(aqueductName, failureCause, civicImpact, emotionalTag));
        emit AqueductFailureTagged(aqueductName, failureCause, civicImpact, emotionalTag);
    }
}
