// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CodexToSovereigntyGuardrail {
    string public batchID = "1321.9.124";
    string public steward = "Vinvin";

    address public admin;

    struct Guardrail {
        string country;
        string clause;
        uint256 timestamp;
    }

    Guardrail[] public guardrails;

    event GuardrailCodified(string country, string clause);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyGuardrail(string memory country, string memory clause) public onlyAdmin {
        guardrails.push(Guardrail(country, clause, block.timestamp));
        emit GuardrailCodified(country, clause);
    }

    function getGuardrail(uint256 index) public view returns (string memory country, string memory clause, uint256 timestamp) {
        Guardrail memory g = guardrails[index];
        return (g.country, g.clause, g.timestamp);
    }
}
