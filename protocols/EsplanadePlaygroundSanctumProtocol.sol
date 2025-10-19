// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadePlaygroundSanctumProtocol {
    address public admin;

    struct PlaygroundEntry {
        string zoneName;
        string equipmentType;
        string ageGroup;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    PlaygroundEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPlayground(string memory zoneName, string memory equipmentType, string memory ageGroup, string memory emotionalTag) external onlyAdmin {
        entries.push(PlaygroundEntry(zoneName, equipmentType, ageGroup, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealPlaygroundEntry(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getPlaygroundEntry(uint256 index) external view returns (PlaygroundEntry memory) {
        return entries[index];
    }
}
