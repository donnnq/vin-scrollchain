// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthBudgetSovereigntyCodexDAO {
    address public admin;

    struct SovereigntyEntry {
        string sector;
        string purokOrBarangay;
        uint256 proposedBudget;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _sector, string memory _purokOrBarangay, uint256 _proposedBudget, string memory _emotionalTag) external onlyAdmin {
        codex.push(SovereigntyEntry(_sector, _purokOrBarangay, _proposedBudget, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return codex[index];
    }
}
