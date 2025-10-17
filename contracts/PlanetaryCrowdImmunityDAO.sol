// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCrowdImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string crowdZone;
        string immunityProtocol;
        string emotionalTag;
        bool deployed;
        bool granted;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployImmunity(string memory crowdZone, string memory immunityProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(crowdZone, immunityProtocol, emotionalTag, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
