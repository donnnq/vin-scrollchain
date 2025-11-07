// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayReliefDistributionLedger {
    address public steward;

    struct ReliefEntry {
        string barangay;
        string itemType;
        uint256 quantity;
        string distributionDate;
        string sourceAgency;
    }

    ReliefEntry[] public ledger;

    event ReliefDistributed(string barangay, string itemType, uint256 quantity, string distributionDate, string sourceAgency);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRelief(
        string memory barangay,
        string memory itemType,
        uint256 quantity,
        string memory distributionDate,
        string memory sourceAgency
    ) public onlySteward {
        ledger.push(ReliefEntry(barangay, itemType, quantity, distributionDate, sourceAgency));
        emit ReliefDistributed(barangay, itemType, quantity, distributionDate, sourceAgency);
    }
}
