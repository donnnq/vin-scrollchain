// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerProtectionDAO {
    address public steward;

    struct ProtectionEntry {
        string watchdogName;
        string protectionAction;
        string cartelSignal;
        string emotionalTag;
    }

    ProtectionEntry[] public registry;

    event ConsumerProtectionTagged(string watchdogName, string protectionAction, string cartelSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProtection(
        string memory watchdogName,
        string memory protectionAction,
        string memory cartelSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ProtectionEntry(watchdogName, protectionAction, cartelSignal, emotionalTag));
        emit ConsumerProtectionTagged(watchdogName, protectionAction, cartelSignal, emotionalTag);
    }
}
