// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorReputationLedger {
    address public steward;

    struct ReputationEntry {
        string contractorName;
        string projectReference;
        string reputationSignal;
        string emotionalTag;
    }

    ReputationEntry[] public ledger;

    event ContractorReputationTagged(string contractorName, string projectReference, string reputationSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReputation(
        string memory contractorName,
        string memory projectReference,
        string memory reputationSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ReputationEntry(contractorName, projectReference, reputationSignal, emotionalTag));
        emit ContractorReputationTagged(contractorName, projectReference, reputationSignal, emotionalTag);
    }
}
