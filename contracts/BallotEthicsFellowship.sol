// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotEthicsFellowship {
    address public admin;

    struct FellowshipEntry {
        string electionCycle;
        string ethicsTheme;
        string emotionalTag;
        bool summoned;
        bool certified;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory electionCycle, string memory ethicsTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(electionCycle, ethicsTheme, emotionalTag, true, false));
    }

    function certifyEthics(uint256 index) external onlyAdmin {
        entries[index].certified = true;
    }

    function getFellowshipEntry(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
