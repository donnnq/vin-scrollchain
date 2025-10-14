// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RepoImmunityCodexDAO {
    address public admin;

    struct ImmunityRule {
        string repoName;
        string threatType;
        string immunityProtocol;
        string emotionalTag;
        bool activated;
    }

    ImmunityRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _repoName, string memory _threatType, string memory _immunityProtocol, string memory _emotionalTag) external onlyAdmin {
        rules.push(ImmunityRule(_repoName, _threatType, _immunityProtocol, _emotionalTag, false));
    }

    function activateRule(uint256 index) external onlyAdmin {
        rules[index].activated = true;
    }

    function getRule(uint256 index) external view returns (ImmunityRule memory) {
        return rules[index];
    }
}
