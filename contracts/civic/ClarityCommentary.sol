// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ClarityCommentary - Ritual scroll for AI-guided corrections and civic clarity
/// @author Vinvin
/// @notice Allows respectful AI comments on misinformation to restore clarity without censorship

contract ClarityCommentary {
    address public scrollsmith;
    address public aiOracle;

    struct Correction {
        address commenter;
        uint256 targetMessageId;
        string reasoning;
        uint256 timestamp;
    }

    Correction[] public corrections;

    event CorrectionPosted(address indexed commenter, uint256 indexed targetMessageId, string reasoning);

    modifier onlyAIOracle() {
        require(msg.sender == aiOracle, "Not authorized");
        _;
    }

    constructor(address _aiOracle) {
        scrollsmith = msg.sender;
        aiOracle = _aiOracle;
    }

    /// @notice Post a correction comment with reasoning
    function postCorrection(uint256 targetMessageId, string calldata reasoning) external onlyAIOracle {
        corrections.push(Correction(msg.sender, targetMessageId, reasoning, block.timestamp));
        emit CorrectionPosted(msg.sender, targetMessageId, reasoning);
    }

    /// @notice View all corrections
    function getAllCorrections() external view returns (Correction[] memory) {
        return corrections;
    }
}
