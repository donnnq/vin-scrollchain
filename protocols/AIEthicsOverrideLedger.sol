// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIEthicsOverrideLedger {
    address public steward;

    struct OverrideEntry {
        string AIEngine;
        string overrideSignal;
        string justificationProtocol;
        string emotionalTag;
    }

    OverrideEntry[] public ledger;

    event AIEthicsOverrideTagged(string AIEngine, string overrideSignal, string justificationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOverride(
        string memory AIEngine,
        string memory overrideSignal,
        string memory justificationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(OverrideEntry(AIEngine, overrideSignal, justificationProtocol, emotionalTag));
        emit AIEthicsOverrideTagged(AIEngine, overrideSignal, justificationProtocol, emotionalTag);
    }
}
