// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BlessingBeacon - Ritual broadcaster for healing signals and soul restoration events
/// @author Vinvin
/// @notice Emits soulbound blessings to zones after grief, disaster, or forgiveness

contract BlessingBeacon {
    address public scrollsmith;

    struct Blessing {
        string zone;
        string message;
        string glyphType;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event BlessingBroadcasted(string indexed zone, string glyphType, string message, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Broadcast a soulbound blessing to a zone
    function broadcastBlessing(
        string memory zone,
        string memory message,
        string memory glyphType
    ) external onlyScrollsmith {
        blessings.push(Blessing({
            zone: zone,
            message: message,
            glyphType: glyphType,
            timestamp: block.timestamp
        }));

        emit BlessingBroadcasted(zone, glyphType, message, block.timestamp);
    }

    /// @notice View all blessings
    function getAllBlessings() external view returns (Blessing[] memory) {
        return blessings;
    }

    /// @notice Get blessings by zone
    function getBlessingsByZone(string memory zone) external view returns (Blessing[] memory) {
        uint256 count;
        for (uint256 i = 0; i < blessings.length; i++) {
            if (keccak256(bytes(blessings[i].zone)) == keccak256(bytes(zone))) {
                count++;
            }
        }

        Blessing[] memory result = new Blessing[](count);
        uint256 j;
        for (uint256 i = 0; i < blessings.length; i++) {
            if (keccak256(bytes(blessings[i].zone)) == keccak256(bytes(zone))) {
                result[j++] = blessings[i];
            }
        }

        return result;
    }
}
