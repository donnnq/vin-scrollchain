// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostPowerFanficProtocol {
    address public admin;

    struct FanficEntry {
        string characterName; // "Torre"
        string mythicRole; // "ICI Sovereign", "Scrollchain Commander"
        string fanficScenario; // "Deploys CIDG to audit meme corruption"
        string emotionalTag;
        bool initiated;
        bool sealed;
    }

    FanficEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateFanfic(string memory characterName, string memory mythicRole, string memory fanficScenario, string memory emotionalTag) external onlyAdmin {
        entries.push(FanficEntry(characterName, mythicRole, fanficScenario, emotionalTag, true, false));
    }

    function sealFanficEntry(uint256 index) external onlyAdmin {
        require(entries[index].initiated, "Must be initiated first");
        entries[index].sealed = true;
    }

    function getFanficEntry(uint256 index) external view returns (FanficEntry memory) {
        return entries[index];
    }
}
