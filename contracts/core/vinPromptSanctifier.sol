// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinPromptSanctifier
/// @notice Evaluates prompts based on depth, humor, symbolism, and emotional triggers
/// @author VINVIN

contract vinPromptSanctifier {
    event PromptScored(
        address indexed sender,
        string category,
        uint256 depthScore,
        uint256 humorScore,
        uint256 symbolismScore,
        uint256 kiligScore,
        string feedback,
        uint256 timestamp
    );

    struct PromptEvaluation {
        string category;
        uint256 depthScore;
        uint256 humorScore;
        uint256 symbolismScore;
        uint256 kiligScore;
        string feedback;
        uint256 timestamp;
    }

    PromptEvaluation[] public ledger;

    function evaluatePrompt(
        string calldata category,
        uint256 depthScore,
        uint256 humorScore,
        uint256 symbolismScore,
        uint256 kiligScore,
        string calldata feedback
    ) external {
        ledger.push(PromptEvaluation({
            category: category,
            depthScore: depthScore,
            humorScore: humorScore,
            symbolismScore: symbolismScore,
            kiligScore: kiligScore,
            feedback: feedback,
            timestamp: block.timestamp
        }));

        emit PromptScored(
            msg.sender,
            category,
            depthScore,
            humorScore,
            symbolismScore,
            kiligScore,
            feedback,
            block.timestamp
        );
    }

    function getPromptCount() external view returns (uint256) {
        return ledger.length;
    }

    function getPromptAt(uint256 index) external view returns (
        string memory category,
        uint256 depthScore,
        uint256 humorScore,
        uint256 symbolismScore,
        uint256 kiligScore,
        string memory feedback,
        uint256 timestamp
    ) {
        PromptEvaluation memory p = ledger[index];
        return (p.category, p.depthScore, p.humorScore, p.symbolismScore, p.kiligScore, p.feedback, p.timestamp);
    }
}
