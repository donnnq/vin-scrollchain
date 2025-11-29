// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEthicalGuardrailsLedger {
    string public batchID = "1321.9.183";
    string public steward = "Vinvin";

    address public admin;

    struct EthicalRule {
        string principle;   // transparency, fairness, accountability
        string description;
        uint256 timestamp;
    }

    EthicalRule[] public rules;

    event RuleLogged(string principle, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRule(string memory principle, string memory description) public onlyAdmin {
        rules.push(EthicalRule(principle, description, block.timestamp));
        emit RuleLogged(principle, description);
    }

    function getRule(uint256 index) public view returns (string memory principle, string memory description, uint256 timestamp) {
        EthicalRule memory r = rules[index];
        return (r.principle, r.description, r.timestamp);
    }
}
