// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CodexToEquityGuardrail {
    string public batchID = "1321.9.144";
    string public steward = "Vinvin";

    address public admin;

    struct Guardrail {
        string clause;
        string description;
        uint256 timestamp;
    }

    Guardrail[] public guardrails;

    event GuardrailCodified(string clause, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyGuardrail(string memory clause, string memory description) public onlyAdmin {
        guardrails.push(Guardrail(clause, description, block.timestamp));
        emit GuardrailCodified(clause, description);
    }

    function getGuardrail(uint256 index) public view returns (string memory clause, string memory description, uint256 timestamp) {
        Guardrail memory g = guardrails[index];
        return (g.clause, g.description, g.timestamp);
    }
}
