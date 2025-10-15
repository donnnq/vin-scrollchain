// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlOversightDAO {
    address public admin;

    struct OversightEntry {
        string projectLabel;
        string oversightClause;
        string emotionalTag;
        bool activated;
    }

    OversightEntry[] public oversight;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOversight(string memory _projectLabel, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        oversight.push(OversightEntry(_projectLabel, _oversightClause, _emotionalTag, false));
    }

    function activateOversight(uint256 index) external onlyAdmin {
        oversight[index].activated = true;
    }

    function getOversight(uint256 index) external view returns (OversightEntry memory) {
        return oversight[index];
    }
}
