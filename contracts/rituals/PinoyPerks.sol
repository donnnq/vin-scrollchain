// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PinoyPerks — Discount module for Filipino citizens on scrollchain infrastructure
/// @author Vinvin
/// @notice Grants automatic discounts on oil, water, electricity, food, and civic services

contract PinoyPerks {
    address public scrollsmith;

    struct Perk {
        uint256 oilDiscount;        // e.g. 20% off
        uint256 waterDiscount;
        uint256 electricityDiscount;
        uint256 foodDiscount;
        uint256 gymDiscount;
        bool isPinoy;
    }

    mapping(address => Perk) public perks;

    event PerksGranted(address indexed soul, string message);

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a soul as Pinoy and grant perks
    function registerPinoy(address soul) external {
        require(msg.sender == scrollsmith, "Only scrollsmith");

        perks[soul] = Perk({
            oilDiscount: 20,
            waterDiscount: 15,
            electricityDiscount: 10,
            foodDiscount: 25,
            gymDiscount: 50,
            isPinoy: true
        });

        emit PerksGranted(soul, "Pinoy perks activated — sovereign discount applied.");
    }

    /// @notice View perks
    function getPerks(address soul) external view returns (Perk memory) {
        return perks[soul];
    }

    /// @notice Check if soul is Pinoy
    function isPinoy(address soul) external view returns (bool) {
        return perks[soul].isPinoy;
    }
}
