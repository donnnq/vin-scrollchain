// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToReparationsGovernanceProtocol {
    string public batchID = "1321.9.103";
    string public steward = "Vinvin";

    address public admin;

    struct Decision {
        string description;
        uint256 amount;
        string purpose;
        uint256 timestamp;
    }

    Decision[] public decisions;

    event DecisionMade(string description, uint256 amount, string purpose);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function makeDecision(string memory description, uint256 amount, string memory purpose) public onlyAdmin {
        decisions.push(Decision(description, amount, purpose, block.timestamp));
        emit DecisionMade(description, amount, purpose);
    }

    function getDecision(uint256 index) public view returns (string memory description, uint256 amount, string memory purpose, uint256 timestamp) {
        Decision memory d = decisions[index];
        return (d.description, d.amount, d.purpose, d.timestamp);
    }
}
