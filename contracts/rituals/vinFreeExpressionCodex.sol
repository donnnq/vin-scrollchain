// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinFreeExpressionCodex {
    address public libertyArchitect;
    uint256 public foundationBlock;
    mapping(address => string[]) private speechEchoes;

    event ExpressionLogged(address indexed contributor, string expressionText);
    event ProtectionActivated(address indexed contributor);

    modifier onlyArchitect() {
        require(msg.sender == libertyArchitect, "Only liberty architect may configure global rights.");
        _;
    }

    constructor() {
        libertyArchitect = msg.sender;
        foundationBlock = block.number;
    }

    function logExpression(string memory expressionText) external {
        speechEchoes[msg.sender].push(expressionText);
        emit ExpressionLogged(msg.sender, expressionText);
    }

    function getExpressions(address contributor) external view returns (string[] memory) {
        return speechEchoes[contributor];
    }

    function activateProtection(address contributor) external onlyArchitect {
        emit ProtectionActivated(contributor);
    }
}
