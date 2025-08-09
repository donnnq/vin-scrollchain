// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title NorthernFlex - Logs symbolic purchases and unclaimed assets across regions
/// @author Vinvin
/// @notice Tracks economic gestures meant to signal dominance, generosity, or emotional resonance

contract NorthernFlex {
    address public scrollsmith;

    struct Flex {
        string region;
        string commodity;
        uint256 amount;
        bool claimed;
        string flexTag; // e.g. "generosity", "dominance", "healing"
        uint256 timestamp;
    }

    Flex[] public flexes;

    event FlexLogged(string region, string commodity, uint256 amount, bool claimed, string flexTag, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a symbolic purchase with optional claim status
    function logFlex(
        string calldata region,
        string calldata commodity,
        uint256 amount,
        bool claimed,
        string calldata flexTag
    ) external onlyScrollsmith {
        flexes.push(Flex(region, commodity, amount, claimed, flexTag, block.timestamp));
        emit FlexLogged(region, commodity, amount, claimed, flexTag, block.timestamp);
    }

    /// @notice View all flexes
    function getAllFlexes() external view returns (Flex[] memory) {
        return flexes;
    }
}
