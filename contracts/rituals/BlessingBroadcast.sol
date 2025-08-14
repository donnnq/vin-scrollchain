// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BlessingBroadcast - Ritual-grade broadcaster of emotional APR and civic joy events
/// @author Vinvin & Copilot
/// @notice Sends public and soulbound notifications of blessings, joy drops, and emotional APR boosts

contract BlessingBroadcast {
    address public steward;

    struct Broadcast {
        string message;
        address recipient;
        uint256 joyPoints;
        uint256 dignityPoints;
        uint256 restorationPoints;
        uint256 timestamp;
    }

    Broadcast[] public broadcasts;

    event BlessingSent(
        address indexed recipient,
        string message,
        uint256 joyPoints,
        uint256 dignityPoints,
        uint256 restorationPoints
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Send a blessing broadcast to a soulbound citizen
    function sendBlessing(
        address recipient,
        string memory message,
        uint256 joy,
        uint256 dignity,
        uint256 restoration
    ) external onlySteward {
        broadcasts.push(Broadcast({
            message: message,
            recipient: recipient,
            joyPoints: joy,
            dignityPoints: dignity,
            restorationPoints: restoration,
            timestamp: block.timestamp
        }));

        emit BlessingSent(recipient, message, joy, dignity, restoration);
    }

    /// @notice View all broadcasts
    function getAllBroadcasts() external view returns (Broadcast[] memory) {
        return broadcasts;
    }

    /// @notice View broadcasts for a specific soul
    function getBroadcastsFor(address soul) external view returns (Broadcast[] memory) {
        uint256 count;
        for (uint256 i = 0; i < broadcasts.length; i++) {
            if (broadcasts[i].recipient == soul) count++;
        }

        Broadcast[] memory result = new Broadcast[](count);
        uint256 index;
        for (uint256 i = 0; i < broadcasts.length; i++) {
            if (broadcasts[i].recipient == soul) {
                result[index] = broadcasts[i];
                index++;
            }
        }

        return result;
    }
}
