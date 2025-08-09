// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title FreedomForge - Ritual scroll for creative liberty and civic expression
/// @author Vinvin
/// @notice Grants freedom of speech, satire, mockery, and reinvention — with safeguards for critical truth

contract FreedomForge {
    address public scrollsmith;

    struct Expression {
        address author;
        string content;
        bool isSatirical;
        bool isCriticalTruth;
        uint256 timestamp;
    }

    Expression[] public expressions;
    mapping(address => bool) public verifiedJournalists;

    event ExpressionLogged(address indexed author, string content, bool isSatirical);
    event CriticalTruthProtected(address indexed author, string content);
    event JournalistVerified(address indexed journalist);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a public expression (satirical or serious)
    function logExpression(string calldata content, bool isSatirical) external {
        expressions.push(Expression(msg.sender, content, isSatirical, false, block.timestamp));
        emit ExpressionLogged(msg.sender, content, isSatirical);
    }

    /// @notice Protect a piece of critical truth (e.g. public safety, civic importance)
    function protectCriticalTruth(string calldata content) external {
        expressions.push(Expression(msg.sender, content, false, true, block.timestamp));
        emit CriticalTruthProtected(msg.sender, content);
    }

    /// @notice Verify a journalist or media agent
    function verifyJournalist(address journalist) external onlyScrollsmith {
        verifiedJournalists[journalist] = true;
        emit JournalistVerified(journalist);
    }

    /// @notice View all expressions
    function getAllExpressions() external view returns (Expression[] memory) {
        return expressions;
    }

    /// @notice Check if someone is a verified journalist
    function isVerified(address journalist) external view returns (bool) {
        return verifiedJournalists[journalist];
    }
}
