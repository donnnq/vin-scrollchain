// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorBlessingDAO {
    address public admin;

    struct BlessingEntry {
        string district;
        string vendorType;
        string blessingClause;
        string emotionalTag;
        bool summoned;
        bool blessed;
        bool sealed;
    }

    BlessingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBlessing(string memory district, string memory vendorType, string memory blessingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BlessingEntry(district, vendorType, blessingClause, emotionalTag, true, false, false));
    }

    function confirmBlessing(uint256 index) external onlyAdmin {
        entries[index].blessed = true;
    }

    function sealBlessingEntry(uint256 index) external onlyAdmin {
        require(entries[index].blessed, "Must be blessed first");
        entries[index].sealed = true;
    }

    function getBlessingEntry(uint256 index) external view returns (BlessingEntry memory) {
        return entries[index];
    }
}
