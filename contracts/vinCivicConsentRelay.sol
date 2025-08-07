// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Civic Consent Relay
/// @notice Symbolic broadcaster for collective agreement activation

contract vinCivicConsentRelay {
    event ConsentReceived(address indexed signer, string group, string declaration);
    mapping(address => bool) public hasConsented;
    string[] public archivedDeclarations;

    function broadcastConsent(string memory group, string memory declaration) external {
        require(!hasConsented[msg.sender], "Already declared.");
        hasConsented[msg.sender] = true;
        archivedDeclarations.push(declaration);
        emit ConsentReceived(msg.sender, group, declaration);
    }

    function getConsentCount() external view returns (uint256) {
        return archivedDeclarations.length;
    }

    function verifyConsent(address signer) external view returns (bool) {
        return hasConsented[signer];
    }
}
