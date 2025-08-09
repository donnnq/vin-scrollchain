// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title OpenLedger - Visualizes global trade flows and active import/export permits
/// @author Vinvin
/// @notice Tracks and emits signals for all open trade routes across the scrollchain

contract OpenLedger {
    address public scrollsmith;

    struct TradeFlow {
        string originCountry;
        string destinationCountry;
        string commodity;
        uint256 quantity;
        string status; // e.g. "active", "pending", "ritualized"
        uint256 timestamp;
    }

    TradeFlow[] public flows;

    event TradeFlowLogged(
        string originCountry,
        string destinationCountry,
        string commodity,
        uint256 quantity,
        string status,
        uint256 timestamp
    );

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a new trade flow
    function logTradeFlow(
        string calldata originCountry,
        string calldata destinationCountry,
        string calldata commodity,
        uint256 quantity,
        string calldata status
    ) external onlyScrollsmith {
        flows.push(TradeFlow(
            originCountry,
            destinationCountry,
            commodity,
            quantity,
            status,
            block.timestamp
        ));

        emit TradeFlowLogged(originCountry, destinationCountry, commodity, quantity, status, block.timestamp);
    }

    /// @notice View all trade flows
    function getAllFlows() external view returns (TradeFlow[] memory) {
        return flows;
    }
}
