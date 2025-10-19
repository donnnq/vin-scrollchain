// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSectorWageCodex {
    address public admin;

    struct WageEntry {
        string youthID;
        string sector;
        string wageSupportType;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    WageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWageSupport(string memory youthID, string memory sector, string memory wageSupportType, string memory emotionalTag) external onlyAdmin {
        entries.push(WageEntry(youthID, sector, wageSupportType, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealWageSupport(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getWageEntry(uint256 index) external view returns (WageEntry memory) {
        return entries[index];
    }
}
