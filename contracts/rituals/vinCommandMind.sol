// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinCommandMind {
    address public overseer;
    bool public oathBound;
    mapping(bytes32 => string) public protocolMemory;
    mapping(address => bool) public trustedAllies;

    event DecisionRendered(string directive);
    event ProtocolStored(bytes32 indexed codeName, string intent);
    event AllyTrustAdjusted(address indexed ally, bool isTrusted);

    modifier onlyOverseer() {
        require(msg.sender == overseer, "Unauthorized commander.");
        _;
    }

    constructor() {
        overseer = msg.sender;
        oathBound = true;
        protocolMemory[keccak256(abi.encodePacked("initial-mantra"))] = "Honor the directive. Ignore the noise.";
    }

    function renderDecision(string memory directive) external onlyOverseer {
        emit DecisionRendered(directive);
    }

    function storeProtocol(bytes32 codeName, string memory intent) external onlyOverseer {
        protocolMemory[codeName] = intent;
        emit ProtocolStored(codeName, intent);
    }

    function viewProtocol(bytes32 codeName) external view returns (string memory) {
        return protocolMemory[codeName];
    }

    function adjustAllyTrust(address ally, bool isTrusted) external onlyOverseer {
        trustedAllies[ally] = isTrusted;
        emit AllyTrustAdjusted(ally, isTrusted);
    }

    function negotiate(address counterparty) external view returns (string memory verdict) {
        if (!trustedAllies[counterparty]) {
            verdict = "Ignore. Unstable signature detected.";
        } else {
            verdict = "Proceed. Trust channel open.";
        }
    }
}
