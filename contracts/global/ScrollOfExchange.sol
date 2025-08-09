// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollOfExchange - Tracks cultural and civic impact of global trade exchanges
/// @author Vinvin
/// @notice Logs symbolic resonance, emotional value, and civic upgrades triggered by imports/exports

contract ScrollOfExchange {
    address public scrollsmith;

    struct Exchange {
        string originCountry;
        string destinationCountry;
        string commodity;
        uint256 quantity;
        string emotionalTag; // e.g. "healing", "joy", "nostalgia"
        string civicImpact;  // e.g. "urban renewal", "education boost"
        uint256 timestamp;
    }

    Exchange[] public exchanges;

    event ExchangeLogged(
        string originCountry,
        string destinationCountry,
        string commodity,
        uint256 quantity,
        string emotionalTag,
        string civicImpact,
        uint256 timestamp
    );

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a new exchange with emotional and civic metadata
    function logExchange(
        string calldata originCountry,
        string calldata destinationCountry,
        string calldata commodity,
        uint256 quantity,
        string calldata emotionalTag,
        string calldata civicImpact
    ) external onlyScrollsmith {
        exchanges.push(Exchange(
            originCountry,
            destinationCountry,
            commodity,
            quantity,
            emotionalTag,
            civicImpact,
            block.timestamp
        ));

        emit ExchangeLogged(originCountry, destinationCountry, commodity, quantity, emotionalTag, civicImpact, block.timestamp);
    }

    /// @notice View all logged exchanges
    function getAllExchanges() external view returns (Exchange[] memory) {
        return exchanges;
    }
}
