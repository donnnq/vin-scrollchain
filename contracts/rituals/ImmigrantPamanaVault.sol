// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ImmigrantPamanaVault - Legacy vault for immigrant contributions and civic impact
/// @author Vinvin & Copilot
/// @notice Stores soulbound records of sacrifice, service, and restoration

contract ImmigrantPamanaVault {
    address public steward;

    struct PamanaRecord {
        string name;
        string contribution;
        string legacyMessage;
        bool immortalized;
    }

    mapping(address => PamanaRecord) public pamanaVault;
    address[] public legends;

    event PamanaImmortalized(address indexed citizen, string contribution);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function immortalizePamana(address citizen, string memory name, string memory contribution, string memory legacyMessage) external onlySteward {
        pamanaVault[citizen] = PamanaRecord({
            name: name,
            contribution: contribution,
            legacyMessage: legacyMessage,
            immortalized: true
        });
        legends.push(citizen);
        emit PamanaImmortalized(citizen, contribution);
    }

    function getPamana(address citizen) external view returns (PamanaRecord memory) {
        return pamanaVault[citizen];
    }

    function totalLegends() external view returns (uint256) {
        return legends.length;
    }
}
