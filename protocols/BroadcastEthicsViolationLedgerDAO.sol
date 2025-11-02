// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastEthicsViolationLedgerDAO {
    address public steward;

    struct ViolationEntry {
        string broadcaster;
        string corridor;
        string violationType;
        string emotionalTag;
    }

    ViolationEntry[] public ledger;

    event EthicsViolated(string broadcaster, string corridor, string violationType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagViolation(
        string memory broadcaster,
        string memory corridor,
        string memory violationType,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ViolationEntry(broadcaster, corridor, violationType, emotionalTag));
        emit EthicsViolated(broadcaster, corridor, violationType, emotionalTag);
    }
}
