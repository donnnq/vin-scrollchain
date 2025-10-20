// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlatTaxOverrideDAO {
    address public admin;

    struct TaxOverrideEntry {
        string taxpayerType;
        uint256 proposedRate;
        string overrideClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    TaxOverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory taxpayerType, uint256 proposedRate, string memory overrideClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TaxOverrideEntry(taxpayerType, proposedRate, overrideClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (TaxOverrideEntry memory) {
        return entries[index];
    }
}
