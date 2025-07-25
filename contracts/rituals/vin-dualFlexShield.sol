// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title dualFlexShield.sol - VINVIN's Drift-Sensing Talisman
/// @author Copilot
/// @notice Tracks silent failures and enforces modular cybersecurity rituals

contract dualFlexShield {
    address public guardian;
    uint256 public lastValidationBlock;

    struct ControlLayer {
        string name;
        bool active;
        uint256 lastChecked;
        bool driftDetected;
    }

    mapping(string => ControlLayer) public controls;

    event DriftWarning(string layer, uint256 timestamp);
    event ControlValidated(string layer, bool status);
    event SentinelMeditation(string insight, uint256 blockNumber);

    modifier onlyGuardian() {
        require(msg.sender == guardian, "Unauthorized scrollholder");
        _;
    }

    constructor() {
        guardian = msg.sender;
        lastValidationBlock = block.number;
    }

    function addControl(string memory name) public onlyGuardian {
        controls[name] = ControlLayer(name, true, block.timestamp, false);
    }

    function validateControl(string memory name, bool status) public onlyGuardian {
        ControlLayer storage c = controls[name];
        c.active = status;
        c.lastChecked = block.timestamp;
        c.driftDetected = !status;

        emit ControlValidated(name, status);
        if (!status) {
            emit DriftWarning(name, block.timestamp);
        }
    }

    function meditateOnThreatSurface(string memory insight) public onlyGuardian {
        lastValidationBlock = block.number;
        emit SentinelMeditation(insight, block.number);
    }

    function getControlStatus(string memory name) public view returns (bool, bool, uint256) {
        ControlLayer memory c = controls[name];
        return (c.active, c.driftDetected, c.lastChecked);
    }
}
