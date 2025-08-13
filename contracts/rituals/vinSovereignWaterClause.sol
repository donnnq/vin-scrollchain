// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinSovereignWaterClause - A ritual-grade contract for water dignity, emergency transfers, and civic restoration
contract vinSovereignWaterClause {
    address public steward;
    uint256 public emergencyThreshold; // in cubic meters
    uint256 public transferCooldown; // in seconds
    mapping(address => bool) public verifiedReservoirs;
    mapping(address => uint256) public lastTransferTimestamp;
    mapping(address => uint256) public civicWaterCredits;

    event WaterTransferred(address indexed from, address indexed to, uint256 amount, string ritual);
    event ReservoirVerified(address indexed reservoir);
    event EmergencyDeclared(string message, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    modifier verified(address reservoir) {
        require(verifiedReservoirs[reservoir], "Reservoir not verified");
        _;
    }

    constructor(uint256 _threshold, uint256 _cooldown) {
        steward = msg.sender;
        emergencyThreshold = _threshold;
        transferCooldown = _cooldown;
    }

    function verifyReservoir(address reservoir) external onlySteward {
        verifiedReservoirs[reservoir] = true;
        emit ReservoirVerified(reservoir);
    }

    function declareEmergency(string calldata message) external onlySteward {
        emit EmergencyDeclared(message, block.timestamp);
    }

    function transferWater(address from, address to, uint256 amount, string calldata ritual) external onlySteward verified(from) verified(to) {
        require(block.timestamp >= lastTransferTimestamp[from] + transferCooldown, "Cooldown active");
        require(amount >= emergencyThreshold, "Below emergency threshold");

        civicWaterCredits[to] += amount;
        lastTransferTimestamp[from] = block.timestamp;

        emit WaterTransferred(from, to, amount, ritual);
    }

    function getCivicWaterCredit(address recipient) external view returns (uint256) {
        return civicWaterCredits[recipient];
    }
}
