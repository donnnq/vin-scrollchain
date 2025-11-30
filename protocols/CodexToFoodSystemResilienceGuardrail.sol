// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CodexToFoodSystemResilienceGuardrail {
    string public batchID = "1321.9.202";
    string public steward = "Vinvin";

    address public admin;

    struct Guardrail {
        string principle;     // resilience, sustainability, dignity
        string description;
        uint256 timestamp;
    }

    Guardrail[] public guardrails;

    event GuardrailCodified(string principle, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyGuardrail(string memory principle, string memory description) public onlyAdmin {
        guardrails.push(Guardrail(principle, description, block.timestamp));
        emit GuardrailCodified(principle, description);
    }

    function getGuardrail(uint256 index) public view returns (string memory principle, string memory description, uint256 timestamp) {
        Guardrail memory g = guardrails[index];
        return (g.principle, g.description, g.timestamp);
    }
}
