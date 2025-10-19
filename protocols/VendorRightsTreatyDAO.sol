// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorRightsTreatyDAO {
    address public admin;

    struct TreatyEntry {
        string treatyName;
        string region;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTreaty(string memory treatyName, string memory region, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(treatyName, region, protectionClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealTreatyEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
