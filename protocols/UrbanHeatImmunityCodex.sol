// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanHeatImmunityCodex {
    address public admin;

    struct HeatEntry {
        string zone;
        string mitigationType;
        string emotionalTag;
        bool summoned;
        bool mitigated;
        bool sealed;
    }

    HeatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHeatMitigation(string memory zone, string memory mitigationType, string memory emotionalTag) external onlyAdmin {
        entries.push(HeatEntry(zone, mitigationType, emotionalTag, true, false, false));
    }

    function confirmMitigation(uint256 index) external onlyAdmin {
        entries[index].mitigated = true;
    }

    function sealHeatMitigation(uint256 index) external onlyAdmin {
        require(entries[index].mitigated, "Must be mitigated first");
        entries[index].sealed = true;
    }

    function getHeatEntry(uint256 index) external view returns (HeatEntry memory) {
        return entries[index];
    }
}
