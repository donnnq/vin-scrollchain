// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IMFTreatyOverrideCodex {
    address public admin;

    struct OverrideEntry {
        string countryName;
        string treatyName;
        string overrideReason;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory countryName, string memory treatyName, string memory overrideReason, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(countryName, treatyName, overrideReason, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
