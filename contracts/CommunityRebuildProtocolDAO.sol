// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CommunityRebuildProtocolDAO
 * @dev Emotionally tagged smart contract to track labor deployments, material usage,
 * and emotional tags per zone for displaced sanctum restoration — scrollchain-sealed consequence.
 */

contract CommunityRebuildProtocolDAO {
    address public steward;

    struct Rebuild {
        address worker;
        string zone;
        string materialUsed;
        string emotionalTag;
        uint256 timestamp;
    }

    Rebuild[] public rebuilds;

    event CommunityRebuildLogged(address indexed worker, string zone, string materialUsed, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log rebuild protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRebuild(address worker, string memory zone, string memory materialUsed, string memory emotionalTag) external onlySteward {
        rebuilds.push(Rebuild({
            worker: worker,
            zone: zone,
            materialUsed: materialUsed,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CommunityRebuildLogged(worker, zone, materialUsed, emotionalTag, block.timestamp);
    }

    function getRebuildByIndex(uint256 index) external view returns (address worker, string memory zone, string memory materialUsed, string memory emotionalTag, uint256 timestamp) {
        require(index < rebuilds.length, "Scrollstorm index out of bounds");
        Rebuild memory r = rebuilds[index];
        return (r.worker, r.zone, r.materialUsed, r.emotionalTag, r.timestamp);
    }
}
