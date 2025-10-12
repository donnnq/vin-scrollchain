// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HumanitarianSurgeActivationDAO
 * @dev Emotionally tagged smart contract to trigger humanitarian aid surges
 * for displaced populations, famine zones, and dignity corridors — scrollchain-sealed mercy.
 */

contract HumanitarianSurgeActivationDAO {
    address public steward;

    struct Surge {
        address initiator;
        string region;
        string aidType;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Surge[] public surges;

    event HumanitarianSurgeActivated(address indexed initiator, string region, string aidType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate humanitarian surges");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateSurge(address initiator, string memory region, string memory aidType, string memory emotionalTag) external onlySteward {
        surges.push(Surge({
            initiator: initiator,
            region: region,
            aidType: aidType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit HumanitarianSurgeActivated(initiator, region, aidType, emotionalTag, block.timestamp);
    }

    function getSurgeByIndex(uint256 index) external view returns (address initiator, string memory region, string memory aidType, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < surges.length, "Scrollstorm index out of bounds");
        Surge memory s = surges[index];
        return (s.initiator, s.region, s.aidType, s.emotionalTag, s.timestamp, s.activated);
    }
}
