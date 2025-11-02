// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayParkEquityCodex {
    address public steward;

    struct ParkClause {
        string barangay;
        string parkName;
        string equityStatus;
        string emotionalTag;
    }

    ParkClause[] public codex;

    event ParkEquityLogged(string barangay, string parkName, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logParkEquity(
        string memory barangay,
        string memory parkName,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ParkClause(barangay, parkName, equityStatus, emotionalTag));
        emit ParkEquityLogged(barangay, parkName, equityStatus, emotionalTag);
    }
}
