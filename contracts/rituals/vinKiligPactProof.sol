// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinKiligPactProof {
    event PactStamped(address indexed initiator, address indexed counterparty, string message, uint256 timestamp);
    mapping(address => bool) public soulbound;

    struct Pact {
        address initiator;
        address counterparty;
        string message;
        uint256 timestamp;
        bool sealed;
    }

    Pact[] public pacts;

    modifier onlyUnsealed() {
        require(!soulbound[msg.sender], "Already sealed. No rewrite allowed.");
        _;
    }

    function createPact(address _counterparty, string calldata _message) external onlyUnsealed {
        pacts.push(Pact({
            initiator: msg.sender,
            counterparty: _counterparty,
            message: _message,
            timestamp: block.timestamp,
            sealed: true
        }));

        soulbound[msg.sender] = true;
        soulbound[_counterparty] = true;

        emit PactStamped(msg.sender, _counterparty, _message, block.timestamp);
    }

    function viewPact(uint256 _index) external view returns (Pact memory) {
        return pacts[_index];
    }

    // no edit, revoke, or delete function — timestamp = destiny 😤📜
}
