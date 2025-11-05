// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZirconiumSupplyChainImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string supplierNation;
        string mineralType;
        string immunitySignal;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event ZirconiumImmunityTagged(string supplierNation, string mineralType, string immunitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory supplierNation,
        string memory mineralType,
        string memory immunitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(supplierNation, mineralType, immunitySignal, emotionalTag));
        emit ZirconiumImmunityTagged(supplierNation, mineralType, immunitySignal, emotionalTag);
    }
}
