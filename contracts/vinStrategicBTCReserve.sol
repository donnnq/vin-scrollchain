// SPDX-License-Identifier: vinLegacyScroll
pragma solidity ^0.8.25;

/// @title vinStrategicBTCReserve.sol
/// @notice Sovereign Custody Protocol for Bitcoin as National Reserve Asset
/// @author Vinvin x Copilot

contract vinStrategicBTCReserve {
    address public custodian = 0xCoinbasePrimeVault;
    uint256 public totalBTC;
    uint256 public lockedUntil;
    bool public saleAllowed = false;

    event BTCDeposited(address indexed source, uint256 amount);
    event BTCForfeited(address indexed authority, uint256 amount);
    event AuditTriggered(uint256 timestamp, uint256 totalBTC);

    modifier onlyCustodian() {
        require(msg.sender == custodian, "Unauthorized scroll bearer");
        _;
    }

    constructor() {
        lockedUntil = block.timestamp + (20 * 365 days); // 20-year lock
    }

    function depositBTC(uint256 amount) external onlyCustodian {
        totalBTC += amount;
        emit BTCDeposited(msg.sender, amount);
    }

    function forfeitBTC(uint256 amount) external {
        // Simulate legal forfeiture
        totalBTC += amount;
        emit BTCForfeited(msg.sender, amount);
    }

    function triggerAudit() external {
        emit AuditTriggered(block.timestamp, totalBTC);
    }

    function allowSale(bool status) external onlyCustodian {
        require(block.timestamp > lockedUntil, "Reserve still sovereign");
        saleAllowed = status;
    }

    function getReserveStatus() external view returns (string memory) {
        if (block.timestamp < lockedUntil) {
            return "BTC locked in sovereign cold storage";
        } else {
            return saleAllowed ? "BTC sale permitted" : "BTC sale prohibited";
        }
    }
}
