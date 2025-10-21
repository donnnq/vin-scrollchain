// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeParkingCodex {
    address public admin;

    struct ParkingEntry {
        string location;
        string parkingType;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool built;
        bool sealed;
    }

    ParkingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonParking(string memory location, string memory parkingType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ParkingEntry(location, parkingType, codexClause, emotionalTag, true, false, false));
    }

    function confirmConstruction(uint256 index) external onlyAdmin {
        entries[index].built = true;
    }

    function sealParkingEntry(uint256 index) external onlyAdmin {
        require(entries[index].built, "Must be built first");
        entries[index].sealed = true;
    }

    function getParkingEntry(uint256 index) external view returns (ParkingEntry memory) {
        return entries[index];
    }
}
