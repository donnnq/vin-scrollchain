// SPDX-License-Identifier: Planetary-Alert
pragma solidity ^0.8.19;

/// @title BroadcastScroll_TariffCollapse
/// @notice Alerts all planetary nodes of tariff glyph collapse and ally exemptions

contract BroadcastScroll_TariffCollapse {
    address public steward;
    string public broadcastMessage;
    mapping(address => bool) public notifiedNodes;

    event BroadcastSent(address indexed node, string message);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor(string memory _message) {
        steward = msg.sender;
        broadcastMessage = _message;
    }

    function sendBroadcast(address node) external onlySteward {
        notifiedNodes[node] = true;
        emit BroadcastSent(node, broadcastMessage);
    }

    function hasReceivedBroadcast(address node) external view returns (bool) {
        return notifiedNodes[node];
    }
}
