// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CodexToStablecoinRegulatoryGuardrail {
    string public batchID = "1321.9.123";
    string public steward = "Vinvin";

    address public admin;

    struct Guardrail {
        string jurisdiction;
        string rule;
        uint256 timestamp;
    }

    Guardrail[] public guardrails;

    event GuardrailCodified(string jurisdiction, string rule);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyRule(string memory jurisdiction, string memory rule) public onlyAdmin {
        guardrails.push(Guardrail(jurisdiction, rule, block.timestamp));
        emit GuardrailCodified(jurisdiction, rule);
    }

    function getRule(uint256 index) public view returns (string memory jurisdiction, string memory rule, uint256 timestamp) {
        Guardrail memory g = guardrails[index];
        return (g.jurisdiction, g.rule, g.timestamp);
    }
}
