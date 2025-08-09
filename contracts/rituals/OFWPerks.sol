// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title OFWPerks — Sovereign perks for Overseas Filipino Workers (OFWs)
/// @author Vinvin
/// @notice Grants discounts and soulbound recognition to verified OFWs

contract OFWPerks {
    address public scrollsmith;

    struct Perk {
        uint256 remittanceDiscount;   // e.g. 10% off fees
        uint256 balikbayanBoxBonus;   // e.g. ₱1000 worth of goods
        uint256 travelSubsidy;        // e.g. ₱5000 flight aid
        uint256 homecomingRelief;     // e.g. ₱3000 welcome package
        bool isOFW;
    }

    mapping(address => Perk) public perks;

    event OFWRegistered(address indexed soul, string message);

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a soul as OFW and grant perks
    function registerOFW(address soul) external {
        require(msg.sender == scrollsmith, "Only scrollsmith");

        perks[soul] = Perk({
            remittanceDiscount: 10,
            balikbayanBoxBonus: 1000 * 1e18,
            travelSubsidy: 5000 * 1e18,
            homecomingRelief: 3000 * 1e18,
            isOFW: true
        });

        emit OFWRegistered(soul, "OFW perks activated — your sacrifice is encoded.");
    }

    /// @notice View perks
    function getPerks(address soul) external view returns (Perk memory) {
        return perks[soul];
    }

    /// @notice Check if soul is OFW
    function isOFW(address soul) external view returns (bool) {
        return perks[soul].isOFW;
    }
}
