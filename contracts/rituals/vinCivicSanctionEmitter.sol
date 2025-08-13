// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicSanctionEmitter {
    struct Sanction {
        string vesselName;
        string violationType;
        string region;
        uint256 penaltyLevel; // 1–10
        uint256 timestamp;
    }

    Sanction[] public sanctions;

    event SanctionTriggered(string vesselName, string violationType, string region, uint256 penaltyLevel, uint256 timestamp);

    function triggerSanction(string memory vesselName, string memory violationType, string memory region, uint256 penaltyLevel) public {
        require(penaltyLevel <= 10, "Penalty too mythic.");
        sanctions.push(Sanction(vesselName, violationType, region, penaltyLevel, block.timestamp));
        emit SanctionTriggered(vesselName, violationType, region, penaltyLevel, block.timestamp);
    }

    function getRecentSanctions(uint count) public view returns (Sanction[] memory) {
        require(count <= sanctions.length, "Not enough sanctions.");
        Sanction[] memory recent = new Sanction[](count);
        for (uint i = 0; i < count; i++) {
            recent[i] = sanctions[sanctions.length - 1 - i];
        }
        return recent;
    }
}
