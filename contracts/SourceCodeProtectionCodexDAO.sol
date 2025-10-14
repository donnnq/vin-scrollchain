// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SourceCodeProtectionCodexDAO {
    address public admin;

    struct ProtectionRule {
        string repoName;
        string threatVector;
        string mitigationStrategy;
        string emotionalTag;
        bool enforced;
    }

    ProtectionRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _repoName, string memory _threatVector, string memory _mitigationStrategy, string memory _emotionalTag) external onlyAdmin {
        rules.push(ProtectionRule(_repoName, _threatVector, _mitigationStrategy, _emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (ProtectionRule memory) {
        return rules[index];
    }
}
