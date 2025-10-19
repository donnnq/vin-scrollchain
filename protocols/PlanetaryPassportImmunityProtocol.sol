// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryPassportImmunityProtocol {
    address public admin;

    struct PassportEntry {
        string holder;
        string origin;
        string emotionalTag;
        bool summoned;
        bool immune;
        bool sealed;
    }

    PassportEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPassport(string memory holder, string memory origin, string memory emotionalTag) external onlyAdmin {
        entries.push(PassportEntry(holder, origin, emotionalTag, true, false, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getPassportEntry(uint256 index) external view returns (PassportEntry memory) {
        return entries[index];
    }
}
