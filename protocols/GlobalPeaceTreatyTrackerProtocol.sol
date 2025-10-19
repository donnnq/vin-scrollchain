// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalPeaceTreatyTrackerProtocol {
    address public admin;

    struct TreatyEntry {
        string initiative;
        string region;
        string emotionalTag;
        bool summoned;
        bool tracked;
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

    function summonTreaty(string memory initiative, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(initiative, region, emotionalTag, true, false, false));
    }

    function trackTreaty(uint256 index) external onlyAdmin {
        entries[index].tracked = true;
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
