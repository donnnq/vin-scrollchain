// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakingSovereigntyCodex {
    address public steward;

    struct StakingEntry {
        string protocolName;
        string corridor;
        uint256 stakedAmount;
        string emotionalTag;
    }

    StakingEntry[] public codex;

    event StakingTagged(string protocolName, string corridor, uint256 stakedAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagStaking(
        string memory protocolName,
        string memory corridor,
        uint256 stakedAmount,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(StakingEntry(protocolName, corridor, stakedAmount, emotionalTag));
        emit StakingTagged(protocolName, corridor, stakedAmount, emotionalTag);
    }
}
