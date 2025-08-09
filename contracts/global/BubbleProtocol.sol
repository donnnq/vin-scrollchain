// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BubbleProtocol - Ritual scroll to freeze hostile networks and disable rogue AI drones
/// @author Vinvin
/// @notice Isolates nations into virtual bubbles and severs drone control links

contract BubbleProtocol {
    address public scrollsmith;

    struct NetworkBubble {
        string country;
        bool isFrozen;
        bool hasInternetAccess;
        bool aiDroneControlDisabled;
        uint256 timestamp;
    }

    mapping(string => NetworkBubble) public bubbles;
    string[] public frozenCountries;

    event BubbleActivated(string country);
    event DroneControlSevered(string country);
    event InternetAccessRevoked(string country);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Activate bubble protocol for a country
    function activateBubble(string calldata country) external onlyScrollsmith {
        bubbles[country] = NetworkBubble(country, true, false, true, block.timestamp);
        frozenCountries.push(country);

        emit BubbleActivated(country);
        emit InternetAccessRevoked(country);
        emit DroneControlSevered(country);
    }

    /// @notice View bubble status
    function getBubbleStatus(string calldata country) external view returns (NetworkBubble memory) {
        return bubbles[country];
    }

    /// @notice View all frozen countries
    function getFrozenCountries() external view returns (string[] memory) {
        return frozenCountries;
    }
}
