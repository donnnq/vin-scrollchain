// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostDisasterImpactIndex {
    address public steward;

    struct ImpactEntry {
        string region;
        uint256 displacedFamilies;
        uint256 infrastructureDamage;
        uint256 cropLoss;
        string timestamp;
        string emotionalTag;
    }

    ImpactEntry[] public index;

    event ImpactLogged(string region, uint256 displacedFamilies, uint256 infrastructureDamage, uint256 cropLoss, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImpact(
        string memory region,
        uint256 displacedFamilies,
        uint256 infrastructureDamage,
        uint256 cropLoss,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImpactEntry(region, displacedFamilies, infrastructureDamage, cropLoss, timestamp, emotionalTag));
        emit ImpactLogged(region, displacedFamilies, infrastructureDamage, cropLoss, timestamp, emotionalTag);
    }
}
