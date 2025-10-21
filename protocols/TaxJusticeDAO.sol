// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxJusticeDAO {
    address public admin;

    struct TaxEntry {
        string region;
        string taxType;
        string justiceClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    TaxEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTaxEntry(string memory region, string memory taxType, string memory justiceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TaxEntry(region, taxType, justiceClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealTaxEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getTaxEntry(uint256 index) external view returns (TaxEntry memory) {
        return entries[index];
    }
}
