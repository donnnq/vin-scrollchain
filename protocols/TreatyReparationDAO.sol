// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyReparationDAO {
    address public admin;

    struct ReparationEntry {
        string countryName;
        string treatyName;
        string reparationType;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    ReparationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReparation(string memory countryName, string memory treatyName, string memory reparationType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReparationEntry(countryName, treatyName, reparationType, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealReparationEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getReparationEntry(uint256 index) external view returns (ReparationEntry memory) {
        return entries[index];
    }
}
