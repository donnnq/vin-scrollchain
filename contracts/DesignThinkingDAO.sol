// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DesignThinkingDAO {
    address public admin;

    struct DesignEntry {
        string teamName;
        string challengeTheme;
        string emotionalTag;
        bool framed;
        bool pitched;
    }

    DesignEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function frameChallenge(string memory teamName, string memory challengeTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(DesignEntry(teamName, challengeTheme, emotionalTag, true, false));
    }

    function markPitched(uint256 index) external onlyAdmin {
        entries[index].pitched = true;
    }

    function getDesignEntry(uint256 index) external view returns (DesignEntry memory) {
        return entries[index];
    }
}
