// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHTransparencyDAO {
    address public admin;

    struct TransparencyEntry {
        string projectName;
        string contractor;
        string transparencyClause;
        string emotionalTag;
        bool published;
    }

    TransparencyEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _projectName, string memory _contractor, string memory _transparencyClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(TransparencyEntry(_projectName, _contractor, _transparencyClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        registry[index].published = true;
    }

    function getEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return registry[index];
    }
}
