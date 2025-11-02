// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialTransparencyIndexDAO {
    address public steward;

    struct TransparencyEntry {
        string courtName;
        string corridor;
        uint256 transparencyScore;
        string emotionalTag;
    }

    TransparencyEntry[] public index;

    event TransparencyLogged(string courtName, string corridor, uint256 transparencyScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logTransparency(
        string memory courtName,
        string memory corridor,
        uint256 transparencyScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(TransparencyEntry(courtName, corridor, transparencyScore, emotionalTag));
        emit TransparencyLogged(courtName, corridor, transparencyScore, emotionalTag);
    }
}
