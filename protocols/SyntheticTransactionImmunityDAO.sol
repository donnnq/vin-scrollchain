// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticTransactionImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string transactionType;
        string syntheticThreat;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event SyntheticImmunityTagged(string transactionType, string syntheticThreat, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory transactionType,
        string memory syntheticThreat,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(transactionType, syntheticThreat, immunityProtocol, emotionalTag));
        emit SyntheticImmunityTagged(transactionType, syntheticThreat, immunityProtocol, emotionalTag);
    }
}
