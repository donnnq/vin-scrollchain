// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalSovereigntyOversightPackDAO {
    address public admin;

    struct OversightEntry {
        string entityLabel;
        string oversightClause;
        string emotionalTag;
        bool activated;
    }

    OversightEntry[] public pack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        pack.push(OversightEntry(_entityLabel, _oversightClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        pack[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return pack[index];
    }
}
