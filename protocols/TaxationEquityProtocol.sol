// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxationEquityProtocol {
    address public admin;

    struct TaxEntry {
        string category;
        string region;
        string emotionalTag;
        bool summoned;
        bool reduced;
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

    function summonTax(string memory category, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TaxEntry(category, region, emotionalTag, true, false, false));
    }

    function reduceTax(uint256 index) external onlyAdmin {
        entries[index].reduced = true;
    }

    function sealTaxRelief(uint256 index) external onlyAdmin {
        require(entries[index].reduced, "Must be reduced first");
        entries[index].sealed = true;
    }

    function getTaxEntry(uint256 index) external view returns (TaxEntry memory) {
        return entries[index];
    }
}
