// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterWellnessCodex {
    address public admin;

    struct WellnessEntry {
        string dockName;
        string amenityType;
        string wellnessClause;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    WellnessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWellness(string memory dockName, string memory amenityType, string memory wellnessClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WellnessEntry(dockName, amenityType, wellnessClause, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealWellnessEntry(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getWellnessEntry(uint256 index) external view returns (WellnessEntry memory) {
        return entries[index];
    }
}
