// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExitStrategyCodex {
    address public steward;

    struct ExitEntry {
        string businessName;
        string originRegion;
        string exitTrigger;
        string strategyProtocol;
        string emotionalTag;
    }

    ExitEntry[] public codex;

    event ExitStrategyTagged(string businessName, string originRegion, string exitTrigger, string strategyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExitStrategy(
        string memory businessName,
        string memory originRegion,
        string memory exitTrigger,
        string memory strategyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExitEntry(businessName, originRegion, exitTrigger, strategyProtocol, emotionalTag));
        emit ExitStrategyTagged(businessName, originRegion, exitTrigger, strategyProtocol, emotionalTag);
    }
}
