// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MineralToDefenseTreatyGrid {
    address public steward;

    struct TreatyEntry {
        string mineralType; // "Neodymium", "Yttrium"
        string treatyPartner; // "Australia", "Canada", "Philippines"
        string defenseClause; // "Non-Chinese processing", "Strategic reserve sharing"
        string emotionalTag;
        bool aligned;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function alignTreaty(string memory mineralType, string memory treatyPartner, string memory defenseClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(mineralType, treatyPartner, defenseClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].aligned, "Must be aligned first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
