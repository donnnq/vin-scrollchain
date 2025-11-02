// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborDignityIndexDAO {
    address public steward;

    struct DignityEntry {
        string unionName;
        string corridor;
        uint256 dignityScore;
        string emotionalTag;
    }

    DignityEntry[] public index;

    event DignityLogged(string unionName, string corridor, uint256 dignityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logDignity(
        string memory unionName,
        string memory corridor,
        uint256 dignityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DignityEntry(unionName, corridor, dignityScore, emotionalTag));
        emit DignityLogged(unionName, corridor, dignityScore, emotionalTag);
    }
}
