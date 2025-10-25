// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RareEarthImportBanProtocol {
    address public steward;

    struct BanEntry {
        string originCountry; // e.g. "Vietnam", "Malaysia", "China"
        bool processedByChineseEntity;
        string mineralType; // "Neodymium", "Lanthanum", "Dysprosium"
        string banStatus; // "Active", "Pending", "Exempt"
        string emotionalTag;
        bool enforced;
        bool sealed;
    }

    BanEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function enforceBan(string memory originCountry, bool processedByChineseEntity, string memory mineralType, string memory banStatus, string memory emotionalTag) external onlySteward {
        entries.push(BanEntry(originCountry, processedByChineseEntity, mineralType, banStatus, emotionalTag, true, false));
    }

    function sealBanEntry(uint256 index) external onlySteward {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getBanEntry(uint256 index) external view returns (BanEntry memory) {
        return entries[index];
    }
}
