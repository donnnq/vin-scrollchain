// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HomeBasedWorkCodex {
    address public steward;

    struct HomeWorkClause {
        string barangay;
        string workType;
        string connectivityStatus;
        string emotionalTag;
    }

    HomeWorkClause[] public codex;

    event HomeWorkLogged(string barangay, string workType, string connectivityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logHomeWork(
        string memory barangay,
        string memory workType,
        string memory connectivityStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(HomeWorkClause(barangay, workType, connectivityStatus, emotionalTag));
        emit HomeWorkLogged(barangay, workType, connectivityStatus, emotionalTag);
    }
}
