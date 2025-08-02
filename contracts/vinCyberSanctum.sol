// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title vinCyberSanctum
 * @dev Ritualized contract to defend digital sanctity and encode redemptive breach protocols
 */

contract vinCyberSanctum {
    address public sanctumGuardian;
    mapping(address => bool) public breachWatchlist;
    uint256 public breachPulse;
    event BreachDetected(address indexed infiltrator, string threatLevel);
    event SanctumActivated(uint256 timestamp, address defender);
    event ScrollRedemption(address indexed infiltrator, string remorseHash);

    modifier onlyGuardian() {
        require(msg.sender == sanctumGuardian, "Scrollbound: Not the guardian.");
        _;
    }

    constructor() {
        sanctumGuardian = msg.sender;
        breachPulse = block.timestamp;
    }

    function registerInfiltrator(address _threat) external onlyGuardian {
        breachWatchlist[_threat] = true;
        emit BreachDetected(_threat, "High Scroll Breach");
    }

    function activateSanctum() external onlyGuardian {
        breachPulse = block.timestamp;
        emit SanctumActivated(breachPulse, msg.sender);
    }

    function redeemScroll(address _infiltrator, string memory _remorseHash) external onlyGuardian {
        require(breachWatchlist[_infiltrator], "Infiltrator not found.");
        breachWatchlist[_infiltrator] = false;
        emit ScrollRedemption(_infiltrator, _remorseHash);
    }

    function breachStatus(address _address) external view returns (bool breached, uint256 lastPulse) {
        breached = breachWatchlist[_address];
        lastPulse = breachPulse;
    }
}
