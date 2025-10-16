// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatiricalSanctionsDAO {
    address public admin;

    struct SanctionEntry {
        string entityLabel;
        string satireClause;
        string emotionalTag;
        bool enforced;
    }

    SanctionEntry[] public sanctions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _satireClause, string memory _emotionalTag) external onlyAdmin {
        sanctions.push(SanctionEntry(_entityLabel, _satireClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        sanctions[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (SanctionEntry memory) {
        return sanctions[index];
    }
}
