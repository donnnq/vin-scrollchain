// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToLegislativeTransparencyGrid {
    string public batchID = "1321.9.112";
    string public steward = "Vinvin";

    address public admin;

    struct RuleChange {
        string ruleName;
        string description;
        uint256 timestamp;
        bool enacted;
    }

    mapping(bytes32 => RuleChange) public ruleRegistry;

    event RuleLogged(bytes32 indexed key, string ruleName, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRuleChange(string memory ruleName, string memory description) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(ruleName, description, block.timestamp));
        ruleRegistry[key] = RuleChange(ruleName, description, block.timestamp, true);
        emit RuleLogged(key, ruleName, description);
    }

    function getRuleChange(bytes32 key) public view returns (string memory ruleName, string memory description, uint256 timestamp, bool enacted) {
        RuleChange memory r = ruleRegistry[key];
        return (r.ruleName, r.description, r.timestamp, r.enacted);
    }
}
