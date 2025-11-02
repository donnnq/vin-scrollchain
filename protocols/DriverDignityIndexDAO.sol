// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DriverDignityIndexDAO {
    address public steward;

    struct DignityEntry {
        string driverName;
        string corridor;
        uint256 dignityScore;
        string emotionalTag;
    }

    DignityEntry[] public index;

    event DignityLogged(string driverName, string corridor, uint256 dignityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logDignity(
        string memory driverName,
        string memory corridor,
        uint256 dignityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DignityEntry(driverName, corridor, dignityScore, emotionalTag));
        emit DignityLogged(driverName, corridor, dignityScore, emotionalTag);
    }
}
