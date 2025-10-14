// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicEvidenceRegistryDAO {
    address public admin;

    struct Evidence {
        string caseName;
        string source;
        string description;
        string emotionalTag;
        bool verified;
    }

    Evidence[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEvidence(string memory _caseName, string memory _source, string memory _description, string memory _emotionalTag) external onlyAdmin {
        registry.push(Evidence(_caseName, _source, _description, _emotionalTag, false));
    }

    function verifyEvidence(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getEvidence(uint256 index) external view returns (Evidence memory) {
        return registry[index];
    }
}
