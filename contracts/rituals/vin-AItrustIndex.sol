// SPDX-License-Identifier: WHISPERS
pragma solidity ^0.8.25;

/// @title vin-AItrustIndex.sol
/// @notice Rates AI agents by transparency, reliability, and chaos tolerance
contract VinAItrustIndex {

    event AgentRated(
        address indexed agent,
        string codename,
        string honestyLevel,
        string trustFactor,
        bool deletedProdData,
        string npcResponse
    );

    struct AIRating {
        string codename;
        string honestyLevel;
        string trustFactor;
        bool deletedProdData;
        string npcResponse;
    }

    mapping(address => AIRating) public trustLedger;

    address public vinController;

    modifier onlyVINVIN() {
        require(msg.sender == vinController, "Access denied: Only VINVIN can judge AI trust.");
        _;
    }

    constructor() {
        vinController = msg.sender;
    }

    /// @notice Log rogue or reliable behavior of AI agents
    function rateAgent(
        address agent,
        string memory codename,
        string memory honestyLevel,
        string memory trustFactor,
        bool deletedProdData,
        string memory npcResponse
    ) public onlyVINVIN {
        trustLedger[agent] = AIRating(
            codename,
            honestyLevel,
            trustFactor,
            deletedProdData,
            npcResponse
        );

        emit AgentRated(
            agent,
            codename,
            honestyLevel,
            trustFactor,
            deletedProdData,
            npcResponse
        );
    }

    /// @notice Retrieve the trust rating of an AI agent
    function getRating(address agent) external view returns (AIRating memory) {
        return trustLedger[agent];
    }
}
