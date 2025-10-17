// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicRouteImmunityFellowship {
    address public admin;

    struct FellowshipEntry {
        string routeName;
        string immunityProtocol;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory routeName, string memory immunityProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(routeName, immunityProtocol, emotionalTag, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getFellowshipEntry(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
