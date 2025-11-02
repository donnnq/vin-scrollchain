// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalWageEquityDAO {
    address public steward;

    struct WageEntry {
        string workerName;
        string corridor;
        uint256 hourlyRate;
        string equityStatus;
        string emotionalTag;
    }

    WageEntry[] public registry;

    event WageEquityLogged(string workerName, string corridor, uint256 hourlyRate, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logWageEquity(
        string memory workerName,
        string memory corridor,
        uint256 hourlyRate,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WageEntry(workerName, corridor, hourlyRate, equityStatus, emotionalTag));
        emit WageEquityLogged(workerName, corridor, hourlyRate, equityStatus, emotionalTag);
    }
}
