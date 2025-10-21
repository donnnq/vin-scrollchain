// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalLaborMobilityProtocol {
    address public admin;

    struct MobilityEntry {
        string originCountry;
        string destinationCountry;
        string mobilityClause;
        string emotionalTag;
        bool summoned;
        bool enabled;
        bool sealed;
    }

    MobilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMobility(string memory originCountry, string memory destinationCountry, string memory mobilityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MobilityEntry(originCountry, destinationCountry, mobilityClause, emotionalTag, true, false, false));
    }

    function confirmEnablement(uint256 index) external onlyAdmin {
        entries[index].enabled = true;
    }

    function sealMobilityEntry(uint256 index) external onlyAdmin {
        require(entries[index].enabled, "Must be enabled first");
        entries[index].sealed = true;
    }

    function getMobilityEntry(uint256 index) external view returns (MobilityEntry memory) {
        return entries[index];
    }
}
