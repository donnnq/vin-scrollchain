// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalMobilityLedgerProtocol {
    address public admin;

    struct MobilityEntry {
        string person;
        string corridor;
        string emotionalTag;
        bool summoned;
        bool logged;
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

    function summonMobility(string memory person, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(MobilityEntry(person, corridor, emotionalTag, true, false, false));
    }

    function logMobility(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealMobility(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getMobilityEntry(uint256 index) external view returns (MobilityEntry memory) {
        return entries[index];
    }
}
