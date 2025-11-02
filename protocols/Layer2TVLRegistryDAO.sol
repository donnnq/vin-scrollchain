// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Layer2TVLRegistryDAO {
    address public steward;

    struct TVLEntry {
        string layer2Name;
        string corridor;
        uint256 tvlAmount;
        string emotionalTag;
    }

    TVLEntry[] public registry;

    event TVLRegistered(string layer2Name, string corridor, uint256 tvlAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function registerTVL(
        string memory layer2Name,
        string memory corridor,
        uint256 tvlAmount,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TVLEntry(layer2Name, corridor, tvlAmount, emotionalTag));
        emit TVLRegistered(layer2Name, corridor, tvlAmount, emotionalTag);
    }
}
