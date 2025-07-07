// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollHierarchy {
    function getRole(address agent) external view returns (uint8);
}

interface IVinScrollThrone {
    function sovereign() external view returns (address);
}

contract VinScrollBeacon {
    enum AlertType { Info, Warning, Threat, Summon, Ritual }

    struct Alert {
        AlertType alertType;
        string message;
        address triggeredBy;
        uint256 timestamp;
    }

    Alert[] public alerts;
    IVinScrollHierarchy public hierarchy;
    IVinScrollThrone public throne;
    address public immutable beaconKeeper;

    event AlertEmitted(AlertType alertType, string message, address indexed by, uint256 indexed id, uint256 timestamp);

    modifier onlyAuthorized() {
        uint8 role = hierarchy.getRole(msg.sender);
        require(
            msg.sender == throne.sovereign() || role == 1 || role == 2, // Watcher or Guardian
            "Not authorized to trigger beacon"
        );
        _;
    }

    constructor(address hierarchyAddr, address throneAddr) {
        hierarchy = IVinScrollHierarchy(hierarchyAddr);
        throne = IVinScrollThrone(throneAddr);
        beaconKeeper = msg.sender;
    }

    function emitAlert(AlertType alertType, string calldata message) external onlyAuthorized {
        alerts.push(Alert({
            alertType: alertType,
            message: message,
            triggeredBy: msg.sender,
            timestamp: block.timestamp
        }));

        emit AlertEmitted(alertType, message, msg.sender, alerts.length - 1, block.timestamp);
    }

    function getAlert(uint256 id) external view returns (Alert memory) {
        require(id < alerts.length, "Invalid alert ID");
        return alerts[id];
    }

    function totalAlerts() external view returns (uint256) {
        return alerts.length;
    }
}
