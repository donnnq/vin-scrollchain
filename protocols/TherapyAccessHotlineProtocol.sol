// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TherapyAccessHotlineProtocol {
    address public admin;

    struct HotlineEntry {
        string region;
        string hotlineNumber;
        string serviceType;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    HotlineEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHotline(string memory region, string memory hotlineNumber, string memory serviceType, string memory emotionalTag) external onlyAdmin {
        entries.push(HotlineEntry(region, hotlineNumber, serviceType, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealHotlineEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getHotlineEntry(uint256 index) external view returns (HotlineEntry memory) {
        return entries[index];
    }
}
