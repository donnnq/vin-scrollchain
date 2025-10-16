// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTaxImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string barangayLabel;
        string exemptionClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangayLabel, string memory _exemptionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_barangayLabel, _exemptionClause, _emotionalTag, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        codex[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
