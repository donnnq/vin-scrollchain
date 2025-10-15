// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandSovereigntyImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string landLabel;
        string immunityClause;
        string emotionalTag;
        bool activated;
    }

    ImmunityEntry[] public pack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _landLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        pack.push(ImmunityEntry(_landLabel, _immunityClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        pack[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return pack[index];
    }
}
