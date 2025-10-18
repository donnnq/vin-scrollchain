// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryRentImmunityProtocol {
    address public admin;

    struct RentEntry {
        string tenant;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    RentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRent(string memory tenant, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(RentEntry(tenant, region, emotionalTag, true, false, false));
    }

    function protectRent(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealRent(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getRentEntry(uint256 index) external view returns (RentEntry memory) {
        return entries[index];
    }
}
